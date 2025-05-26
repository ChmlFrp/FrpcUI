using FrpcUI.Class.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace FrpcUI.Windows
{
    /// <summary>
    /// TencentSecret.xaml 的交互逻辑
    /// </summary>
    public partial class TencentSecret : Window
    {
        public TencentSecret()
        {
            InitializeComponent();
        }

        private void SaveTencentKey()
        {
            try
            {
                // 将SecretId和SecretKey转换为SecureString
                SecureString secretIdSecure = new SecureString();
                foreach (char c in SecretId.Password) secretIdSecure.AppendChar(c);
                secretIdSecure.MakeReadOnly();

                SecureString secretKeySecure = new SecureString();
                foreach (char c in SecretKey.Password) secretKeySecure.AppendChar(c);
                secretKeySecure.MakeReadOnly();

                // 存储到Windows凭据管理器
                CredentialManager.SaveCredential("FrpcUI_SecretId", "TencentSecretId", secretIdSecure);
                CredentialManager.SaveCredential("FrpcUI_SecretKey", "TencentSecretKey", secretKeySecure);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"保存密钥时出错: {ex.Message}");
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(SecretId.Password) || string.IsNullOrEmpty(SecretKey.Password))
            {
                MessageBox.Show("SecretId和SecretKey不能为空！");
                return;
            }
            else
            {
                SaveTencentKey();
                
                this.Close();
            }
        }

        private async void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            // 从Windows凭据管理器读取
            try
            {
                // 使用工厂方法创建实例
                var vm = await TencentViewModel.CreateAsync();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"加载失败: {ex.Message}");
            }

            this.Close();
        }
    }
}
