using Datos.Clases;
using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
                               //logica para la creacion de ticket
namespace PeCes
{
    public partial class CreacionTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        
        protected void ddlTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool esEmpresa = ddlTipoCliente.SelectedValue == "Empresa";

            txtRazonSocial.Enabled = esEmpresa;
            rfvRazonSocial.Enabled = esEmpresa;

            //  limpiar el campo si se desactiva
            if (!esEmpresa)
            {
                txtRazonSocial.Text = string.Empty;
            }
        }

        protected void btnCrearTicket_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool esEmpresa = ddlTipoCliente.SelectedValue == "Empresa";

                //  Validación condicional de Razón Social
                if (esEmpresa && string.IsNullOrWhiteSpace(txtRazonSocial.Text))
                {
                    rfvRazonSocial.IsValid = false;
                    return;
                }
                //
                if (txtNombre.Text.Length < 5)
                {
                    
                    return;
                }

                var rutRegex = new System.Text.RegularExpressions.Regex(@"^(\d{8,9}-[\dkK])$");
                if (!rutRegex.IsMatch(txtRut.Text))
                {
                    return;
                }

                var emailRegex = new System.Text.RegularExpressions.Regex(@"^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$");
                if (!emailRegex.IsMatch(txtEmail.Text))
                {
                    return;
                }

                if (txtProducto.Text.Length < 10 || txtDescripcion.Text.Length < 10)
                {
                    return;
                }

                //

                ClienteEntity cliente;

                if (ddlTipoCliente.SelectedValue == "Empresa")
                {
                    cliente = new EmpresaEntity
                    {
                        Nombre = txtNombre.Text,
                        Rut = txtRut.Text,
                        Email = txtEmail.Text,
                        Telefono = txtTelefono.Text,
                        RazonSocial = txtRazonSocial.Text
                    };
                }
                else
                {
                    cliente = new ClienteEntity
                    {
                        Nombre = txtNombre.Text,
                        Rut = txtRut.Text,
                        Email = txtEmail.Text,
                        Telefono = txtTelefono.Text
                    };
                }

                var ticket = new Ticket
                {
                    Cliente = cliente,
                    Producto = txtProducto.Text,
                    Descripción = txtDescripcion.Text,
                    Estado = ddlEstado.SelectedValue,
                    _createdAt = DateTime.Now
                };

                // Guardar en lista de tickets en sesión
                List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;
                if (listaTickets == null)
                {
                    listaTickets = new List<Ticket>();
                }

                listaTickets.Add(ticket);
                Session["tickets"] = listaTickets;

                // Redirigir a la página de listado
                
                Response.Redirect("~/ListarTickets.aspx?mensaje=El ticket fue creado con éxito");

            }
        }


    }
}