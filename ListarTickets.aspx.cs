using Datos.Clases;
using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Linq;
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
                        // Puedes descomentar este bloque para pruebas
                        /*
                        new Ticket
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
                        }
                        */
                    };

                    Session["tickets"] = listaSimulada;
                }

                // Obtener lista de tickets desde sesión
                List<Ticket> listaTickets = Session["tickets"] as List<Ticket>;

                // Evaluar si hay filtro en la URL
                string filtro = Request.QueryString["filtro"];
                List<Ticket> resultado = listaTickets;

                if (!string.IsNullOrEmpty(filtro) && listaTickets != null)
                {
                    filtro = filtro.Trim().ToLower();

                    resultado = listaTickets.Where(t =>
                        (!string.IsNullOrEmpty(t.Id) && t.Id.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Cliente?.Nombre) && t.Cliente.Nombre.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Cliente?.Rut) && t.Cliente.Rut.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Cliente?.Email) && t.Cliente.Email.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Cliente?.Telefono) && t.Cliente.Telefono.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Producto) && t.Producto.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Descripción) && t.Descripción.ToLower().Contains(filtro)) ||
                        (!string.IsNullOrEmpty(t.Estado) && t.Estado.ToLower().Contains(filtro)) ||
                        (t.Cliente is EmpresaEntity empresa && !string.IsNullOrEmpty(empresa.RazonSocial) && empresa.RazonSocial.ToLower().Contains(filtro))
                    ).ToList();
                }

                // Mostrar resultados filtrados o mensaje si no hay coincidencias
                if (resultado != null && resultado.Count > 0)
                {
                    gvTickets.DataSource = resultado;
                    gvTickets.DataBind();
                    gvTickets.Visible = true;

                    // Ocultar mensaje si no viene desde creación
                    if (string.IsNullOrEmpty(mensaje)) lblMensaje.Visible = false;
                }
                else
                {
                    gvTickets.Visible = false;

                    if (string.IsNullOrEmpty(mensaje))
                    {
                        lblMensaje.Text = !string.IsNullOrEmpty(filtro)
                            ? "No se encontraron tickets que coincidan con el filtro."
                            : "No hay tickets registrados.";

                        lblMensaje.ForeColor = !string.IsNullOrEmpty(filtro)
                            ? System.Drawing.Color.Red
                            : System.Drawing.Color.DarkOrange;

                        lblMensaje.Visible = true;
                    }
                }
            }
        }
    }
}

