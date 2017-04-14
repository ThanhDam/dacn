using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GiaiDapWeb.Startup))]
namespace GiaiDapWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
