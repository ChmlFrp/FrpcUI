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
        public SettingPage()
        {
            InitializeComponent();
        }
        public event EventHandler MinimizeToTrayChanged;
        private bool _isMinimizeToTray;

        public bool IsMinimizeToTray
        {
            get => _isMinimizeToTray;
            private set
            {
                if (_isMinimizeToTray != value)
                {
                    _isMinimizeToTray = value;
                    MinimizeToTrayChanged?.Invoke(this, EventArgs.Empty);
                }
            }
        }

        private void OnMinimizeChecked(object sender, RoutedEventArgs e)
        {
            IsMinimizeToTray = true;
        }

        private void OnMinimizeUnchecked(object sender, RoutedEventArgs e)
        {
            IsMinimizeToTray = false;
        }

    }
}
