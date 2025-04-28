using FrpcUI.Pages;
using System;
using System.Collections.ObjectModel;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media.Animation;
using System.Windows.Navigation;
using System.Windows.Forms;
using System.Drawing;

namespace FrpcUI
{
    public partial class MainWindow : Window
    {
        private NotifyIcon _notifyIcon;

        public class UserProfile
        {
            public string Name { get; set; }
            public string Mail { get; set; }
            public string UserImg { get; set; }
        }

        public ObservableCollection<UserProfile> UserProfiles { get; set; }

        // 页面缓存（避免状态丢失）
        private HomePage _homePage;
        private SuiDaoPage _suiDaoPage;
        private Peizhiwenjian _peizhiwenjianPage;
        private GuangyuPage _guangyuPage;
        private SettingPage _settingsPage;

        public MainWindow()
        {
            InitializeComponent();
            CreateNotifyIcon();
            // 初始化用户数据
            var savedLogin = ((App)System.Windows.Application.Current).LoadLoginState();
            UserProfiles = new ObservableCollection<UserProfile>
            {
                new UserProfile { Name = savedLogin.RealName, Mail = savedLogin.Mail, UserImg = savedLogin.UserImg }
            };
            this.DataContext = this;

            // 初始化页面并导航
            _homePage = new HomePage();
            PagesNavigation.NavigationUIVisibility = NavigationUIVisibility.Hidden;
            PagesNavigation.Navigate(_homePage);
        }

        private void CreateNotifyIcon()
        {
            _notifyIcon = new NotifyIcon();
            _notifyIcon.Icon = new Icon("/图标.ico"); // 设置任务栏图标
            _notifyIcon.Visible = true;

            // 创建右键菜单
            var contextMenu = new ContextMenuStrip();
            contextMenu.Items.Add("打开", null, Open_Click);
            contextMenu.Items.Add("退出", null, Exit_Click);

            // 将右键菜单绑定到 NotifyIcon
            _notifyIcon.ContextMenuStrip = contextMenu;
        }

        private void Open_Click(object sender, EventArgs e)
        {
            this.Show();  // 显示窗口
            this.WindowState = WindowState.Normal;
        }

        private void Exit_Click(object sender, EventArgs e)
        {
            _notifyIcon.Dispose();  // 关闭通知图标
            System.Windows.Application.Current.Shutdown();  // 关闭应用程序
        }

        // 在窗口关闭时清理 NotifyIcon
        protected override void OnClosed(EventArgs e)
        {
            _notifyIcon.Dispose();
            base.OnClosed(e);
        }

        // ========= 页面导航 =========

        private void rdHome_Click(object sender, RoutedEventArgs e)
        {
            if (_homePage == null)
                _homePage = new HomePage();
            PagesNavigation.Navigate(_homePage);
        }

        private void SuiDaoLieBiao_Click(object sender, RoutedEventArgs e)
        {
            if (_suiDaoPage == null)
                _suiDaoPage = new SuiDaoPage();
            PagesNavigation.Navigate(_suiDaoPage);
        }

        private void Peizhiwenjian_Click(object sender, RoutedEventArgs e)
        {
            if (_peizhiwenjianPage == null)
                _peizhiwenjianPage = new Peizhiwenjian();
            PagesNavigation.Navigate(_peizhiwenjianPage);
        }

        private void YuMing_Click(object sender, RoutedEventArgs e)
        {
            // 添加需要时再处理
        }

        private void GuanYU_Click(object sender, RoutedEventArgs e)
        {
            if (_guangyuPage == null)
                _guangyuPage = new GuangyuPage();
            PagesNavigation.Navigate(_guangyuPage);
        }

        private void Settings_Click(object sender, RoutedEventArgs e)
        {
            if (_settingsPage == null)
                _settingsPage = new SettingPage();
            PagesNavigation.Navigate(_settingsPage);
        }

        // ========= 页面动画 =========

        private void SuiDao_Click(object sender, RoutedEventArgs e)
        {
            if (rdSub1.IsChecked == true || rdSub2.IsChecked == true)
                return;

            SubButtonsPanel.Visibility = Visibility.Visible;
            var expandAnimation = new DoubleAnimation
            {
                From = 0,
                To = 100,
                Duration = TimeSpan.FromMilliseconds(300)
            };
            SubButtonsPanel.BeginAnimation(HeightProperty, expandAnimation);
        }

        private void UnSuiDao_Click(object sender, RoutedEventArgs e)
        {
            if (rdSub1.IsChecked == true || rdSub2.IsChecked == true)
                return;

            var collapseAnimation = new DoubleAnimation
            {
                From = SubButtonsPanel.ActualHeight,
                To = 0,
                Duration = TimeSpan.FromMilliseconds(300)
            };
            collapseAnimation.Completed += (s, _) =>
            {
                SubButtonsPanel.Visibility = Visibility.Collapsed;
            };
            SubButtonsPanel.BeginAnimation(HeightProperty, collapseAnimation);
        }

        // ========= 窗口控制 =========

        [DllImport("user32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool AnimateWindow(IntPtr hwnd, int dwTime, int dwFlags);

        // 动画标志
        const int AW_HIDE = 0x00010000;        // 隐藏窗口
        const int AW_ACTIVATE = 0x00020000;    // 激活窗口
        const int AW_SLIDE = 0x00040000;       // 滑动动画
        const int AW_BLEND = 0x00080000;       // 淡入淡出动画
        const int AW_VER_POSITIVE = 0x00000004; // 自上而下
        const int AW_VER_NEGATIVE = 0x00000008; // 自下而上


        private void btnPageClose_Click(object sender, RoutedEventArgs e)
        {
            var window = Window.GetWindow(this);
            var hwnd = new WindowInteropHelper(window).Handle;

            AnimateWindow(hwnd, 200, AW_SLIDE | AW_HIDE | AW_VER_POSITIVE); // 向下滑动隐藏
            window.Close();
        }

        private void btnPageRestore_Click(object sender, RoutedEventArgs e)
        {
            var window = Window.GetWindow(this);
            var hwnd = new WindowInteropHelper(window).Handle;

            if (window != null)
            {
                if (window.WindowState == WindowState.Maximized)
                {
                    window.WindowState = WindowState.Normal;
                }
                else
                {
                    AnimateWindow(hwnd, 200, AW_BLEND); // 添加淡入动画
                    window.WindowState = WindowState.Maximized;
                }
            }
        }


        private void btnPageMinimize_Click(object sender, RoutedEventArgs e)
        {
            var window = Window.GetWindow(this);
            var hwnd = new WindowInteropHelper(window).Handle;

            AnimateWindow(hwnd, 200, AW_BLEND | AW_HIDE); // 淡出动画
            window.WindowState = WindowState.Minimized;
        }


        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
                Window.GetWindow(this)?.DragMove();
        }

        private void PagesNavigation_MouseDown(object sender, MouseButtonEventArgs e)
        {
            e.Handled = true;
        }
    }
}
