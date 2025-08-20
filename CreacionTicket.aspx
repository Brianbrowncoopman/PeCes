<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="CreacionTicket.aspx.cs" Inherits="PeCes.CreacionTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <h1>Crear un ticket de atencion nuevo</h1>
     <asp:Panel ID="pnlFormulario" runat="server" CssClass="form-panel">
         <h2>Información del Cliente</h2>
     </asp:Panel>
     <div class="form-group" CssClass="bg-danger">
         <asp:Label ID="lblTipoCliente" runat="server" Text="Tipo de Cliente:" AssociatedControlID="ddlTipoCliente"></asp:Label>
         <asp:DropDownList ID="ddlTipoCliente" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoCliente_SelectedIndexChanged">
              <asp:ListItem Text="Seleccionar" Value="" Selected="True" disabled="disabled"></asp:ListItem>
              <asp:ListItem Text="Persona Natural" Value="PersonaNatural"></asp:ListItem>
              <asp:ListItem Text="Empresa" Value="Empresa"></asp:ListItem>
         </asp:DropDownList>
         <br />
         <!--tipo de cliente-->
         <asp:RequiredFieldValidator ID="rfvTipoCliente" runat="server" 
                ControlToValidate="ddlTipoCliente" InitialValue=""
                ErrorMessage="Seleccione tipo de cliente" 
                ForeColor="Red" Display="Dynamic">
         </asp:RequiredFieldValidator>
         <br />
         <!--nombre-->
         <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre:" AssociatedControlID="txtNombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                ControlToValidate="txtNombre"
                ErrorMessage="Nombre es requerido" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
        <!--si es empresa -->
        <div class="form-group">
            <asp:Label ID="lblRazonSocial" runat="server" Text="Razón Social:" AssociatedControlID="txtRazonSocial"></asp:Label>
            <asp:TextBox ID="txtRazonSocial" runat="server"  Enabled="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRazonSocial" runat="server" 
                ControlToValidate="txtRazonSocial"
                ErrorMessage="Razón Social es requerida para empresas" 
                ForeColor="Red" Display="Dynamic"
                Enabled="false">
            </asp:RequiredFieldValidator>
       </div>
       <br />

        <!--rut-->
        <div class="form-group">
            <asp:Label ID="lblRut" runat="server" Text="RUT:" AssociatedControlID="txtRut"></asp:Label>
            <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRut" runat="server" 
                ControlToValidate="txtRut"
                ErrorMessage="RUT es requerido" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
         <!--email-->
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                     ControlToValidate="txtEmail"
                     ErrorMessage="Email es requerido" 
                    ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
        <!--telefono-->
        <div class="form-group">
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" AssociatedControlID="txtTelefono"></asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
                ControlToValidate="txtTelefono"
                ErrorMessage="Teléfono es requerido" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
        <!--producto-->
        <div class="form-group">
            <asp:Label ID="lblProducto" runat="server" Text="Producto:" AssociatedControlID="txtProducto"></asp:Label>
            <asp:TextBox ID="txtProducto" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvProducto" runat="server" 
                ControlToValidate="txtProducto"
                ErrorMessage="Producto es requerido" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
        <!--descripcion-->
        <div class="form-group" >
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" AssociatedControlID="txtDescripcion"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" 
                ControlToValidate="txtDescripcion"
                ErrorMessage="Descripción es requerida" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <br />
        <!--estado-->
        <div class="form-group">
            <asp:Label ID="lblEstado" runat="server" Text="Estado:" AssociatedControlID="ddlEstado"></asp:Label>
            <asp:DropDownList ID="ddlEstado" runat="server">
                <asp:ListItem Text="Seleccionar" Value="" Selected="True" disabled="disabled"></asp:ListItem>
                <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
                <asp:ListItem Text="En Proceso" Value="EnProceso"></asp:ListItem>
                <asp:ListItem Text="Resuelto" Value="Resuelto"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvEstado" runat="server" 
                ControlToValidate="ddlEstado" InitialValue=""
                ErrorMessage="Seleccione estado del ticket" 
                ForeColor="Red" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <!--boton crear ticket-->
        <asp:Button ID="btnCrearTicket" runat="server" Text="Crear Ticket" OnClick="btnCrearTicket_Click" CssClass="btn btn-primary" />

     </div>

</asp:Content>
