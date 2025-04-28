using CredentialManagement; // 添加 CredentialManagement 命名空间
using FrpcUI.Class;
using Newtonsoft.Json;
using System;
using System.Diagnostics;
using System.IO;
using System.IO.IsolatedStorage;
using System.Windows;
using System.Windows.Media;
using System.Windows.Navigation;

namespace FrpcUI
{
    public partial class App : Application
    {
        public static Process FrpcProcess { get; set; }
        private const string CredentialTarget = "FrpcUI"; // 凭据唯一标识
        private const string LoginStateFile = "loginState.json"; // 非敏感数据存储文件
        private const int WindowWidth = 900;
        private const int WindowHeight = 550;
        public static Window MainWindowInstance { get; set; }

        /// <summary>
        /// 检查并删除过期的登录状态（基于凭据管理器）
        /// </summary>
        bool CheckIfCredentialExpired()
        {
            try
            {
                // 1. 检查凭据是否存在
                using (var cred = new Credential { Target = "FrpcUI" })
                {
                    if (!cred.Load()) return true;
                }

                // 2. 读取最后更新时间
                using var isoFile = IsolatedStorageFile.GetUserStoreForApplication();
                if (!isoFile.FileExists("loginState.json")) return true;

                using var stream = isoFile.OpenFile("loginState.json", FileMode.Open);
                if (stream.Length == 0) return true;

                using var reader = new StreamReader(stream);
                string json = reader.ReadToEnd();

                // 假设JSON结构包含LastUpdateTime字段
                var data = JsonConvert.DeserializeObject<LoginState>(json);
                if (data?.LastUpdateTime == null) return true;

                // 3. 判断是否超过有效期
                return (DateTime.Now - data.LastUpdateTime.Value).TotalDays > 5;
            }
            catch
            {
                return true;
            }
        }

        class LoginState
        {
            public DateTime? LastUpdateTime { get; set; }
        }

        /// <summary>
        /// 从凭据管理器和隔离存储加载完整登录状态
        /// </summary>
        public LoginModel LoadLoginState()
        {
            var loginModel = new LoginModel();
            try
            {
                

                // 1. 从凭据管理器读取用户名和密码
                using (var cred = new Credential())
                {
                    cred.Target = CredentialTarget;
                    if (cred.Load())
                    {
                        loginModel.Token = cred.Password;
                    }
                    else
                    {
                        return null; // 没有找到凭据
                    }
                }

                // 2. 从隔离存储读取其他非敏感数据
                IsolatedStorageFile isoFile = IsolatedStorageFile.GetUserStoreForApplication();
                if (isoFile.FileExists("loginState.json"))
                {
                    using (var stream = new IsolatedStorageFileStream("loginState.json", FileMode.Open, isoFile))
                    using (var reader = new StreamReader(stream))
                    {
                        string json = reader.ReadToEnd();
                        var data = JsonConvert.DeserializeObject<dynamic>(json);
                        loginModel.Msg = data.Msg;
                        loginModel.Mail = data.Mail;
                        loginModel.UserImg = data.UserImg;
                        loginModel.RealName = data.RealName;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"加载登录状态失败: {ex.Message}");
                return null;
            }
            return loginModel;
        }

        /// <summary>
        /// 删除保存的登录状态（凭据+非敏感数据）
        /// </summary>
        public bool DeleteLoginState()
        {
            try
            {
                bool deleted = false;

                // 1. 删除凭据
                using (var cred = new Credential())
                {
                    cred.Target = CredentialTarget;
                    deleted = cred.Delete();
                }

                // 2. 删除非敏感数据文件
                using var isoFile = IsolatedStorageFile.GetUserStoreForApplication();
                if (isoFile.FileExists(LoginStateFile))
                {
                    isoFile.DeleteFile(LoginStateFile);
                    deleted = true;
                }

                return deleted;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"删除登录状态失败: {ex.Message}");
                return false;
            }
        }

        private NavigationWindow CreateLoginWindow()
        {
            return new NavigationWindow
            {
                Source = new Uri("Pages/LoginPage.xaml", UriKind.Relative),
                WindowStyle = WindowStyle.None,
                AllowsTransparency = true,
                Background = Brushes.Transparent,
                Width = WindowWidth,
                Height = WindowHeight,
                Style = (Style)FindResource("HiddenNavigationStyle")
            };
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            try
            {
                // 检查并删除过期登录状态
                if(CheckIfCredentialExpired()) DeleteLoginState();

                var savedLogin = LoadLoginState();

                if (savedLogin?.Msg == "登录成功")
                {
                    MainWindowInstance = new MainWindow();
                }
                else
                {
                    MainWindowInstance = CreateLoginWindow();
                }

                MainWindowInstance.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"应用程序启动失败: {ex.Message}", "错误",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                Shutdown();
            }
        }
    }
}