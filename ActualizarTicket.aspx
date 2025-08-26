<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ActualizarTicket.aspx.cs" Inherits="PeCes.ActualizarTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" />

    <!-- Campos no editables -->
    <asp:Label ID="lblId" runat="server" Text="ID:" /><br />
    <asp:Label ID="lblNombreCliente" runat="server" Text="Nombre Cliente:" /><br />

    <!-- Campos editables del cliente -->
    <asp:TextBox ID="txtTelefono" runat="server" Placeholder="Teléfono" /><br />
    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" /><br />

    <!-- Campos editables del ticket -->
    <asp:TextBox ID="txtProducto" runat="server" Placeholder="Producto" /><br />
    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4" Columns="50" Placeholder="Descripción" /><br />
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
