
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace FrpcUI.Services
{
    public class ApiService
    {
        private const string ApiUrl = "https://cf-v2.uapis.cn/userinfo";
        private readonly HttpClient _httpClient;

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
        }

        public async Task<ApiResponse> GetUserInfoAsync(string token)
        {
            if (string.IsNullOrEmpty(token))
                return new ApiResponse { Success = false, ErrorMessage = "Token is null or empty" };

            var postData = new Dictionary<string, string> { { "token", token } };
            var content = new FormUrlEncodedContent(postData);

            try
            {
                using (var response = await _httpClient.PostAsync(ApiUrl, content).ConfigureAwait(false))
                {
                    if (!response.IsSuccessStatusCode)
                    {
                        return new ApiResponse
                        {
                            Success = false,
                            ErrorMessage = $"发送失败，状态码：{response.StatusCode}"
                        };
                    }

                    var responseBody = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                    return ParseResponse(responseBody);
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    ErrorMessage = $"请求发生错误: {ex.Message}"
                };
            }
        }

        private ApiResponse ParseResponse(string responseBody)
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
                        return new ApiResponse { Success = false, ShouldLogout = true };
                    default:
                        return new ApiResponse
                        {
                            Success = false,
                            ErrorMessage = $"登录失败或未知状态: {state}"
                        };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    ErrorMessage = $"解析响应失败: {ex.Message}"
                };
            }
        }

        private ApiResponse HandleSuccessResponse(JObject json)
        {
            if (json["data"] is not JObject data)
            {
                return new ApiResponse
                {
                    Success = false,
                    ErrorMessage = "返回的数据格式不正确，缺少'data'字段"
                };
            }

            var userInfo = new UserInfo
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
            };

            return new ApiResponse
            {
                Success = true,
                UserInfo = userInfo
            };
        }
    }

    public class ApiResponse
    {
        public bool Success { get; set; }
        public bool ShouldLogout { get; set; }
        public string ErrorMessage { get; set; }
        public UserInfo UserInfo { get; set; }
    }

    public class UserInfo
    {
        public string Msg { get; set; }
        public int Code { get; set; }
        public string RealName { get; set; }
        public string TunnelCount { get; set; }
        public string Name { get; set; }
        public string Token { get; set; }
        public bool QianDao { get; set; }
        public string UserGroup { get; set; }
        public int Integral { get; set; }
        public int AbroadBandwidth { get; set; }
        public int Bandwidth { get; set; }
        public long QQ { get; set; }
        public int Tunnel { get; set; }
        public int UsedTunnel { get; set; }
        public string Mail { get; set; }
        public int UserID { get; set; }
        public string UserImg { get; set; }
        public string IdentityID { get; set; }
        public DateTime? DateOut { get; set; }
    }
}