using System.Web.Mvc;

namespace GiaiDapWeb.Areas.Adminitrator
{
    public class AdminitratorAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Adminitrator";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Adminitrator_default",
                "Adminitrator/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "GiaiDapWeb.Areas.Adminitrator.Controllers"}
            );
        }
    }
}