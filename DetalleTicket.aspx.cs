using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace PeCes
{
    public partial class DetalleTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idParam = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(idParam))
                {
                    // Recuperar lista de tickets desde la sesión
                    List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;
                    Ticket ticket = listaTickets?.Find(t => t.Id == idParam); // ✅ Comparación string == string

                    if (ticket != null)
                    {
                        lblCliente.Text = "Cliente: " + ticket.Cliente.Nombre;
                        lblProducto.Text = "Producto: " + ticket.Producto;
                        lblDescripcion.Text = "Descripción: " + ticket.Descripción;
                    }
                    else
                    {
                        lblMensaje.Text = "No se encontró el ticket con ID " + idParam;
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se recibió el ID del ticket.";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}

