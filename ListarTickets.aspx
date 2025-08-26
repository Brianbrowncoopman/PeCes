<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ListarTickets.aspx.cs" Inherits="PeCes.ListarTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenido-centrados">
        <!-- Título centrado -->
        <h2 class="titulo-centrado">Listado de tickets</h2>

        <!-- Mensaje opcional -->
        <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" CssClass="mensaje-error" />

        <!-- Tabla de tickets -->
        <div class="tabla-tickets">
            <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID del Ticket" />
                    <asp:TemplateField HeaderText="Nombre Cliente">
                        <ItemTemplate>
                            <%# Eval("Cliente.Nombre") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Producto" HeaderText="Producto" />
                    <asp:BoundField DataField="Descripción" HeaderText="Descripción" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="_createdAt" HeaderText="Fecha de Creación" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkDetalle" runat="server"
                                NavigateUrl='<%# "DetalleTicket.aspx?id=" + Eval("Id") %>'
                                Text="Ver detalle" CssClass="btn btn-primary btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Botón al final -->
        <div class="boton-nuevo-ticket">
            <asp:Button ID="btnNuevoTicket" runat="server" Text="➕ Crear nuevo ticket" PostBackUrl="~/CreacionTicket.aspx" CssClass="btn btn-success" />
        </div>
    </div>
</asp:Content>




