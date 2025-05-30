namespace FrpcUI.Class.Model
{
    public class TencentModel
    {
        /// <summary>
        /// 域名
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 记录名
        /// </summary>
        public string RecordName { get; set; }
        /// <summary>
        /// 记录ID
        /// </summary>
        public string RecordId { get; set; }
        public string Status { get; set; }
        public string TTL { get; set; }
        public string Type { get; set; }
        /// <summary>
        /// 更新时间
        /// </summary>
        public string UpdatedOn { get; set; }
        /// <summary>
        /// 记录值
        /// </summary>
        public string Value { get; set; }
    }
}
