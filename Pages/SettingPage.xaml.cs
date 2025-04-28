using System;
using System.Windows;
using System.Windows.Controls;

namespace FrpcUI.Pages
{
    /// <summary>
    /// Setting.xaml 的交互逻辑
    /// </summary>
    public partial class SettingPage : Page
    {
        // 定义一个事件来通知 MainWindow
        public event EventHandler MinimizeToTrayChanged;

        public SettingPage()
        {
            InitializeComponent();
        }

        // 选中时触发
        private void OnMinimizeChecked(object sender, RoutedEventArgs e)
        {
            MinimizeToTrayChanged?.Invoke(this, EventArgs.Empty);
        }

        // 取消选中时触发
        private void OnMinimizeUnchecked(object sender, RoutedEventArgs e)
        {
            MinimizeToTrayChanged?.Invoke(this, EventArgs.Empty);
        }

    }
}
