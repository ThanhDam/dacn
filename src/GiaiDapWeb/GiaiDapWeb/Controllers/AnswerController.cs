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
    public class AnswerController : Controller
    {
        // GET: Answer
        RequestDBEntities db = new RequestDBEntities();
        public ActionResult Index()
        {
            return View(db.Answers);
        }
        public ActionResult AnswerId(int id)
        {
           
            return View(db.Answers.FirstOrDefault(m => m.question_id == id));
        }
        public ActionResult ViewAnswer()
        {
            db = new RequestDBEntities();
            List<Answer> lst = db.Answers.ToList<Answer>();
            //foreach (Answer a in lst)
            //{
                
            //}
            return View(lst.ToList());
        }
        
        public ActionResult Detail(int id)
        {
            return View(db.Answers.Find(id));
        }
      



        public ActionResult Create()
        {
            //Student s=db.Questions.Where(m=> m.text)
            //ViewBag.NguoiHoi = db.Questions.
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Exclude = "id")]Answer answer)
        {
           
            
            if (ModelState.IsValid)
            {
                answer.id = db.Answers.Count() + 1;
                answer.ministry_id = HttpContext.Session["maTaiKhoan"].ToString();
                answer.time_respond = DateTime.Now;
                db.Answers.Add(answer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaCH = new SelectList(db.Questions, "id", "text", answer.question_id);
            ViewBag.Message = "Trả lời thành công";
            return View(answer);
        }


        public ActionResult Gioithieu()
        {
            return View();
        }



        public ActionResult Edit(int id)
        {
            var answer = db.Answers.Find(id);
            ViewBag.CauHoi = new SelectList(db.Questions, "id", "text", answer.question_id);
            return View(answer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,type_id, student_id,text,time_request")] Answer answer)
        {
            if (ModelState.IsValid)
            {

                db.Entry(answer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CauHoi = new SelectList(db.Questions, "id", "text", answer.question_id);
            return View(answer);
        }

        [HttpPost]
        public ActionResult Delete(int id) 
        {
            var answer = db.Answers.Find(id);

            db.Answers.Remove(answer);
            db.SaveChanges();
            return RedirectToAction("Index", "Answer");
        }
        [HttpPost]
        public ActionResult Search(FormCollection f)
        {
            string s = f["search"];

            if (string.IsNullOrEmpty(s)) return RedirectToAction("Index", "Answer");
            else
            {
                ViewData.Model = db.Answers.Where(m => m.text.Contains(s)).ToList();
            }
            return View();
        }


        public ActionResult LoadAnswer(int pageNo, int pageSize = 8)
        {
            db = new RequestDBEntities();
            var l = db.Answers.ToList();
            var model = l.Skip(pageNo * pageSize).Take(pageSize).ToList();
            return PartialView(model);
        }
       
        public PartialViewResult AnswerList()
        {
            db = new RequestDBEntities();
            List<Answer> l = db.Answers.ToList<Answer>();
            return PartialView(l);
        }

    }
}