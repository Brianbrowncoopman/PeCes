<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="DetalleTicket.aspx.cs" Inherits="PeCes.DetalleTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" />

    <asp:Label ID="lblCliente" runat="server" />
    <asp:Label ID="lblProducto" runat="server" />
    <asp:Label ID="lblDescripcion" runat="server" />

</asp:Content>
