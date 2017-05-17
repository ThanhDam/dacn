using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GiaiDapWeb.Models;

namespace GiaiDapWeb.Controllers
{
    public class MinistriesController : Controller
    {
        private RequestDBEntities db = new RequestDBEntities();

        // GET: Ministries
        public ActionResult Index()
        {
            return View(db.Ministries.ToList());
        }

        // GET: Ministries/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ministry ministry = db.Ministries.Find(id);
            if (ministry == null)
            {
                return HttpNotFound();
            }
            return View(ministry);
        }

        // GET: Ministries/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Ministries/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ministry_id,name,date_of_birth,address,sex")] Ministry ministry)
        {
            if (ModelState.IsValid)
            {
                db.Ministries.Add(ministry);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ministry);
        }

        // GET: Ministries/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ministry ministry = db.Ministries.Find(id);
            if (ministry == null)
            {
                return HttpNotFound();
            }
            return View(ministry);
        }

        // POST: Ministries/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ministry_id,name,date_of_birth,address,sex")] Ministry ministry)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ministry).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ministry);
        }

        // GET: Ministries/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ministry ministry = db.Ministries.Find(id);
            if (ministry == null)
            {
                return HttpNotFound();
            }
            return View(ministry);
        }

        // POST: Ministries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Ministry ministry = db.Ministries.Find(id);
            //Answer và Ministry co quan he khoa ngoai nen truoc khi xoa ministry phai xoa answer của ministry do
            List<Answer> lstAnswer = db.Answers.Where(q => q.ministry_id == id).ToList();
            foreach (Answer a in lstAnswer)
            {
                db.Answers.Remove(a);
            }
            db.Ministries.Remove(ministry);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        //Tìm kiếm theo tài khoản giáo vụ
        [HttpPost]
        public ActionResult Search(FormCollection f)
        {
            string s = f["search"];

            if (string.IsNullOrEmpty(s)) return RedirectToAction("Index");
            else
            {
                ViewData.Model = db.Ministries.Where(m => m.ministry_id.Contains(s)).ToList();
            }
            return View();
        }
    }
}
