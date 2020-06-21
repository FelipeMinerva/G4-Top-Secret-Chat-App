using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mercury.Engine.API.DbContext.Entity
{
    public partial class TbUser
    {
        public TbUser()
        {
            TbUserGroup = new HashSet<TbUserGroup>();
            TbMessage = new HashSet<TbMessage>();
        }

        [Key]
        public int IdUser { get; set; }
        public string NmUserName { get; set; }
        public string TxEmail { get; set; }

        public virtual ICollection<TbUserGroup> TbUserGroup { get; set; }
        public virtual ICollection<TbMessage> TbMessage { get; set; }
    }
}
