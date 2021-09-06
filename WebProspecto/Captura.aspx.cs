using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebProspecto
{
    public partial class Captura : Page
    {
        int numDoc = 0;
        Validacion v = new Validacion();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)// null cuando inicia el programa, true cuando recarga
            //{
            //}
            
            if (ViewState["numDoc"] != null){
                numDoc = (int) ViewState["numDoc"];
            }
        }

        protected String UploadFile(TextBox txt, FileUpload fu)
        {
            string folderPath = Server.MapPath("~/Documentos/" + txtRFC.Text.ToUpper() + "/");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            String fileName = txt.Text;
            fu.SaveAs(folderPath + fileName + Path.GetExtension(fu.FileName));

            return fileName + Path.GetExtension(fu.FileName);
        }

        protected void btnNuevoDoc_Click(object sender, EventArgs e)
        {
            ViewState["numDoc"] = ++numDoc;

            DataTable dt = new DataTable();
            dt.Columns.Add("Nombre");
            dt.Columns.Add("File");
            
            for (int i = 1; i <= numDoc; i++)
            {
                dt.Rows.Add(new object[] {"", ""});
            }

            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Prospecto p = new Prospecto
                {
                    Nombre = txtNombre.Text,
                    Apellido1 = txtApellido1.Text,
                    Apellido2 = txtApellido2.Text,
                    Calle = txtCalle.Text,
                    Numero = txtNumero.Text,
                    Colonia = txtColonia.Text,
                    CP = txtCP.Text,
                    Telefono = txtTel.Text,
                    RFC = txtRFC.Text,
                    Documentos = ""
                };

                String res = v.evaluaProspecto(p, Repeater1);

                if (String.IsNullOrEmpty(res))
                {
                    String cadena = "";
                    foreach (RepeaterItem item in Repeater1.Items)
                    {
                        TextBox txtDocRepeater = (TextBox)item.FindControl("txtDoc");
                        FileUpload fileUploadRepeater = (FileUpload)item.FindControl("fileUpload");
                        cadena += (cadena == "" ? "" : ", " )+ UploadFile(txtDocRepeater, fileUploadRepeater);
                        p.Documentos = cadena;
                    }

                    Controlador c = new Controlador();
                    c.dbGuardaProspecto(this, p);
                }
                else {
                    lblMensajes.Text = res;
                    MessageBox.Show(this, "", res, "warning", "");
                }
            }
            catch (Exception ex)
            {
                lblMensajes.Text = ex.Message+ ", "+ex.StackTrace;
            }
        }
    }
}