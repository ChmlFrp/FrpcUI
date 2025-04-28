using FrpcUI.Class;
using System;
using System.Windows;

namespace FrpcUI.Windows
{
    /// <summary>
    /// Tianjiasuidao2.xaml 的交互逻辑
    /// </summary>
    public partial class Tianjiasuidao2 : Window
    {
        public Data Data = new Data();

        public new string Name { get; } // 添加公共属性来存储 name

        public Tianjiasuidao2(String name)
        {
            Name = name;

            InitializeComponent();
            //LoadDataAsync();
            this.DataContext = new NodeViewModel(Name);

        }

        public void Close_btn(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        public void Previous_btn(object sender, RoutedEventArgs e)
        {
            // 实例化Window
            Tianjiasuidao tianjiasuiddao = new Tianjiasuidao();
            tianjiasuiddao.Show();
            this.Close();
        }

        public void Next_btn(object sender, RoutedEventArgs e)
        {
            string Jianzhan = jianzhan.Text;
            // 实例化Window
            Cuangjiansuidao cuangjiansuidao = new Cuangjiansuidao(Name, Jianzhan);
            cuangjiansuidao.Show();
            this.Close();
        }
    }
}
