using FrpcUI.Class;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace FrpcUI.Pages
{
    public partial class HomePage : Page
    {
        private static readonly Color PrimaryColor = (Color)ColorConverter.ConvertFromString("#673AB7");
        private static readonly Geometry PlayIcon = Geometry.Parse("M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20,12C20,16.41 16.41,20 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M10,16.5L16,12L10,7.5V16.5Z");
        private static readonly Geometry StopIcon = Geometry.Parse("M13,16V8H15V16H13M9,16V8H11V16H9M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4Z");

        public LogingModelViewModel ViewModel { get; }
        private readonly ConcurrentDictionary<string, (Process Process, CancellationTokenSource Cts)> _frpcProcesses = new();
        private bool _isFrpcRunning;
        private CancellationTokenSource _outputReadCancellationTokenSource;

        private readonly ConcurrentDictionary<string, (bool IsRunning, string OutputText)> _iniFileStates = new();

        public HomePage()
        {
            InitializeComponent();
            ViewModel = new LogingModelViewModel();
            DataContext = ViewModel;
            Application.Current.Exit += OnApplicationExit;

            // 启动时异步加载数据
            _ = ViewModel.LoadUserDataAsync();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            RunFrpc_Click(EditButton, new RoutedEventArgs());
        }

        // 显示或隐藏Token点击事件处理
        public void ShowToken_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Parent is Panel parent)
            {
                if (parent.FindName("token") is TextBlock token)
                {
                    token.Visibility = token.Visibility == Visibility.Visible
                        ? Visibility.Collapsed
                        : Visibility.Visible;
                }
            }
        }

        // 复制Token到剪贴板鼠标左键按下事件处理
        private void Token_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (sender is TextBlock { Text: { } text })
            {
                Clipboard.SetText(text);
            }
        }

        private void ShowLoadingGif()
        {
            LoadingGif.Visibility = Visibility.Visible;
        }

        private void HideLoadingGif()
        {
            LoadingGif.Visibility = Visibility.Collapsed;
        }

        public void Shuaxing_Click(object sender, RoutedEventArgs e)
        {
            ViewModel.LoadIniFiles();
        }

        // 运行或停止FRPC点击事件处理
        public async void RunFrpc_Click(object sender, RoutedEventArgs e)
        {
            if (sender is not Button button) return;

            var iniFileName = ViewModel.SelectedIniFile;
            if (string.IsNullOrEmpty(iniFileName))
            {
                ShowMessageBox("请先选择一个配置文件！");
                return;
            }

            if (_frpcProcesses.TryGetValue(iniFileName, out var processInfo))
            {
                // 如果已经有这个配置文件的进程在运行，则停止它
                await StopFrpcProcessAsync(iniFileName);
                UpdateButtonContent(button, "运行", PlayIcon, PrimaryColor);
                _iniFileStates[iniFileName] = (false, cmdOutput.Text);
            }
            else
            {
                ShowLoadingGif();
                await Task.Delay(500);

                bool started = await Task.Run(() => StartFrpcProcess(iniFileName));

                if (started)
                {
                    _isFrpcRunning = true;
                    UpdateButtonContent(button, "停止", StopIcon, Colors.Red);
                    _iniFileStates[iniFileName] = (true, cmdOutput.Text);
                }

                HideLoadingGif();
            }
        }

        // 添加一个方法来处理配置文件切换
        public void OnIniFileSelectionChanged()
        {
            var iniFileName = ViewModel.SelectedIniFile;
            if (string.IsNullOrEmpty(iniFileName)) return;

            // 保存当前配置文件的状态
            if (!string.IsNullOrEmpty(ViewModel.PreviousIniFile))
            {
                _iniFileStates[ViewModel.PreviousIniFile] =
                    (_frpcProcesses.ContainsKey(ViewModel.PreviousIniFile), cmdOutput.Text);
            }

            // 恢复或初始化新选择的配置文件状态
            if (_iniFileStates.TryGetValue(iniFileName, out var state))
            {
                // 恢复之前的状态
                UpdateButtonContent(EditButton, state.IsRunning ? "停止" : "运行",
                    state.IsRunning ? StopIcon : PlayIcon,
                    state.IsRunning ? Colors.Red : PrimaryColor);
                cmdOutput.Text = state.OutputText;
            }
            else
            {
                // 初始状态
                UpdateButtonContent(EditButton, "运行", PlayIcon, PrimaryColor);
                cmdOutput.Clear();
            }

            ViewModel.PreviousIniFile = iniFileName;
        }

        private void IniFile_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            OnIniFileSelectionChanged();
        }

        // 启动FRPC进程
        private bool StartFrpcProcess(string iniFileName)
        {
            try
            {
                var workingDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Frpc");
                var iniFilePath = Path.Combine(workingDir, iniFileName);
                var frpcPath = Path.Combine(workingDir, "frpc.exe");

                var process = new Process
                {
                    StartInfo = new ProcessStartInfo
                    {
                        FileName = frpcPath,
                        Arguments = $"-c \"{iniFilePath}\"",
                        RedirectStandardOutput = true,
                        UseShellExecute = false,
                        CreateNoWindow = true,
                        WorkingDirectory = workingDir
                    },
                    EnableRaisingEvents = true
                };

                var cts = new CancellationTokenSource();

                process.Exited += (s, e) =>
                {
                    Dispatcher.Invoke(() =>
                    {
                        _frpcProcesses.TryRemove(iniFileName, out _);
                        if (_frpcProcesses.IsEmpty) _isFrpcRunning = false;
                    });
                };

                if (process.Start())
                {
                    _frpcProcesses[iniFileName] = (process, cts);
                    _ = ReadOutputAsync(iniFileName, process.StandardOutput.BaseStream, cts.Token);
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                ShowMessageBox($"启动FRPC失败: {ex.Message}");
                return false;
            }
        }

        // 异步停止FRPC进程
        private async Task StopFrpcProcessAsync(string iniFileName)
        {
            if (!_frpcProcesses.TryGetValue(iniFileName, out var processInfo)) return;

            try
            {
                processInfo.Cts?.Cancel();

                if (!processInfo.Process.HasExited)
                {
                    processInfo.Process.Kill();
                    await processInfo.Process.WaitForExitAsync().ConfigureAwait(false);
                }

                cmdOutput.Clear();
            }
            catch (Exception ex)
            {
                ShowMessageBox($"停止FRPC失败: {ex.Message}");
            }
            finally
            {
                _frpcProcesses.TryRemove(iniFileName, out _);
                if (_frpcProcesses.IsEmpty) _isFrpcRunning = false;
                processInfo.Process?.Dispose();
                processInfo.Cts?.Dispose();
            }
        }

        // 异步读取FRPC进程输出
        private async Task ReadOutputAsync(string iniFileName, Stream stream, CancellationToken cancellationToken)
        {
            try
            {
                using var reader = new StreamReader(stream);
                var buffer = new char[4096];

                while (!cancellationToken.IsCancellationRequested)
                {
                    // 修改为使用正确的 ReadAsync 重载
                    var bytesRead = await reader.ReadAsync(buffer, cancellationToken);
                    if (bytesRead == 0) break;

                    var text = new string(buffer, 0, bytesRead);
                    AppendToTextBox($"[{iniFileName}] {text}");
                }
            }
            catch (OperationCanceledException)
            {
                // 正常取消
            }
            catch (Exception ex)
            {
                Dispatcher.Invoke(() => ShowMessageBox($"读取输出失败: {ex.Message}"));
            }
        }

        // 更新按钮内容
        private void UpdateButtonContent(Button button, string text, Geometry icon, Color color)
        {
            Dispatcher.Invoke(() =>
            {
                button.Content = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    Children =
                    {
                        new System.Windows.Shapes.Path
                        {
                            Data = icon,
                            Fill = new SolidColorBrush(color),
                            Height = 25,
                            Width = 25,
                            VerticalAlignment = VerticalAlignment.Center,
                            Margin = new Thickness(0, 0, 5, 0)
                        },
                        new TextBlock
                        {
                            Text = text,
                            VerticalAlignment = VerticalAlignment.Center,
                            FontSize = 16,
                            FontWeight = FontWeights.Bold,
                            Foreground = new SolidColorBrush(color)
                        }
                    }
                };
            });
        }

        // 将文本追加到命令输出文本框
        private void AppendToTextBox(string text)
        {
            Dispatcher.Invoke(() =>
            {
                cmdOutput.AppendText(text);
                cmdOutput.ScrollToEnd();
            });
        }

        // 显示消息框
        private void ShowMessageBox(string message)
        {
            Dispatcher.Invoke(() => MessageBox.Show(message));
        }

        // 应用程序退出事件处理
        private async void OnApplicationExit(object sender, ExitEventArgs e)
        {
            var tasks = new List<Task>();
            foreach (var (iniFileName, _) in _frpcProcesses.ToList())
            {
                tasks.Add(StopFrpcProcessAsync(iniFileName));
            }

            await Task.WhenAll(tasks);
            ViewModel.Cleanup();
        }
    }
}