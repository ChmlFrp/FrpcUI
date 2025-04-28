using FrpcUI.Class;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace FrpcUI.Windows
{
    /// <summary>
    /// 创建隧道窗口
    /// </summary>
    public partial class Cuangjiansuidao : Window
    {
        private static readonly Random _random = new Random();
        private const string RandomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        private bool _isInitializing = true;

        public string SelectedNode { get; }
        public string Jianzhan { get; }

        public Cuangjiansuidao(string name, string jianzhan)
        {
            InitializeComponent();
            SelectedNode = name;
            Jianzhan = jianzhan;
            DataContext = this;
        }

        protected override void OnContentRendered(EventArgs e)
        {
            base.OnContentRendered(e);
            _isInitializing = false;
            UpdatePortTypeControls();
        }

        private void ComboBox_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            new Tianjiasuidao().Show();
            Close();
        }

        private void PortType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (!_isInitializing)
            {
                UpdatePortTypeControls();
            }
        }

        private void UpdatePortTypeControls()
        {
            if (PortType.SelectedItem is ComboBoxItem selectedItem)
            {
                string portType = selectedItem.Content.ToString();
                bool isHttp = portType == "HTTP" || portType == "HTTPS";

                Yuming.IsReadOnly = !isHttp;
                OuterPort.IsReadOnly = isHttp;
            }
        }

        private void Queding_Click(object sender, RoutedEventArgs e)
        {
            string portType = PortType.Text;

            if (Jianzhan == "不可建站" && (portType == "HTTP" || portType == "HTTPS"))
            {
                MessageBox.Show("该节点不允许建站，请重新选择可建站节点！");
                return;
            }

            var viewModel = new CuangjianViewModel(
                tunnelName: TunnelName.Text,
                innerPort: InnerPort.Text,
                localIP: LocalIP.Text,
                portType: portType,
                outerPort: OuterPort.Text,
                selectedNode: SelectedNode,
                yuMing: Yuming.Text,
                shujujiami: DataEncryptionCheckBox.IsChecked ?? false,
                shujuyasuo: DataCompressionCheckBox.IsChecked ?? false,
                extraParams: ExtraParams.Text);

            if (viewModel.Status() == "True")
            {
                Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Previous_Click(object sender, RoutedEventArgs e)
        {
            new Tianjiasuidao2(SelectedNode).Show();
            Close();
        }

        private void RandomName_Click(object sender, RoutedEventArgs e)
        {
            TunnelName.Text = GenerateRandomString(8);
        }

        private void RandomOuterPort_Click(object sender, RoutedEventArgs e)
        {
            OuterPort.Text = _random.Next(10000, 65535).ToString();
        }

        private static string GenerateRandomString(int length)
        {
            var result = new char[length];
            for (int i = 0; i < length; i++)
            {
                result[i] = RandomChars[_random.Next(RandomChars.Length)];
            }
            return new string(result);
        }
    }
}