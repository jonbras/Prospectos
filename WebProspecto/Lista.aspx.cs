using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProspecto
{
    public partial class Lista : System.Web.UI.Page
    {
        Controlador c;

        protected void Page_Load(object sender, EventArgs e)
        {
            c = new Controlador();
            c.Listar(RepeaterLista);
        }

        protected void repEmployeeDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case ("View"):
                    int id = Convert.ToInt32(e.CommandArgument);
                    Session["id_sel"] = id;
                    Response.Redirect("Evalua.aspx");
                    break;
            }
        }

        protected void btnCapturar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Captura.aspx");
        }
    }
}