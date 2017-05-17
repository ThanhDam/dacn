﻿//------------------------------------------------------------------------------
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
    using System.ComponentModel.DataAnnotations;
    
    public partial class Question
    {
        [Display(Name = "ID")]
        public long id { get; set; }
        [Required(ErrorMessage = "* Required"), Display(Name = "Loại câu hỏi")]
        public int type_id { get; set; }
        [Required(ErrorMessage = "* Required"), Display(Name = "Nội dung")]
        public string text { get; set; }
        public string student_id { get; set; }
        public System.DateTime time_request { get; set; }
    
        public virtual QuestionType QuestionType { get; set; }
        public virtual Student Student { get; set; }
    }
}
