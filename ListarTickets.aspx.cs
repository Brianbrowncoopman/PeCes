using Datos.Clases;
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

                // Simular carga de tickets si la sesión está vacía
                if (Session["tickets"] == null)
                {
                    List<Ticket> listaSimulada = new List<Ticket>
                    {
                       /*new Ticket
                       {
                           Id = Guid.NewGuid().ToString(),
                           Cliente = new ClienteEntity
                       {
                            Nombre = "Juan Pérez",
                            Rut = "12.345.678-9",
                            Email = "juan@example.com",
                            Telefono = "987654321"
                        },
                        Producto = "Laptop",
                        Descripción = "Pantalla rota",
                        Estado = "Pendiente",
                        _createdAt = DateTime.Now
                        }*/

                    };

                    Session["tickets"] = listaSimulada;
                }

                // Cargar lista de tickets
                List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;

                if (listaTickets != null && listaTickets.Count > 0)
                {
                    gvTickets.DataSource = listaTickets;
                    gvTickets.DataBind();
                    gvTickets.Visible = true;
                    if (string.IsNullOrEmpty(mensaje)) lblMensaje.Visible = false;
                }
                else
                {
                    gvTickets.Visible = false;
                    if (string.IsNullOrEmpty(mensaje))
                    {
                        lblMensaje.Text = "No hay tickets registrados.";
                        lblMensaje.ForeColor = System.Drawing.Color.DarkOrange;
                        lblMensaje.Visible = true;
                    }
                }
            }
        }
    }
}

