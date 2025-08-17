using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace PeCes
{
    public partial class ListarTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Mostrar mensaje si viene desde la creación
                string mensaje = Request.QueryString["mensaje"];
                if (!string.IsNullOrEmpty(mensaje))
                {
                    lblMensaje.Text = mensaje;
                    lblMensaje.ForeColor = mensaje.Contains("éxito") ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                }

                // Cargar lista de tickets
                List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;

                if (listaTickets != null && listaTickets.Count > 0)
                {
                    gvTickets.DataSource = listaTickets;
                    gvTickets.DataBind();
                }
                else if (string.IsNullOrEmpty(mensaje)) // Solo mostrar si no hay otro mensaje
                {
                    lblMensaje.Text = "No hay tickets registrados.";
                    lblMensaje.ForeColor = System.Drawing.Color.DarkOrange;
                }
            }
        }
    }
}
