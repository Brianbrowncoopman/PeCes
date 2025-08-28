<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ActualizarTicket.aspx.cs" Inherits="PeCes.ActualizarTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" /> <!--aca se pasa el id-->
    <br />

    <!-- Campos no editables -->

    <asp:Label ID="lblId" runat="server" Text="ID:" /><br /> <!--aca pasa el id-->

    <asp:Label ID="lblNombreCliente" runat="server" Text="Nombre Cliente:" /><br />

    <!-- Campos editables del cliente -->
    <div class="form-group">
        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" AssociatedControlID="txtTelefono" CssClass="form-label" />
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" CssClass="form-label" />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
    </div>


    <!-- Campos editables del ticket -->
    <div class="form-group">
        <asp:Label ID="lblProducto" runat="server" Text="Producto:" AssociatedControlID="txtProducto" CssClass="form-label" />
        <asp:TextBox ID="txtProducto" runat="server" CssClass="form-control" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" AssociatedControlID="txtDescripcion" CssClass="form-label" />
        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
    </div>

    <!--<asp:TextBox ID="txtEstado" runat="server"  ></asp:TextBox> -->

    <div class="form-group">
        <asp:Label ID="lblEstado" runat="server" Text="Estado:" AssociatedControlID="ddlEstado"></asp:Label>
        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
            <asp:ListItem Text="Seleccionar" Value="" Selected="True" disabled="disabled"></asp:ListItem>
            <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
            <asp:ListItem Text="En Proceso" Value="EnProceso"></asp:ListItem>
            <asp:ListItem Text="Resuelto" Value="Resuelto"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvEstado" runat="server" 
            ControlToValidate="ddlEstado" InitialValue=""
            ErrorMessage="Seleccione estado del ticket" 
            ForeColor="Red" Display="Dynamic" />
</div>

 
    <!-- Botón para guardar cambios -->
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" CssClass="btn btn-success" />
    <hr />
    <hr />
    <div>
        <asp:Button ID="btnRegresarDetalle" runat="server" Text="Regresar a detalle" OnClick="btnRegresarDetalle_click" CssClass="btn btn-success" />
        <asp:Button ID="btbIrAListado" runat="server" Text="Regresar al listado" OnClick="btbIrAListado_click" CssClass="btn btn-success" />
    </div>

    
    
</asp:Content>
