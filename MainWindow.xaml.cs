using FrpcUI.Pages;
using System;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media.Animation;
using System.Windows.Navigation;

namespace FrpcUI
{
    public partial class MainWindow : Window
    {
        private readonly NotifyIcon _notifyIcon;
        private bool _minimizeToTray;

        public ObservableCollection<UserProfile> UserProfiles { get; }

        private readonly HomePage _homePage = new();
        private SuiDaoPage _suiDaoPage;
        private Peizhiwenjian _peizhiwenjianPage;
        private GuangyuPage _guangyuPage;
        private SettingPage _settingsPage;
        private YuMingPage _yumingPage;

        private const int AnimationDurationMs = 200;

        public MainWindow()
        {
            InitializeComponent();

            _notifyIcon = CreateTrayIcon();
            PagesNavigation.Navigated += PagesNavigation_Navigated;

            var savedLogin = ((App)System.Windows.Application.Current).LoadLoginState();
            UserProfiles = new ObservableCollection<UserProfile>
            {
                new UserProfile(savedLogin.RealName, savedLogin.Mail, savedLogin.UserImg)
            };
            DataContext = this;

            PagesNavigation.NavigationUIVisibility = NavigationUIVisibility.Hidden;
            PagesNavigation.Navigate(_homePage);
        }

        #region 页面导航

        private void NavigatePage<T>(ref T pageInstance) where T : Page, new()
        {
            pageInstance ??= new T();
            PagesNavigation.Navigate(pageInstance);
        }

        private void rdHome_Click(object sender, RoutedEventArgs e) => PagesNavigation.Navigate(_homePage);
        private void SuiDaoLieBiao_Click(object sender, RoutedEventArgs e) => NavigatePage(ref _suiDaoPage);
        private void Peizhiwenjian_Click(object sender, RoutedEventArgs e) => NavigatePage(ref _peizhiwenjianPage);
        private void GuanYU_Click(object sender, RoutedEventArgs e) => NavigatePage(ref _guangyuPage);
        private void Settings_Click(object sender, RoutedEventArgs e) => NavigatePage(ref _settingsPage);
        private void YuMing_Click(object sender, RoutedEventArgs e) => NavigatePage(ref _yumingPage);


        #endregion

        #region 托盘图标

        private NotifyIcon CreateTrayIcon()
        {
            var tray = new NotifyIcon
            {
                Icon = System.Drawing.Icon.ExtractAssociatedIcon(System.Windows.Forms.Application.ExecutablePath),
                Visible = false,
                Text = "Frpc UI"
            };

            tray.DoubleClick += (s, e) => RestoreWindow();

            var contextMenu = new ContextMenuStrip();
            contextMenu.Items.Add("打开主窗口", null, (s, e) => RestoreWindow());
            contextMenu.Items.Add("退出", null, (s, e) => CloseApplication());

            tray.ContextMenuStrip = contextMenu;

            return tray;
        }

        private void RestoreWindow()
        {
            Show();
            WindowState = WindowState.Normal;
            _notifyIcon.Visible = false;
        }

        private void CloseApplication()
        {
            _notifyIcon.Visible = false;
            Close();
        }

        #endregion

        #region 窗口事件

        protected override void OnStateChanged(EventArgs e)
        {
            if (_minimizeToTray && WindowState == WindowState.Minimized)
            {
                _notifyIcon.Visible = true;
                Hide();
            }
            base.OnStateChanged(e);
        }

        protected override void OnClosing(System.ComponentModel.CancelEventArgs e)
        {
            _notifyIcon?.Dispose();
            base.OnClosing(e);
        }

        private void PagesNavigation_Navigated(object sender, NavigationEventArgs e)
        {
            if (e.Content is SettingPage settingPage)
            {
                if (_settingsPage != null)
                    _settingsPage.MinimizeToTrayChanged -= SettingPage_MinimizeToTrayChanged;

                _settingsPage = settingPage;
                _settingsPage.MinimizeToTrayChanged += SettingPage_MinimizeToTrayChanged;
            }
        }

        private void SettingPage_MinimizeToTrayChanged(object sender, EventArgs e)
        {
            if (_settingsPage != null)
            {
                _minimizeToTray = _settingsPage.IsMinimizeToTray;
            }
        }

        #endregion

        #region 动画控制

        private void btnPageClose_Click(object sender, RoutedEventArgs e)
        {
            var fadeOut = new DoubleAnimation(1, 0, TimeSpan.FromMilliseconds(AnimationDurationMs));
            fadeOut.Completed += (s, _) => Close();
            this.BeginAnimation(OpacityProperty, fadeOut);
        }


        private void btnPageRestore_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowState = WindowState.Normal;
            }
            else
            {
                WindowState = WindowState.Maximized;
            }
        }


        private void btnPageMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }



        #endregion

        #region 辅助功能


        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
                DragMove();
        }

        private void PagesNavigation_MouseDown(object sender, MouseButtonEventArgs e)
        {
            e.Handled = true;
        }

        private void SuiDao_Click(object sender, RoutedEventArgs e)
        {
            if (rdSub1.IsChecked == true || rdSub2.IsChecked == true) return;

            SubButtonsPanel.Visibility = Visibility.Visible;
            SubButtonsPanel.BeginAnimation(HeightProperty, new DoubleAnimation(0, 100, TimeSpan.FromMilliseconds(300)));
        }

        private void UnSuiDao_Click(object sender, RoutedEventArgs e)
        {
            if (rdSub1.IsChecked == true || rdSub2.IsChecked == true) return;

            var collapse = new DoubleAnimation(SubButtonsPanel.ActualHeight, 0, TimeSpan.FromMilliseconds(300));
            collapse.Completed += (s, _) => SubButtonsPanel.Visibility = Visibility.Collapsed;
            SubButtonsPanel.BeginAnimation(HeightProperty, collapse);
        }

        #endregion
    }

    public record UserProfile(string Name, string Mail, string UserImg);
}
