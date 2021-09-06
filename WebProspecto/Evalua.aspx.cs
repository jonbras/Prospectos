using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProspecto
{
    public partial class Evalua : System.Web.UI.Page
    {
        Controlador c = new Controlador();
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {       
            }

            if (Session["id_sel"] != null)
            {
                id = (int)Session["id_sel"];
                c.buscaProspecto(id, RepeaterEvalua);
                c.obtieneDoc(id, RepeaterDoc);

                foreach (RepeaterItem item in RepeaterEvalua.Items)
                {
                    Label lbl = (Label)item.FindControl("lblEstado");
                    if (lbl.Text.Equals("Autorizado") || lbl.Text.Equals("Rechazado"))
                    {
                        btnAutoriza.Visible = false;
                        btnRechaza.Visible = false;
                        lblObservaciones.Visible = false;
                        txtObservaciones.Visible = false;
                    }
                }
            }
            else {
                Response.Redirect("Default.aspx");
            }
        }

        protected void repeaterDoc_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case ("View"):
                    String url = e.CommandArgument.ToString();
                    Response.Write("<script> window.open('" + url + "','_blank'); </script>");
                    //Response.Redirect(url);
                    break;
            }
        }

        protected void btnAutoriza_Click(object sender, EventArgs e)
        {
            c.dbCambiaEstadoProspecto(this, id, "Autorizado", txtObservaciones.Text);
        }

        protected void btnRechaza_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtObservaciones.Text)) {
                String accion = ".then((result) => { if (result.isConfirmed){document.querySelector('.codeScriptMsg').remove();}})";
                MessageBox.Show(this, "", "Debe de indicar las observaciones!", "warning", accion);
            }
            else {
                c.dbCambiaEstadoProspecto(this, id, "Rechazado", txtObservaciones.Text);
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Lista.aspx");
        }
    }
}