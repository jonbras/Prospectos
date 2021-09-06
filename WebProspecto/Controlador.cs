using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProspecto
{
    public class Controlador
    {
        public bool dbGuardaProspecto(Page page, Prospecto p)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
                using (SqlCommand cmd = new SqlCommand("usp_guarda", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombre", p.Nombre);
                    cmd.Parameters.AddWithValue("primer_apellido", p.Apellido1);
                    cmd.Parameters.AddWithValue("segundo_apellido", p.Apellido2);
                    cmd.Parameters.AddWithValue("calle", p.Calle);
                    cmd.Parameters.AddWithValue("numero", p.Numero);
                    cmd.Parameters.AddWithValue("colonia", p.Colonia);
                    cmd.Parameters.AddWithValue("codigo_postal", p.CP);
                    cmd.Parameters.AddWithValue("telefono", p.Telefono);
                    cmd.Parameters.AddWithValue("rfc", p.RFC);
                    cmd.Parameters.AddWithValue("documentos", p.Documentos);
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }

                String accion = ".then((result) => { if (result.isConfirmed){window.location.href = 'Lista';}})";
                MessageBox.Show(page, "", "Datos registrados!", "success", accion);
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Listar(Repeater r)
        {
            try
            {
                using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
                using (SqlDataAdapter da = new SqlDataAdapter("usp_lista", conexi))
                {
                    DataTable tbRegistro = new DataTable();
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.Fill(tbRegistro);
                    r.DataSource = tbRegistro;
                    r.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Prospecto2> listarProspecto()
        {
            List<Prospecto2> lst = new List<Prospecto2>();
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT * FROM prospecto", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlDataReader reader = cmd.ExecuteReader();
                Prospecto2 p;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lst.Add(p = new Prospecto2()
                        {
                            id = reader["id"].ToString(),
                            nombre = reader["nombre"].ToString(),
                            apellido1 = reader["primer_apellido"].ToString(),
                            apellido2 = reader["segundo_apellido"].ToString(),
                            estado = reader["estado"].ToString()
                        });
                    }
                }

                con.Close();
            }
            catch (Exception)
            {
                throw;
            }

            return lst;
        }


        public void buscaProspecto(int id, Repeater r)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT * FROM prospecto WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                r.DataSource = cmd.ExecuteReader();
                r.DataBind();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void obtieneDoc(int id, Repeater r)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT * FROM prospecto WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlDataReader reader = cmd.ExecuteReader();
                List<TestDoc> lista = new List<TestDoc>();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        String documentos = reader["documentos"].ToString();

                        String[] listaDoc = documentos.Split(',');
                        foreach (String nombre in listaDoc)
                        {
                            String url = "/Documentos/" + reader["rfc"].ToString().ToUpper() + "/" + nombre.Trim();
                            lista.Add(new TestDoc() { URL = url, Nombre = nombre.Trim() });
                        }
                    }
                }

                r.DataSource = lista;
                r.DataBind();
                reader.Close();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }


        public bool dbCambiaEstadoProspecto(Page page, int id, String estado, String observacion)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
                using (SqlCommand cmd = new SqlCommand("usp_cambiaEstado", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("id", id);
                    cmd.Parameters.AddWithValue("observacion", observacion);
                    cmd.Parameters.AddWithValue("estado", estado);
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }

                String accion = ".then((result) => { if (result.isConfirmed){window.location.href = 'Lista';}})";
                MessageBox.Show(page, "", "Evaluación realizada!", "success", accion);
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    public class TestDoc
    {
        public string URL { get; set; }
        public string Nombre { get; set; }
    }
}
