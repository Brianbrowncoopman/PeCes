<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="DetalleTicket.aspx.cs" Inherits="PeCes.DetalleTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table.detalle-ticket {
            width: 100%;
            max-width: 800px;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #DCDEDE;
        }

        table.detalle-ticket td {
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

        h3 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 10px;
            color: #2c3e50;
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

        .btn-verde:hover {
            background-color: #1e8449; /* Verde más oscuro */
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje-error" />

    <h3>Datos del Cliente</h3>
    <table class="detalle-ticket" cellpadding="8" cellspacing="0">
        <tr>
            <td><strong>Cliente:</strong></td>
            <td><asp:Label ID="lblCliente" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Tipo de Cliente:</strong></td>
            <td><asp:Label ID="lblRazonSocial" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>ID:</strong></td>
            <td><asp:Label ID="lblId" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>RUT:</strong></td>
            <td><asp:Label ID="lblRut" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td><asp:Label ID="lblEmail" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Teléfono:</strong></td>
            <td><asp:Label ID="lblTelefono" runat="server" /></td>
        </tr>
    </table>

    <h3>Detalle del Ticket</h3>
    <table class="detalle-ticket" cellpadding="8" cellspacing="0">
        <tr>
            <td><strong>Producto:</strong></td>
            <td><asp:Label ID="lblProducto" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Descripción:</strong></td>
            <td><asp:Label ID="lblDescripcion" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Estado:</strong></td>
            <td><asp:Label ID="lblEstado" runat="server" /></td>
        </tr>
        <tr>
            <td><strong>Fecha de Creación:</strong></td>
            <td><asp:Label ID="lblCreacion" runat="server" /></td>
        </tr>
    </table>

    <div class="btn-centrado">
        <asp:Button ID="btnRegresarListado" Text="Volver" runat="server" OnClick="btnRegresarListado_Click" CssClass="btn-amarillo" />
        &nbsp;
        <asp:Button ID="btnIrActualizar" Text="Actualizar" runat="server" OnClick="btnIrActualizar_Click" CssClass="btn-verde" />
    </div>
</asp:Content>
