using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mercury.Engine.API.DbContext.Entity
{
    public partial class TbUserGroup
    {
        public int FkUser { get; set; }
        public int FkGroup { get; set; }

        [Key]
        public virtual TbGroup FkGroupNavigation { get; set; }
        public virtual TbUser FkUserNavigation { get; set; }
    }
}
