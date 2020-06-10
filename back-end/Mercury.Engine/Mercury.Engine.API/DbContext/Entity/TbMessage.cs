using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mercury.Engine.API.DbContext.Entity
{
    public partial class TbMessage
    {
        [Key]
        public int IdMessage { get; set; }
        public string TxMessage { get; set; }
        public int FkUser { get; set; }
        public int FkGroup { get; set; }
        public DateTime? DtTimestamp { get; set; }

        public virtual TbGroup FkGroupNavigation { get; set; }
        public virtual TbUser FkUserNavigation { get; set; }
    }
}
