using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TechF2V1.Startup))]
namespace TechF2V1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
