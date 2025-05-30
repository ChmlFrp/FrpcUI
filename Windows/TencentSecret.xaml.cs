using FrpcUI.Class.ViewModel;
using System;
using System.Security;
using System.Windows;

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

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
