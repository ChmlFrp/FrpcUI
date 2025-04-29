using CredentialManagement;
using FrpcUI.Class;
using Newtonsoft.Json;
using System;
using System.Diagnostics;
using System.IO;
using System.IO.IsolatedStorage;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;



namespace FrpcUI.Pages
{
    /// <summary>
    /// LoginPage.xaml 的交互逻辑
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                Window currentWindow = Window.GetWindow(this);
                currentWindow.DragMove();
            }
        }

        private void Image_MouseUp(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void textPassword_GotFocus(object sender, RoutedEventArgs e)
        {
            txtPassword.Visibility = Visibility.Collapsed;
        }

        private void textPassword_MouseDown(object sender, MouseButtonEventArgs e)
        {
            txtPassword.Visibility = Visibility.Collapsed;
            textPassword.Focus();
        }

        // 当密码框失去焦点且内容为空时，重新显示提示文字
        private void textPassword_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(textPassword.Password))
            {
                txtPassword.Visibility = Visibility.Visible;
            }
        }

        private void textUser_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(textUser.Text))
            {
                txtUser.Visibility = Visibility.Visible;
            }
        }

        private void SaveLoginState(LoginModel login)
        {
            try
            {
                // 使用 CredentialManager 存储Token，账号密码等敏感信息不存储
                using (var cred = new Credential())
                {
                    cred.Target = "FrpcUI"; // 唯一标识
                    cred.Password = login.Token; // 可自动加密存储
                    cred.Type = CredentialType.Generic; // 通用凭据类型
                    cred.PersistanceType = PersistanceType.LocalComputer; // 存储方式（本地计算机）

                    // 保存凭据到 Windows 凭据管理器
                    if (!cred.Save())
                    {
                        MessageBox.Show("保存凭据失败，请检查权限或重试。");
                    }
                    // 保存最后更新时间到隔离存储
                    var lastUpdateTime = DateTime.Now;
                    using var isoFile = IsolatedStorageFile.GetUserStoreForApplication();
                    using var stream = new IsolatedStorageFileStream("loginState.json", FileMode.Create, isoFile);
                    using (StreamWriter writer = new StreamWriter(stream))
                    {
                        var loginWithTime = new
                        {
                            login.Msg,
                            login.UserImg,
                            login.RealName,
                            login.Mail,
                            LastUpdateTime = lastUpdateTime.ToString("O")
                        };
                        string json = JsonConvert.SerializeObject(loginWithTime);
                        writer.Write(json);
                    }


                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"保存凭据时出错: {ex.Message}");
            }
        }

        private void Signin_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                Signin_Click(sender, e);
            }
        }

        private async void Signin_Click(object sender, RoutedEventArgs e)
        {
            string userName = textUser.Text;
            string passWord = textPassword.Password;

            var loginResult = await LoginModel.LoginAsync(userName, passWord);

            if (loginResult.Success)
            {

                SaveLoginState(loginResult.LoginModel); // 存储登录状态

                Window currentWindow = Window.GetWindow(this);
                if (currentWindow != null)
                {
                    new MainWindow().Show();
                    currentWindow.Close();
                }
            }
            else
            {
                MessageBox.Show(loginResult.ErrorMessage);
            }
        }


        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Window currentWindow = Window.GetWindow(this);
            currentWindow.Close();
        }

        private void textUser_MouseDown(object sender, MouseButtonEventArgs e)
        {
            txtUser.Visibility = string.IsNullOrEmpty(txtUser.Text) ? Visibility.Visible : Visibility.Collapsed;
            textUser.Focus();
        }

        private void Button_Click_Up(object sender, RoutedEventArgs e)
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "https://panel.chmlfrp.cn/register",
                UseShellExecute = true
            });
        }
    }
}

