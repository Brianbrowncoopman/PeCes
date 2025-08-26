<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="DetalleTicket.aspx.cs" Inherits="PeCes.DetalleTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="detalle-ticket">
        <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" />
        <div class="info-ticket">
            <div class="info-cliente">
                <h3>Datos cliente</h3>
                <asp:Label ID="lblCliente" runat="server" />
                <br />
                <asp:Label ID="lblRazonSocial" runat="server" />
                <br />
                <asp:Label ID="lblId" runat="server" />
                <br />
                <asp:Label ID="lblRut" runat="server" />
                <br />
                <asp:Label ID="lblEmail" runat="server" />
                <br />
                <asp:Label ID="lblTelefono" runat="server" />
            </div>

            <div class="detalle">
                <h3>Detalle</h3>
                <asp:Label ID="lblProducto" runat="server" />
                <br />
                <asp:Label ID="lblDescripcion" runat="server" />
                <br />
                <asp:Label ID="lblEstado" runat="server" />
                <br />
                <asp:Label ID="lblCreacion" runat="server" />

            </div>    
        </div>
        <br />
        <div class="botones-ticket">
            <asp:Button ID="btnRegresarListado" text="Volver" runat="server" OnClick="btnRegresarListado_Click" CssClass="btn btn-primary"/> <!--Boton para regresar al listado de tickets-->
            <asp:Button ID="btnIrActualizar" Text="Actualizar" runat="server" OnClick="btnIrActualizar_Click" CssClass="btn btn-primary"/> <!--Boton para ir a la pagina de actualizacion del ticket-->
        </div>
    </div>
</asp:Content>
