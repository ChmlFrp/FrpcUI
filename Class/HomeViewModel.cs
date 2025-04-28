using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows;

namespace FrpcUI.Class
{
    public class HomeViewModel : INotifyPropertyChanged
    {
        private readonly HttpClient _httpClient;
        private readonly string _folderPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Frpc");
        private FileSystemWatcher _fileSystemWatcher;
        private string _selectedIniFile;

        public ObservableCollection<HomeModel> HomeModels { get; } = new ObservableCollection<HomeModel>();
        public ObservableCollection<string> IniFiles { get; } = new ObservableCollection<string>();
        public string PreviousIniFile { get; set; }

        public string SelectedIniFile
        {
            get => _selectedIniFile;
            set
            {
                if (_selectedIniFile != value)
                {
                    _selectedIniFile = value;
                    OnPropertyChanged();
                }
            }
        }

        public HomeViewModel()
        {
            _httpClient = new HttpClient();
            LoadIniFiles();
            SetupFileSystemWatcher();
        }

        public void LoadIniFiles()
        {
            if (Directory.Exists(_folderPath))
            {
                var files = Directory.GetFiles(_folderPath, "*.ini").Select(Path.GetFileName).ToList();

                Application.Current.Dispatcher.Invoke(() =>
                {
                    IniFiles.Clear();
                    foreach (var file in files)
                    {
                        IniFiles.Add(file);
                    }
                });
            }
        }

        private void SetupFileSystemWatcher()
        {
            _fileSystemWatcher = new FileSystemWatcher(_folderPath)
            {
                NotifyFilter = NotifyFilters.FileName | NotifyFilters.LastWrite,
                Filter = "*.ini",
                EnableRaisingEvents = true
            };

            _fileSystemWatcher.Created += (s, e) => LoadIniFiles();
            _fileSystemWatcher.Deleted += (s, e) => LoadIniFiles();
            _fileSystemWatcher.Renamed += (s, e) => LoadIniFiles();
        }

        public void Cleanup()
        {
            _fileSystemWatcher?.Dispose();
            _httpClient?.Dispose();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }

        public async Task LoadUserDataAsync()
        {
            var savedLogin = ((App)Application.Current).LoadLoginState();
            if (savedLogin == null || string.IsNullOrEmpty(savedLogin.Token))
                return;

            var response = await GetUserInfoAsync(savedLogin.Token);

            if (response.Success)
            {
                Application.Current.Dispatcher.Invoke(() =>
                {
                    HomeModels.Add(response.Data);
                });
            }
            else if (response.ShouldLogout)
            {
                HandleLogout();
            }
            else
            {
                MessageBox.Show(response.ErrorMessage);
            }
        }

        private async Task<ApiResponse<HomeModel>> GetUserInfoAsync(string token)
        {
            const string apiUrl = "https://cf-v2.uapis.cn/userinfo";

            if (string.IsNullOrEmpty(token))
                return new ApiResponse<HomeModel>
                {
                    Success = false,
                    ErrorMessage = "Token is null or empty"
                };

            var postData = new Dictionary<string, string> { { "token", token } };
            var content = new FormUrlEncodedContent(postData);

            try
            {
                using (var response = await _httpClient.PostAsync(apiUrl, content))
                {
                    if (!response.IsSuccessStatusCode)
                    {
                        return new ApiResponse<HomeModel>
                        {
                            Success = false,
                            ErrorMessage = $"请求失败，状态码：{response.StatusCode}"
                        };
                    }

                    var responseBody = await response.Content.ReadAsStringAsync();
                    return ParseUserInfoResponse(responseBody);
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse<HomeModel>
                {
                    Success = false,
                    ErrorMessage = $"请求发生错误: {ex.Message}"
                };
            }
        }

        private ApiResponse<HomeModel> ParseUserInfoResponse(string responseBody)
        {
            try
            {
                var json = JObject.Parse(responseBody);
                var state = json["state"]?.ToString().ToLower();

                switch (state)
                {
                    case "success":
                        return HandleSuccessResponse(json);
                    case "fail":
                        return new ApiResponse<HomeModel>
                        {
                            Success = false,
                            ShouldLogout = true
                        };
                    default:
                        return new ApiResponse<HomeModel>
                        {
                            Success = false,
                            ErrorMessage = $"登录失败或未知状态: {state}"
                        };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse<HomeModel>
                {
                    Success = false,
                    ErrorMessage = $"解析响应失败: {ex.Message}"
                };
            }
        }

        private ApiResponse<HomeModel> HandleSuccessResponse(JObject json)
        {
            if (json["data"] is not JObject data)
            {
                return new ApiResponse<HomeModel>
                {
                    Success = false,
                    ErrorMessage = "返回的数据格式不正确，缺少'data'字段"
                };
            }

            return new ApiResponse<HomeModel>
            {
                Success = true,
                Data = new HomeModel
                {
                    Msg = json["msg"]?.ToString(),
                    Code = json["code"]?.ToObject<int>() ?? 0,
                    RealName = data["realname"]?.ToString(),
                    TunnelCount = data["tunnelCount"]?.ToString() ?? string.Empty,
                    Name = data["username"]?.ToString() ?? string.Empty,
                    Token = data["usertoken"]?.ToString() ?? string.Empty,
                    QianDao = bool.TryParse(data["qiandao"]?.ToString(), out bool qianDaoResult) ? qianDaoResult : false,
                    UserGroup = data["usergroup"]?.ToString() ?? string.Empty,
                    Integral = data["integral"]?.ToObject<int>() ?? 0,
                    AbroadBandwidth = data["abroadbandwidth"]?.ToObject<int>() ?? 0,
                    Bandwidth = data["bandwidth"]?.ToObject<int>() ?? 0,
                    QQ = data["qq"]?.ToObject<long>() ?? 0,
                    Tunnel = data["tunnel"]?.ToObject<int>() ?? 0,
                    UsedTunnel = data["usedtunnel"]?.ToObject<int>() ?? 0,
                    Mail = data["email"]?.ToString() ?? string.Empty,
                    UserID = data["userid"]?.ToObject<int>() ?? 0,
                    UserImg = data["userimg"]?.ToString() ?? string.Empty,
                    IdentityID = data["identityID"]?.ToString() ?? string.Empty,
                    DateOut = data["regtime"] == null ? (DateTime?)null : DateTime.Parse(data["regtime"].ToString())
                }
            };
        }

        private void HandleLogout()
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                var currentWindow = Application.Current.MainWindow;
                if (currentWindow != null)
                {
                    new MainWindow().Show();
                    currentWindow.Close();
                }
            });
        }
    }
}
