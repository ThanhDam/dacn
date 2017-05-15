using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GiaiDapWeb.Areas.Adminitrator.Controllers
{
    public class AnswerController : Controller
    {
        // GET: Adminitrator/Answer
        public ActionResult Index()
        {
            return View();
        }

        // GET: Adminitrator/Answer/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Adminitrator/Answer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Adminitrator/Answer/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Adminitrator/Answer/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Adminitrator/Answer/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Adminitrator/Answer/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Adminitrator/Answer/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
