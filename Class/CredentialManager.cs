using System;
using System.ComponentModel;
using System.IO;
using System.Runtime.InteropServices;
using System.Security;

public class CredentialManager
{
    private const int CRYPTPROTECT_UI_FORBIDDEN = 0x1;

    // 导入Windows API函数
    [DllImport("advapi32.dll", EntryPoint = "CredWriteW", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool CredWrite([In] ref NativeCredential userCredential, [In] uint flags);

    [DllImport("advapi32.dll", EntryPoint = "CredReadW", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool CredRead(string target, CredentialType type, int reservedFlag, out IntPtr credentialPtr);

    [DllImport("advapi32.dll", EntryPoint = "CredFree")]
    private static extern void CredFree([In] IntPtr cred);

    [DllImport("kernel32.dll")]
    private static extern IntPtr LocalFree(IntPtr hMem);

    [DllImport("crypt32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    private static extern bool CryptProtectData(
        ref DATA_BLOB pDataIn,
        string szDataDescr,
        IntPtr pOptionalEntropy,
        IntPtr pvReserved,
        IntPtr pPromptStruct,
        int dwFlags,
        out DATA_BLOB pDataOut);

    [DllImport("crypt32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    private static extern bool CryptUnprotectData(
        ref DATA_BLOB pDataIn,
        string szDataDescr,
        IntPtr pOptionalEntropy,
        IntPtr pvReserved,
        IntPtr pPromptStruct,
        int dwFlags,
        out DATA_BLOB pDataOut);

    private enum CredentialType
    {
        Generic = 1,
        DomainPassword = 2,
        DomainCertificate = 3,
        DomainVisiblePassword = 4,
        GenericCertificate = 5,
        DomainExtended = 6,
        Maximum = 7,
        MaximumEx = Maximum + 1000,
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct NativeCredential
    {
        public uint Flags;
        public CredentialType Type;
        public IntPtr TargetName;
        public IntPtr Comment;
        public System.Runtime.InteropServices.ComTypes.FILETIME LastWritten;
        public uint CredentialBlobSize;
        public IntPtr CredentialBlob;
        public uint Persist;
        public uint AttributeCount;
        public IntPtr Attributes;
        public IntPtr TargetAlias;
        public IntPtr UserName;
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct DATA_BLOB
    {
        public uint cbData;
        public IntPtr pbData;
    }

    // 加密数据（直接处理字节数组）
    public static byte[] EncryptData(byte[] data)
    {
        if (data == null || data.Length == 0)
            return null;

        DATA_BLOB dataIn = new DATA_BLOB();
        DATA_BLOB dataOut = new DATA_BLOB();

        try
        {
            dataIn.pbData = Marshal.AllocHGlobal(data.Length);
            dataIn.cbData = (uint)data.Length;
            Marshal.Copy(data, 0, dataIn.pbData, data.Length);

            if (!CryptProtectData(
                ref dataIn,
                null,
                IntPtr.Zero,
                IntPtr.Zero,
                IntPtr.Zero,
                CRYPTPROTECT_UI_FORBIDDEN,  // 添加标志
                out dataOut))
            {
                throw new System.ComponentModel.Win32Exception(Marshal.GetLastWin32Error());
            }

            byte[] encryptedData = new byte[dataOut.cbData];
            Marshal.Copy(dataOut.pbData, encryptedData, 0, (int)dataOut.cbData);

            return encryptedData;
        }
        finally
        {
            if (dataIn.pbData != IntPtr.Zero)
                Marshal.FreeHGlobal(dataIn.pbData);
            if (dataOut.pbData != IntPtr.Zero)
                LocalFree(dataOut.pbData);
        }
    }

    // 解密数据（返回原始字节数组）
    public static byte[] DecryptData(byte[] encryptedData)
    {
        if (encryptedData == null || encryptedData.Length == 0)
            return null;

        DATA_BLOB dataIn = new DATA_BLOB();
        DATA_BLOB dataOut = new DATA_BLOB();

        try
        {
            dataIn.pbData = Marshal.AllocHGlobal(encryptedData.Length);
            dataIn.cbData = (uint)encryptedData.Length;
            Marshal.Copy(encryptedData, 0, dataIn.pbData, encryptedData.Length);

            if (!CryptUnprotectData(
                ref dataIn,
                null,
                IntPtr.Zero,
                IntPtr.Zero,
                IntPtr.Zero,
                CRYPTPROTECT_UI_FORBIDDEN, // 添加标志
                out dataOut))
            {
                throw new System.ComponentModel.Win32Exception(Marshal.GetLastWin32Error());
            }

            byte[] decryptedData = new byte[dataOut.cbData];
            Marshal.Copy(dataOut.pbData, decryptedData, 0, (int)dataOut.cbData);

            return decryptedData;
        }
        finally
        {
            if (dataIn.pbData != IntPtr.Zero)
                Marshal.FreeHGlobal(dataIn.pbData);
            if (dataOut.pbData != IntPtr.Zero)
                LocalFree(dataOut.pbData);
        }
    }

    // 保存凭据（安全版本）
    public static void SaveCredential(string target, string username, SecureString password)
    {
        byte[] passwordBytes = SecureStringToByteArray(password);
        byte[] encryptedPassword = EncryptData(passwordBytes);

        NativeCredential credential = new NativeCredential
        {
            Flags = 0,
            Type = CredentialType.Generic,
            TargetName = Marshal.StringToCoTaskMemUni(target),
            UserName = Marshal.StringToCoTaskMemUni(username),
            CredentialBlob = Marshal.AllocCoTaskMem(encryptedPassword.Length),
            CredentialBlobSize = (uint)encryptedPassword.Length,
            Persist = 2, // CRED_PERSIST_LOCAL_MACHINE
            AttributeCount = 0,
            Attributes = IntPtr.Zero,
            Comment = IntPtr.Zero,
            TargetAlias = IntPtr.Zero,
            LastWritten = new System.Runtime.InteropServices.ComTypes.FILETIME()
        };

        Marshal.Copy(encryptedPassword, 0, credential.CredentialBlob, encryptedPassword.Length);

        bool written = false;
        try
        {
            written = CredWrite(ref credential, 0);
        }
        finally
        {
            Marshal.FreeCoTaskMem(credential.TargetName);
            Marshal.FreeCoTaskMem(credential.UserName);
            Marshal.FreeCoTaskMem(credential.CredentialBlob);
            Array.Clear(encryptedPassword, 0, encryptedPassword.Length);
            Array.Clear(passwordBytes, 0, passwordBytes.Length);
        }
    }

    // 读取凭据（安全版本）
    public static SecureString ReadCredential(string target)
    {
        IntPtr credentialPtr;
        if (!CredRead(target, CredentialType.Generic, 0, out credentialPtr))
        {
            int errorCode = Marshal.GetLastWin32Error();
            throw new Win32Exception(errorCode, "读取凭据失败.");
        }

        NativeCredential credential = (NativeCredential)Marshal.PtrToStructure(credentialPtr, typeof(NativeCredential));
        byte[] encryptedPassword = new byte[credential.CredentialBlobSize];
        Marshal.Copy(credential.CredentialBlob, encryptedPassword, 0, (int)credential.CredentialBlobSize);

        byte[] decryptedBytes = DecryptData(encryptedPassword);
        SecureString securePassword = new SecureString();

        // 直接处理字节数组避免字符串中间态
        if (decryptedBytes.Length % 2 != 0)
        {
            throw new InvalidDataException("Decrypted data has invalid length.");
        }
        for (int i = 0; i < decryptedBytes.Length; i += 2)
        {
            char c = (char)(decryptedBytes[i] | (decryptedBytes[i + 1] << 8));
            securePassword.AppendChar(c);
        }


        securePassword.MakeReadOnly();
        CredFree(credentialPtr);
        Array.Clear(encryptedPassword, 0, encryptedPassword.Length);
        Array.Clear(decryptedBytes, 0, decryptedBytes.Length);

        return securePassword;
    }

    // 安全转换方法（修复版）
    private static byte[] SecureStringToByteArray(SecureString secureString)
    {
        IntPtr ptr = Marshal.SecureStringToBSTR(secureString);
        try
        {
            int byteCount = secureString.Length * 2; // Unicode 每个字符占2字节
            byte[] bytes = new byte[byteCount];
            Marshal.Copy(ptr, bytes, 0, byteCount);
            return bytes;
        }
        finally
        {
            Marshal.ZeroFreeBSTR(ptr);
        }
    }
}
