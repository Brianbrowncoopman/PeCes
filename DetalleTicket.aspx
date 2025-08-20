<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="DetalleTicket.aspx.cs" Inherits="PeCes.DetalleTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" />

    <asp:Label ID="lblId" runat="server" />
    <asp:Label ID="lblCliente" runat="server" />
    <asp:Label ID="lblProducto" runat="server" />
    <asp:Label ID="lblDescripcion" runat="server" />

    <asp:Button ID="btnRegresarListado" text="Volver" runat="server" OnClick="btnRegresarListado_Click" CssClass="btn btn-primary"/> <!--Boton para regresar al listado de tickets-->
    <asp:Button ID="btnIrActualizar" Text="Actualizar" runat="server" OnClick="btnIrActualizar_Click" CssClass="btn btn-primary"/> <!--Boton para ir a la pagina de actualizacion del ticket-->

</asp:Content>
