<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ListarTickets.aspx.cs" Inherits="PeCes.ListarTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Listado de tickets</h2>

    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" />

    <asp:Button ID="btnNuevoTicket" runat="server" Text="➕ Crear nuevo ticket" PostBackUrl="~/CreacionTicket.aspx" CssClass="btn btn-success mb-3" />


    <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="Cliente.Nombre" HeaderText="Nombre Cliente" />
            <asp:BoundField DataField="Cliente.Rut" HeaderText="RUT" />
            <asp:BoundField DataField="Producto" HeaderText="Producto" />
            <asp:BoundField DataField="Descripción" HeaderText="Descripción" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:BoundField DataField="_createdAt" HeaderText="Fecha Creación" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
        </Columns>
    </asp:GridView>
</asp:Content>