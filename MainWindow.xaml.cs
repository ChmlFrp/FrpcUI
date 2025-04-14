using FrpcUI.Class;
using FrpcUI.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Animation;
using System.Windows.Navigation;
using UIKitTutorials.Pages;

namespace UIKitTutorials
{
    public partial class MainWindow : Window
    {
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

        public MainWindow()
        {
            InitializeComponent();

            // 初始化用户数据
            var savedLogin = ((App)Application.Current).LoadLoginState();
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

        private void btnPageClose_Click(object sender, RoutedEventArgs e)
        {
            Window.GetWindow(this)?.Close();
        }

        private void btnPageRestore_Click(object sender, RoutedEventArgs e)
        {
            var window = Window.GetWindow(this);
            if (window != null)
                window.WindowState = window.WindowState == WindowState.Maximized
                    ? WindowState.Normal
                    : WindowState.Maximized;
        }

        private void btnPageMinimize_Click(object sender, RoutedEventArgs e)
        {
            Window.GetWindow(this).WindowState = WindowState.Minimized;
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
