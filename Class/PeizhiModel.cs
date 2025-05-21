using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;

namespace FrpcUI.Class
{
    // PeizhiModel 类用于表示配置模型，并提供数据加载、处理和错误显示的功能
    public class PeizhiModel
    {
        private static readonly HttpClient _httpClient = new HttpClient();
        private const string BaseApiUrl = "https://cf-v2.uapis.cn";

        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("data")]
        public string Data { get; set; }

        [JsonProperty("msg")]
        public string Msg { get; set; }

        [JsonProperty("state")]
        public string State { get; set; }

        public string Node { get; }
        public string Name { get; }

        public ObservableCollection<PeizhiModel> PeizhiList { get; } = new ObservableCollection<PeizhiModel>();

        // 主构造函数，初始化 Node 和 Name 属性
        public PeizhiModel(string node, string name = null)
        {
            Node = node;
            Name = name;
        }

        // 异步加载数据的方法
        public async Task<string> LoadDataAsync()
        {
            try
            {
                var savedLogin = ((App)Application.Current).LoadLoginState();
                var postData = CreatePostData(savedLogin.Token);

                var response = await _httpClient.PostAsync($"{BaseApiUrl}/tunnel_config",
                    new FormUrlEncodedContent(postData));

                return await ProcessResponse(response);
            }
            catch (HttpRequestException ex)
            {
                ShowErrorMessage($"网络请求失败: {ex.Message}");
            }
            catch (JsonException ex)
            {
                ShowErrorMessage($"数据解析失败: {ex.Message}");
            }
            catch (Exception ex)
            {
                ShowErrorMessage($"发生未知错误: {ex.Message}");
            }
            return string.Empty;
        }

        // 创建POST请求数据的方法
        private Dictionary<string, string> CreatePostData(string token)
        {
            var postData = new Dictionary<string, string>
            {
                { "token", token },
                { "node", Node }
            };

            if (!string.IsNullOrEmpty(Name))
            {
                postData.Add("tunnel_names", Name);
            }

            return postData;
        }

        // 处理HTTP响应的方法
        private async Task<string> ProcessResponse(HttpResponseMessage response)
        {
            if (!response.IsSuccessStatusCode)
            {
                ShowErrorMessage($"请求失败，状态码：{response.StatusCode}");
                return string.Empty;
            }

            var responseBody = await response.Content.ReadAsStringAsync();
            var responseJson = JObject.Parse(responseBody);

            if (!ValidateResponseState(responseJson))
                return string.Empty;

            // 更新当前实例的属性
            this.Code = responseJson["code"]?.ToObject<long>() ?? 0;
            this.Data = responseJson["data"]?.ToString() ?? string.Empty;
            this.Msg = responseJson["msg"]?.ToString() ?? string.Empty;
            this.State = responseJson["state"]?.ToString() ?? string.Empty;

            return this.Data;
        }

        // 验证响应状态的方法
        private bool ValidateResponseState(JObject responseJson)
        {
            var state = responseJson["state"]?.ToString().ToLower();

            if (state == "success")
                return true;

            var errorMessage = state switch
            {
                "fail1" => "认证失败",
                "error" => "服务器错误",
                "fail" => "获取隧道失败",
                _ => $"未知的状态码：{state}"
            };

            ShowErrorMessage(errorMessage);
            return false;
        }

        // 显示错误信息的方法
        private static void ShowErrorMessage(string message)
        {
            MessageBox.Show(message, "错误", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
