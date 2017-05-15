using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GiaiDapWeb.Models;

namespace GiaiDapWeb.Controllers
{
    public class GrantPermissionController : Controller
    {
        // GET: GrantPermission
        RequestDBEntities db = new RequestDBEntities();
        public ActionResult indexRant3()
        {
            return View();
        }
       
    }
}