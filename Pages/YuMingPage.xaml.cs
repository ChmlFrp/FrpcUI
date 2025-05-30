using FrpcUI.Class.ViewModel;
using FrpcUI.Windows;
using System.Windows;
using System.Windows.Controls;

namespace FrpcUI.Pages
{
    /// <summary>
    /// 域名管理页面
    /// </summary>
    public partial class YuMingPage : Page
    {
        public YuMingPage()
        {
            InitializeComponent();
            Loaded += async (s, e) =>
            {
                this.DataContext = await TencentViewModel.CreateAsync();
            };
        }

        public void addYuMing_Click(object sender, RoutedEventArgs e)
        {

        }

        public void addKey_Click(object sender, RoutedEventArgs e)
        {
            TencentSecret tencentSecret = new TencentSecret();
            tencentSecret.Style = (Style)Application.Current.Resources[typeof(Window)];
            tencentSecret.ShowDialog();
        }
    }
}
