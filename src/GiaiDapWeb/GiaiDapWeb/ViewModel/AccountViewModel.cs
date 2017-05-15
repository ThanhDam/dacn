using System;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GiaiDapWeb.ViewModel
{
    

        #region LogOnModel
        public class LogOnModel
        {
            [Required, Display(Name = "Mã số")]
            public string username { get; set; }
            [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu")]
            public string password { get; set; }

            [Display(Name = "Ghi nhớ đăng nhập")]
            public bool RememberMe { get; set; }
        }
        #endregion
        #region Register UserModel
        public class UserVM
        {
            
            [Required(ErrorMessage = "* Required"), Display(Name = "Tên Đăng Nhập")]
            public string UserName { get; set; }

            
            [Required(ErrorMessage = "* Required"), Display(Name = "Mật Khẩu"), DataType(DataType.Password)]
            public string Password { get; set; }

            
            [Display(Name = "Nhập Lại Mật Khẩu"), DataType(DataType.Password), System.Web.Mvc.Compare("Password", ErrorMessage = "Mật khẩu mới và xác nhận mật khẩu không khớp")]
            public string ConfirmPassword { get; set; }



        }
        #endregion
        #region ChangePassModel
        public class ChangePasswordVM
        {
            [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu Hiện Tại")]
            public string OldPassword { get; set; }
            [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu Mới")]
            public string NewPassword { get; set; }
            [DataType(DataType.Password), Display(Name = "Nhập Lại Mật Khẩu Mới"), Compare("NewPassword", ErrorMessage = "Mật khẩu mới và xác nhận mật khẩu không khớp")]
            public string ConfirmPassword { get; set; }
        }
        #endregion
   
}
