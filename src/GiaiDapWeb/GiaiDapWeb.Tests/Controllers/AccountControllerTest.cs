using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GiaiDapWeb;
using GiaiDapWeb.Controllers;
using System.Web.Mvc;

namespace GiaiDapWeb.Tests.Controllers
{
    [TestClass]
    public class AccountControllerTest
    {
        [TestMethod]
        public void DangNhap()
        {
            // Arrange
            AccountController controller = new AccountController();

            // Act
            ViewResult result = controller.DangNhap() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void DangKy()
        {
            // Arrange
            AccountController controller = new AccountController();

            // Act
            ViewResult result = controller.DangKy() as ViewResult;

            // Assert
            Assert.AreEqual("Your application description page.", result.ViewBag.Message);
        }

        [TestMethod]
        public void DoiMatKhau()
        {
            // Arrange
            AccountController controller = new AccountController();

            // Act
            ViewResult result = controller.DoiMatKhau() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
