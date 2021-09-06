using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace WebProspecto
{
    public class Validacion
    {
        String msg;

        public bool test(string valor, String nombre)
        {
            if (String.IsNullOrEmpty(valor))
            {
                msg = String.Format("{0} es obligatorio !", nombre);
                return false;
            }
            else
                return true;
        }

        public String evaluaProspecto(Prospecto p, Repeater r)
        {
            msg = "";
            if (test(p.Nombre, "Nombre del prospecto") && test(p.Apellido1, "Apellido Paterno") 
                && test(p.Calle, "Calle") && test(p.Numero.ToString(), "Número") && test(p.Colonia, "Colonia") 
                && test(p.CP.ToString(), "Código Postal") && test(p.Telefono, "Teléfono") && test(p.RFC, "RFC")
                && test(r.Items.Count == 0 ? "" : r.Items.Count.ToString(), "Subir al menos un documento")) {
                int i = 0;
                foreach (RepeaterItem item in r.Items)
                {
                    TextBox txtDocRepeater = (TextBox)item.FindControl("txtDoc");
                    FileUpload fileUploadRepeater = (FileUpload)item.FindControl("fileUpload");
                    i++;
                    if (!test(txtDocRepeater.Text, String.Format("El nombre del documento en la posición {0}", i)) 
                        || !test(fileUploadRepeater.HasFile ? "Si" : "", String.Format("Subir documento en la posición {0}", i))) {
                        return msg;
                    }
                }

                    return "";
            }

            return msg;
        }
    }
}