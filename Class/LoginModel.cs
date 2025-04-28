using FrpcUI.Class;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;


namespace FrpcUI.Class
{
    public class LoginModel
    {
        public string Name { get; set; }
        public int UserID { get; set; }
        public string tunnelCount { get; set; }
        public string Msg { get; set; }
        public int Code { get; set; }
        public string RealName { get; set; }
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
        public string UserImg { get; set; }
        public string IdentityID { get; set; }
        public DateTime? DateOut { get; set; }


        // 添加静态方法处理登录请求
        public static async Task<LoginResult> LoginAsync(string username, string password)
        {
            const string urlAPI = "https://cf-v2.uapis.cn/login";

            var postData = new Dictionary<string, string>
            {
                { "username", username },
                { "password", password }
            };

            using (var httpClient = new HttpClient())
            {
                try
                {
                    var content = new FormUrlEncodedContent(postData);
                    using (HttpResponseMessage response = await httpClient.PostAsync(urlAPI, content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string responseBody = await response.Content.ReadAsStringAsync();
                            JObject keyValuePairs = JObject.Parse(responseBody);
                            string state = keyValuePairs["state"].ToString();

                            if (state.ToLower() == "success" && keyValuePairs["data"] != null)
                            {
                                JObject data = keyValuePairs["data"] as JObject;
                                if (data != null)
                                {
                                    return new LoginResult
                                    {
                                        Success = true,
                                        LoginModel = new LoginModel
                                        {
                                            Msg = keyValuePairs["msg"].ToString(),
                                            Code = keyValuePairs["code"].ToObject<int>(),
                                            RealName = data["username"]?.ToString() ?? string.Empty,
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
                            }

                            return new LoginResult
                            {
                                Success = false,
                                ErrorMessage = GetErrorMessage(state)
                            };
                        }

                        return new LoginResult
                        {
                            Success = false,
                            ErrorMessage = $"发送失败，状态码：{response.StatusCode}"
                        };
                    }
                }
                catch (Exception ex)
                {
                    return new LoginResult
                    {
                        Success = false,
                        ErrorMessage = $"请求发生错误: {ex.Message}"
                    };
                }
            }
        }

        private static string GetErrorMessage(string state)
        {
            switch (state.ToLower())
            {
                case "fail1":
                case "error":
                case "fail":
                    return "登录失败";
                default:
                    return $"未知的状态码：{state}";
            }
        }
    }
}

public class LoginResult
{
    public bool Success { get; set; }
    public LoginModel LoginModel { get; set; }
    public string ErrorMessage { get; set; }
}

