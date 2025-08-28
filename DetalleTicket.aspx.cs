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
                    Ticket ticket = listaTickets?.Find(t => t.Id == idParam); // 

                    if (ticket != null)
                    {
                        lblCliente.Text = "<strong>Cliente:</strong> " + ticket.Cliente.Nombre;
                        lblProducto.Text = "<strong>Producto:</strong> " + ticket.Producto;
                        lblDescripcion.Text = "<strong>Descripción:</strong> " + ticket.Descripción;
                        lblId.Text = "<strong>Id:</strong> " + ticket.Cliente.Id;
                        lblEmail.Text = "<strong>Email:</strong> " + ticket.Cliente.Email;
                        lblTelefono.Text = "<strong>Telefono:</strong> " + ticket.Cliente.Telefono;
                        lblRut.Text = "<strong>Rut:</strong> " + ticket.Cliente.Rut;
                        lblRazonSocial.Text = "<strong>Tipo de cliente:</strong> " + (ticket.Cliente is Datos.Clases.EmpresaEntity empresa ? "Empresa - Razón Social: " + empresa.RazonSocial : "Particular");
                        lblEstado.Text = "<strong>Estado del ticket:</strong> " + ticket.Estado;
                        lblCreacion.Text = "<strong>Fecha de cracion:</strong> " + ticket._createdAt;
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

        protected void btnRegresarListado_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarTickets.aspx");
            //falta logica para regresar al listado de tickets
        }

        protected void btnIrActualizar_Click(object sender, EventArgs e)
        {
            // logica para ir a la pagina de actualizar ticket
            string idParam = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idParam))
            {
                Response.Redirect("ActualizarTicket.aspx?id=" + idParam);
            }
            else
            {
                lblMensaje.Text = "No se puede actualizar: ID no disponible.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}

