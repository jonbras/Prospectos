using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebProspecto
{
    public class Prospecto
    {
        String id;
        String nombre;
        String apellido1;
        String apellido2;
        String calle;
        String numero;
        String colonia;
        String cp;
        String telefono;
        String rfc;
        String estado;
        String documentos;

        public string Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido1 { get => apellido1; set => apellido1 = value; }
        public string Apellido2 { get => apellido2; set => apellido2 = value; }
        public string Calle { get => calle; set => calle = value; }
        public string Numero { get => numero; set => numero = value; }
        public string Colonia { get => colonia; set => colonia = value; }
        public string CP { get => cp; set => cp = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Estado { get => estado; set => estado = value; }
        public string RFC { get => rfc; set => rfc = value; }
        public string Documentos { get => documentos; set => documentos = value; }
    }
}