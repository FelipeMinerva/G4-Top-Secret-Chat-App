using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mercury.Engine.API.DbContext.Entity
{
    public partial class TbGroup
    {
        public TbGroup()
        {
            TbUserGroup = new HashSet<TbUserGroup>();
            TbMessage = new HashSet<TbMessage>();
        }

        [Key]
        public int IdGroup { get; set; }
        public string NmGroupName { get; set; }

        public virtual ICollection<TbUserGroup> TbUserGroup { get; set; }
        public virtual ICollection<TbMessage> TbMessage { get; set; }
    }
}
