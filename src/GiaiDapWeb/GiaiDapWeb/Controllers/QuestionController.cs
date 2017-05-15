using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.IO;
using System.Net;
using GiaiDapWeb.Models;

namespace GiaiDapWeb.Controllers
{
    public class QuestionController : Controller
    {
        RequestDBEntities db = new RequestDBEntities();

        public ActionResult Index()
        {
            return View(db.Questions);
        }
        public ActionResult QuestionId(int id)
        {
            return View(db.Questions.Where(m => m.type_id == id));
        }

       
        public ActionResult Detail(int id)
        {
            return View(db.Questions.Find(id));
        }
        public ActionResult Top5Question()
        {
            return PartialView(db.Questions.Take(3));
        }



        public ActionResult Create()
        {
            ViewBag.LoaiCauHoi = new SelectList(db.QuestionTypes, "id", "type");
            return View();
        }
      

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Exclude = "id")]Question q)
        {
            
            if (ModelState.IsValid)
            {
                db.Questions.Add(q);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoai = new SelectList(db.QuestionTypes, "id", "type", q.id);
            return View(q);
        }


    
     

        public ActionResult Edit(int id)
        {
            var question = db.Questions.Find(id);
            ViewBag.LoaiCauHoi = new SelectList(db.QuestionTypes, "id", "type", question.type_id);
            return View(question);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,type_id, student_id,text,time_request")] Question question)
        {
            if (ModelState.IsValid)
            {
               
                db.Entry(question).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LoaiCauHoi = new SelectList(db.QuestionTypes, "id", "type", question.type_id);
            return View(question);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var question = db.Questions.Find(id);

            db.Questions.Remove(question);
            db.SaveChanges();
            return RedirectToAction("Index", "Question");
        }
        [HttpPost]
        public ActionResult Search(FormCollection f)
        {
            string s = f["search"];

            if (string.IsNullOrEmpty(s)) return RedirectToAction("Index", "Question");
            else
            {
                ViewData.Model = db.Questions.Where(m => m.text.Contains(s)).ToList();
            }
            return View();
        }


        public ActionResult LoadQuestion(int pageNo, int pageSize = 8)
        {
            db = new RequestDBEntities();
            var l = db.Questions.ToList();
            var model = l.Skip(pageNo * pageSize).Take(pageSize).ToList();
            return PartialView(model);
        }
        
        public PartialViewResult QuestionList()
        {
            db = new RequestDBEntities();
            List<Question> l = db.Questions.ToList<Question>();
            return PartialView(l);
        }

    }
}