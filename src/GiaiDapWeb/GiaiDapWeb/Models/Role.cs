//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GiaiDapWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Role
    {
        public Role()
        {
            this.Accounts = new HashSet<Account>();
        }
    
        public int id { get; set; }
        public string role1 { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
