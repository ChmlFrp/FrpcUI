using FrpcUI.Class.Model;
using System;
using System.Collections.ObjectModel;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using TencentCloud.Common;
using TencentCloud.Common.Profile;
using TencentCloud.Dnspod.V20210323;
using TencentCloud.Dnspod.V20210323.Models;

namespace FrpcUI.Class.ViewModel
{
    public class TencentViewModel
    {
        public ObservableCollection<TencentModel> TencentModels { get; } = new ObservableCollection<TencentModel>();

        public static async Task<TencentViewModel> CreateAsync()
        {
            var vm = new TencentViewModel();
            await vm.LoadDataAsync(); // 调用实例方法
            return vm;
        }


        private TencentViewModel() { }

        [DllImport("kernel32.dll", EntryPoint = "RtlZeroMemory", SetLastError = false)]
        private static extern unsafe void ZeroMemory(void* dest, int size);

        private async Task LoadDataAsync()
        {
            byte[] idBytes = null;
            byte[] keyBytes = null;
            string secretId = null;
            string secretKey = null;

            try
            {
                using (SecureString storedSecretId = CredentialManager.ReadCredential("FrpcUI_SecretId"))
                using (SecureString storedSecretKey = CredentialManager.ReadCredential("FrpcUI_SecretKey"))
                {
                    idBytes = SecureStringToUtf8Bytes(storedSecretId);
                    keyBytes = SecureStringToUtf8Bytes(storedSecretKey);

                    secretId = Encoding.UTF8.GetString(idBytes);
                    secretKey = Encoding.UTF8.GetString(keyBytes);

                    var cred = new Credential
                    {
                        SecretId = secretId,
                        SecretKey = secretKey
                    };

                    var httpProfile = new HttpProfile { Endpoint = "dnspod.tencentcloudapi.com" };
                    var clientProfile = new ClientProfile { HttpProfile = httpProfile };

                    var client = new DnspodClient(cred, "", clientProfile);
                    // 获取所有域名
                    var domainResp = await client.DescribeDomainList(new DescribeDomainListRequest());
                    var domains = domainResp.DomainList;

                    foreach (var domain in domains)
                    {
                        var recordReq = new DescribeRecordListRequest
                        {
                            Domain = domain.Name
                        };

                        var recordResp = await client.DescribeRecordList(recordReq);
                        var records = recordResp.RecordList;

                        foreach (var record in records)
                        {
                            TencentModels.Add(new TencentModel
                            {
                                Name = domain.Name,
                                RecordName = record.Name,
                                RecordId = record.RecordId.ToString(),
                                Status = record.Status,
                                TTL = record.TTL.ToString(),
                                Type = record.Type,
                                UpdatedOn = record.UpdatedOn,
                                Value = record.Value
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("腾讯云 API 异常: " + ex.Message);
            }
            finally
            {
                if (idBytes != null) ZeroBytes(idBytes);
                if (keyBytes != null) ZeroBytes(keyBytes);
                secretId = null;
                secretKey = null;
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
        }

        private static byte[] SecureStringToUtf8Bytes(SecureString sstr)
        {
            if (sstr == null || sstr.Length == 0)
                return Array.Empty<byte>();

            IntPtr bstr = IntPtr.Zero;
            try
            {
                bstr = Marshal.SecureStringToBSTR(sstr);
                int length = Marshal.ReadInt32(bstr, -4);
                byte[] utf16Bytes = new byte[length];
                Marshal.Copy(bstr, utf16Bytes, 0, length);
                string temp = Encoding.Unicode.GetString(utf16Bytes);
                return Encoding.UTF8.GetBytes(temp);
            }
            finally
            {
                if (bstr != IntPtr.Zero)
                    Marshal.ZeroFreeBSTR(bstr);
            }
        }

        private static unsafe void ZeroBytes(byte[] bytes)
        {
            if (bytes == null || bytes.Length == 0)
                return;

            fixed (byte* ptr = bytes)
            {
                ZeroMemory(ptr, bytes.Length);
            }
        }
    }
}
