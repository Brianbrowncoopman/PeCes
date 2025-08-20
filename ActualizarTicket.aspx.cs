using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace PeCes
{
    public partial class ActualizarTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idParam = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(idParam))
                {
                    List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;
                    Ticket ticket = listaTickets?.Find(t => t.Id == idParam);

                    if (ticket != null)
                    {
                        // Mostrar datos no editables
                        lblId.Text = "ID: " + ticket.Id;
                        lblNombreCliente.Text = "Cliente: " + ticket.Cliente.Nombre;

                        // Cargar datos editables
                        txtTelefono.Text = ticket.Cliente.Telefono;
                        txtEmail.Text = ticket.Cliente.Email;
                        txtProducto.Text = ticket.Producto;
                        txtDescripcion.Text = ticket.Descripción;
                        //txtEstado.Text = ticket.Estado;
                        ddlEstado.SelectedValue = ticket.Estado;

                    }
                    else
                    {
                        lblMensaje.Text = "No se encontró el ticket con ID " + idParam;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se recibió el ID del ticket.";
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string idParam = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idParam))
            {
                List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;
                Ticket ticket = listaTickets?.Find(t => t.Id == idParam);

                if (ticket != null)
                {
                    // Actualizar campos permitidos
                    ticket.Cliente.Telefono = txtTelefono.Text;
                    ticket.Cliente.Email = txtEmail.Text;
                    ticket.Producto = txtProducto.Text;
                    ticket.Descripción = txtDescripcion.Text;
                    ticket.Estado = ddlEstado.SelectedValue;

                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = "Cambios guardados correctamente.";
                }
                else
                {
                    lblMensaje.Text = "No se pudo actualizar: ticket no encontrado.";
                }
            }
        }

        protected void btnRegresarDetalle_click(object sender, EventArgs e)
        {
            string idParam = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idParam))
            {
                Response.Redirect("DetalleTicket.aspx?id=" + idParam);
            }
            else
            {
                lblMensaje.Text = "No se pudo regresar: ID no disponible.";
            }
        }


        protected void btbIrAListado_click(object sender, EventArgs e)
        {
            //btn ir al listado
            Response.Redirect("ListarTickets.aspx");
        }
    }
}