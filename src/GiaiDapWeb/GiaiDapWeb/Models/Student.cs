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
    
    public partial class Student
    {
        public Student()
        {
            this.Questions = new HashSet<Question>();
        }
    
        public string student_id { get; set; }
        public string name { get; set; }
        public System.DateTime date_of_birth { get; set; }
        public string address { get; set; }
        public string @class { get; set; }
        public bool sex { get; set; }
        public Nullable<int> school_year { get; set; }
        public string education_level { get; set; }
    
        public virtual ICollection<Question> Questions { get; set; }
    }
}
