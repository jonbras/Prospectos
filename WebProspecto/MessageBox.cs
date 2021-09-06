using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebProspecto
{
    public static class MessageBox
    {
        public static void Show(this Page Page, String titulo, String Message, String icon, String accion)
        {
            String codigo = "<script language='javascript' id='codeScriptMsg'>";
            codigo += "Swal.fire({";
            codigo += "title: '"+titulo+"',";
            codigo += "text: '"+Message+"',";
            codigo += "icon: '"+icon+"'";
            codigo += "})";
            codigo += accion;
            codigo += "</script>";

            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               codigo
            );
        }
    }
}