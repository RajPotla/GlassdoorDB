using Glassdoor.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;

namespace Glassdoor.Controllers
{
    public class ReviewManagementController : Controller
    {
        private GlassdoorDBEntities database = new GlassdoorDBEntities();
        
        public ActionResult Index()
        {
            return View();
        }
        
        // GET: ReviewManagement
        public ActionResult Details(int id)
        {
            Review Review = database.Reviews.Find(id);
            ViewBag.Review = Review;
            var review = new Review() {
                id = Review.id            
            };
            
            return View("Details", review);
        }

        public ActionResult SendReview(Review review, double rating)
        {
            string User = Session["User"].ToString();
            review.User_ID = database.Users.Single(a => a.Users.Equals(User)).id;
            review.Rating = rating;
            database.Reviews.Add(review);
            database.SaveChanges();
            return RedirectToAction("Details", "Review", new { id = review.User_ID });
        }

        //HttpPost: ReviewManagement
        public ActionResult ReviewManagement()
        {
            return View();
        }

    }
}