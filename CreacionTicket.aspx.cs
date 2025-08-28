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

        /*protected void ddlTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool esEmpresa = ddlTipoCliente.SelectedValue == "Empresa";
            txtRazonSocial.Enabled = esEmpresa;
            rfvRazonSocial.Enabled = esEmpresa;
        }*/
        protected void ddlTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool esEmpresa = ddlTipoCliente.SelectedValue == "Empresa";

            txtRazonSocial.Enabled = esEmpresa;
            rfvRazonSocial.Enabled = esEmpresa;

            // Opcional: limpiar el campo si se desactiva
            if (!esEmpresa)
            {
                txtRazonSocial.Text = string.Empty;
            }
        }

        protected void btnCrearTicket_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
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
                
                Response.Redirect("~/ListarTickets.aspx?mensaje=El ticket fue creado correctamente");

            }
        }


    }
}