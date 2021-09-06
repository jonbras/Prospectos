using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProspecto
{
    public partial class Lista2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object getProspectos() {
            Controlador c = new Controlador();
            List<Prospecto2> lstProspecto = c.listarProspecto();

            object json = new { data = lstProspecto };

            return json;
        }
    }
}