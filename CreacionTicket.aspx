<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="CreacionTicket.aspx.cs" Inherits="PeCes.CreacionTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table.formulario-ticket {
            width: 100%;
            max-width: 800px;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #DCDEDE;
        }

        table.formulario-ticket td {
            padding: 10px;
            vertical-align: top;
        }

        table.formulario-ticket h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-centrado {
            text-align: center;
            padding-top: 20px;
        }

        .btn-azulado {
            background-color: #2980b9; 
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-azulado:hover {
            background-color: #2471a3; 
        }


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Crear un ticket de atención nuevo</h1>

    <tr>
    <td colspan="2">
        <asp:ValidationSummary 
            ID="vsCrearTicket" 
            runat="server" 
            ValidationGroup="vgCrearTicket" 
            ForeColor="Red" 
            HeaderText="Por favor corrija los siguientes errores:" 
            DisplayMode="BulletList" />
    </td>
</tr>

    <table class="formulario-ticket" cellpadding="8" cellspacing="0">
        <tr>
            <td><asp:Label ID="lblTipoCliente" runat="server" Text="Tipo de Cliente:" AssociatedControlID="ddlTipoCliente" /></td>
            <td>
                <asp:DropDownList ID="ddlTipoCliente" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoCliente_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccionar" Value="" Selected="True" disabled="disabled"></asp:ListItem>
                    <asp:ListItem Text="Persona Natural" Value="PersonaNatural"></asp:ListItem>
                    <asp:ListItem Text="Empresa" Value="Empresa"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTipoCliente" runat="server" ControlToValidate="ddlTipoCliente" InitialValue="" ErrorMessage="Seleccione tipo de cliente" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblNombre" runat="server" Text="Nombre:" AssociatedControlID="txtNombre" /></td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre es requerido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
                <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationExpression=".{5,}" ErrorMessage="El nombre debe tener al menos 5 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblRazonSocial" runat="server" Text="Razón Social:" AssociatedControlID="txtRazonSocial" /></td>
            <td>
                <asp:TextBox ID="txtRazonSocial" runat="server" Enabled="false" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvRazonSocial" runat="server" ControlToValidate="txtRazonSocial" ErrorMessage="Razón Social es requerida para empresas" ForeColor="Red" Display="Dynamic" Enabled="false" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblRut" runat="server" Text="RUT:" AssociatedControlID="txtRut" /></td>
            <td>
                <asp:TextBox ID="txtRut" runat="server" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvRut" runat="server" ControlToValidate="txtRut" ErrorMessage="RUT es requerido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
                <asp:RegularExpressionValidator ID="revRut" runat="server" ControlToValidate="txtRut" ValidationExpression="^(\d{8,9}-[\dkK])$" ErrorMessage="Formato de RUT inválido. Ej: 12345678-9" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" /></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email es requerido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$" ErrorMessage="Formato de email inválido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" AssociatedControlID="txtTelefono" /></td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Teléfono es requerido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblProducto" runat="server" Text="Producto:" AssociatedControlID="txtProducto" /></td>
            <td>
                <asp:TextBox ID="txtProducto" runat="server" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvProducto" runat="server" ControlToValidate="txtProducto" ErrorMessage="Producto es requerido" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
                <asp:RegularExpressionValidator ID="revProducto" runat="server" ControlToValidate="txtProducto" ValidationExpression=".{10,}" ErrorMessage="El producto debe tener al menos 10 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" AssociatedControlID="txtDescripcion" /></td>
            <td>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4" BackColor="#E6F0F0" />
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Descripción es requerida" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
                <asp:RegularExpressionValidator ID="revDescripcion" runat="server" ControlToValidate="txtDescripcion" ValidationExpression=".{10,}" ErrorMessage="La descripción debe tener al menos 10 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblEstado" runat="server" Text="Estado:" AssociatedControlID="ddlEstado" /></td>
            <td>
                <asp:DropDownList ID="ddlEstado" runat="server">
                    <asp:ListItem Text="Seleccionar" Value="" Selected="True" disabled="disabled"></asp:ListItem>
                    <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
                    <asp:ListItem Text="En Proceso" Value="EnProceso"></asp:ListItem>
                    <asp:ListItem Text="Resuelto" Value="Resuelto"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="ddlEstado" InitialValue="" ErrorMessage="Seleccione estado del ticket" ForeColor="Red" Display="Dynamic" ValidationGroup="vgCrearTicket" />
            </td>
        </tr>

        <!-- ValidationSummary para mostrar errores -->
        

        <!-- Botón de envío -->
        <tr>
            <td colspan="2" class="btn-centrado">
                <asp:Button 
                    ID="btnCrearTicket" 
                    runat="server" 
                    Text="Crear Ticket" 
                    OnClick="btnCrearTicket_Click" 
                    CssClass="btn-azulado" 
                    ValidationGroup="vgCrearTicket" />
            </td>
        </tr>
    </table>
</asp:Content>

