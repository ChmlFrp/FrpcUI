using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using System;
using CommunityToolkit.Mvvm.Input;

public class FrpcInstanceViewModel : INotifyPropertyChanged
{
    public string IniFileName { get; set; }

    private bool _isRunning;
    public bool IsRunning
    {
        get => _isRunning;
        set { _isRunning = value; OnPropertyChanged(); }
    }

    private string _outputLog;
    public string OutputLog
    {
        get => _outputLog;
        set { _outputLog = value; OnPropertyChanged(); }
    }

    public ICommand ToggleRunCommand { get; set; }

    public Process Process { get; set; }

    public FrpcInstanceViewModel()
    {
        ToggleRunCommand = new AsyncRelayCommand(ToggleFrpc);

    }

    public async Task ToggleFrpc()
    {
        if (IsRunning)
            await StopFrpc();
        else
            await StartFrpc();
    }

    private async Task StartFrpc()
    {
        try
        {
            var workingDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Frpc");
            var iniFilePath = Path.Combine(workingDir, IniFileName);
            var frpcPath = Path.Combine(workingDir, "frpc.exe");

            Process = new Process
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

            Process.Exited += (s, e) => IsRunning = false;

            if (Process.Start())
            {
                IsRunning = true;
                await Task.Run(() => ReadOutput(Process.StandardOutput));
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"启动失败: {ex.Message}");
        }
    }

    private async Task StopFrpc()
    {
        try
        {
            if (Process != null && !Process.HasExited)
            {
                Process.Kill();
                await Process.WaitForExitAsync();
            }

            IsRunning = false;
            OutputLog = "";
        }
        catch (Exception ex)
        {
            MessageBox.Show($"停止失败: {ex.Message}");
        }
    }

    private void ReadOutput(StreamReader reader)
    {
        char[] buffer = new char[4096];
        while (!reader.EndOfStream)
        {
            int read = reader.Read(buffer, 0, buffer.Length);
            if (read > 0)
            {
                string text = new string(buffer, 0, read);
                Application.Current.Dispatcher.Invoke(() =>
                {
                    OutputLog += text;
                });
            }
        }
    }

    public event PropertyChangedEventHandler PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
