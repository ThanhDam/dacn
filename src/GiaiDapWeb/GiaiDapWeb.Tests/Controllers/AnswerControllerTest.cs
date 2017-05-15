using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GiaiDapWeb;
using GiaiDapWeb.Controllers;
using System.Web.Mvc;

namespace GiaiDapWeb.Tests.Controllers
{
    [TestClass]
    public class AnswerControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            AnswerController controller = new AnswerController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Edit()
        {
            // Arrange
            AnswerController controller = new AnswerController();

            // Act
            ViewResult result = controller.Edit(3) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Detail()
        {
            // Arrange
            AnswerController controller = new AnswerController();

            // Act
            ViewResult result = controller.Detail(3) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
