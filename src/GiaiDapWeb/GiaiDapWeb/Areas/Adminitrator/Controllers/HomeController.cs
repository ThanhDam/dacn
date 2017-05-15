using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using GiaiDapWeb.Areas.Adminitrator.Models;

namespace GiaiDapWeb.Areas.Adminitrator.Controllers
{
    public class HomeController : Controller
    {
        // GET: Adminitrator/Home
        public ActionResult Index()
        {
            //ReflectionController reflecttion = new ReflectionController();
            //List<Type> listController = reflecttion.GetControllers("GiaiDapWeb.Areas.Adminitrator");
            //string result = "<ul>";
            //foreach (Type controller in listController)
            //{
            //    result += "<li>" + controller.Name;
            //    List<string> listAction = reflecttion.GetActions(controller);
            //    result += "<ul>";
            //    foreach (string action in listAction)
            //    {
            //        result += "<li>" + action + "</li>";
            //    }
            //    result += "</ul>";
            //    ViewBag.result = result;
            //}
           return View();
        }
    }
}