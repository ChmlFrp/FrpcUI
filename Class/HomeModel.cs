using System;

namespace FrpcUI.Class
{
    public class HomeModel
    {

        public string Name { get; set; }
        public int UserID { get; set; }
        public string TunnelCount { get; set; }
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
    }

    public class ApiResponse<T>
    {
        public bool Success { get; set; }
        public bool ShouldLogout { get; set; }
        public string ErrorMessage { get; set; }
        public T Data { get; set; }
    }
}
