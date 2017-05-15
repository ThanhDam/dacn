using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GiaiDapWeb;
using GiaiDapWeb.Controllers;
using System.Web.Mvc;

namespace GiaiDapWeb.Tests.Controllers
{
    [TestClass]
    public class QuestionControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            QuestionController controller = new QuestionController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Edit()
        {
            // Arrange
            QuestionController controller = new QuestionController();

            // Act
            ViewResult result = controller.Edit(5) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Detail()
        {
            // Arrange
            QuestionController controller = new QuestionController();

            // Act
            ViewResult result = controller.Detail(5) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
       
    }
}
