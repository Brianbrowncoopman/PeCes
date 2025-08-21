using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PeCes
{
    public partial class MPSitio : System.Web.UI.MasterPage //podria generar error
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
    {
                string filtro = Request.QueryString["filtro"];
                if (!string.IsNullOrEmpty(filtro))
                {
                    txtFiltroBusqueda.Text = filtro;
                }
            }


        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // Lógica para cbuscar 
            string filtro = txtFiltroBusqueda.Text.Trim();

            if (!string.IsNullOrEmpty(filtro))
            {
                Response.Redirect("~/ListarTickets.aspx?filtro=" + Server.UrlEncode(filtro));
            }
            else
            {
                Response.Redirect("~/ListarTickets.aspx");
            }



        }
    }
}