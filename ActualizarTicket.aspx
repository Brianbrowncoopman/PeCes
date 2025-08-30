<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ActualizarTicket.aspx.cs" Inherits="PeCes.ActualizarTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table.formulario-actualizar {
            width: 100%;
            max-width: 800px;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #DCDEDE;
        }

        table.formulario-actualizar td {
            padding: 10px;
            vertical-align: top;
        }

        .btn-centrado {
            text-align: center;
            padding-top: 20px;
        }

        .mensaje-error {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: red;
        }
        .btn-verde {
            background-color: #27ae60; 
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
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

        .btn-amarillo {
            background-color: #f1c40f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-amarillo:hover {
            background-color: #d4ac0d;
        }


        .btn-verde:hover {
            background-color: #1e8449; 
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje-error" />

    <table class="formulario-actualizar" cellpadding="8" cellspacing="0">
        <!-- Campos no editables -->
        <tr>
            <td><strong>ID del Ticket:</strong></td>
            <td><asp:Label ID="lblId" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Nombre Cliente:</strong></td>
            <td><asp:Label ID="lblNombreCliente" runat="server" /></td>
        </tr>

        <!-- Campos editables del cliente -->
        <tr>
            <td><asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" AssociatedControlID="txtTelefono" /></td>
            <td><asp:TextBox ID="txtTelefono" runat="server" BackColor="#E6F0F0"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" /></td>
            <td><asp:TextBox ID="txtEmail" runat="server" BackColor="#E6F0F0"/></td>
        </tr>

        <!-- Campos editables del ticket -->
        <tr>
            <td><asp:Label ID="lblProducto" runat="server" Text="Producto:" AssociatedControlID="txtProducto" /></td>
            <td><asp:TextBox ID="txtProducto" runat="server" BackColor="#E6F0F0"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" AssociatedControlID="txtDescripcion" /></td>
            <td><asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="4" BackColor="#E6F0F0"/></td>
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
                <asp:RequiredFieldValidator ID="rfvEstado" runat="server"
                    ControlToValidate="ddlEstado" InitialValue=""
                    ErrorMessage="Seleccione estado del ticket"
                    ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>

        <!-- Botón para guardar -->
        <tr>
            <td colspan="2" class="btn-centrado">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" CssClass="btn-verde" />
            </td>
        </tr>

        <!-- Botones de navegación -->
        <tr>
            <td colspan="2" class="btn-centrado">
                <asp:Button ID="btnRegresarDetalle" runat="server" Text="Regresar a detalle" OnClick="btnRegresarDetalle_click" CssClass="btn-azulado" />
                &nbsp;
                <asp:Button ID="btbIrAListado" runat="server" Text="Regresar al listado" OnClick="btbIrAListado_click" CssClass="btn-amarillo" />
            </td>
        </tr>
    </table>
</asp:Content>