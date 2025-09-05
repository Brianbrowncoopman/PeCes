using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
                                     //esta es la logica  para actualizar ticket 
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
                        lblId.Text = "ID del Ticket: " + ticket.Id;
                        lblNombreCliente.Text ="Nombre: " +  ticket.Cliente.Nombre;

                        // Cargar datos editables
                        txtTelefono.Text =  ticket.Cliente.Telefono;
                        txtEmail.Text =  ticket.Cliente.Email;
                        txtProducto.Text =  ticket.Producto;
                        txtDescripcion.Text =  ticket.Descripción;
                        ddlEstado.SelectedValue = ticket.Estado;

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

                        //logica para el boton guardar lo actualizado
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ///
            if (!Page.IsValid)
            {
                lblMensaje.Text = "Por favor corrija los errores antes de guardar.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validaciones adicionales en servidor
            if (string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                lblMensaje.Text = "El teléfono es obligatorio.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            var emailRegex = new Regex(@"^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$");
            if (!emailRegex.IsMatch(txtEmail.Text))
            {
                lblMensaje.Text = "El formato del email es inválido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            var telefonoRegex = new Regex(@"^[0-9]{1,9}$");
            if (!telefonoRegex.IsMatch(txtTelefono.Text.Trim()))
            {
                lblMensaje.Text = "El formato del teléfono es inválido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtProducto.Text.Length < 10)
            {
                lblMensaje.Text = "El producto debe tener al menos 10 caracteres.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtDescripcion.Text.Length < 10)
            {
                lblMensaje.Text = "La descripción debe tener al menos 10 caracteres.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }


            ///
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
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

                        //logica para el boton de regresar al detalle
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
                lblMensaje.ForeColor = System.Drawing.Color.Red;

            }
        }

                          //logica para el boton de regresar al listado
        protected void btbIrAListado_click(object sender, EventArgs e)
        {
            //btn ir al listado
            Response.Redirect("ListarTickets.aspx");
        }
    }
}