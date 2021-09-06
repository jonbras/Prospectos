<%@ Page Language="C#" Title="Captura" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Captura.aspx.cs" Inherits="WebProspecto.Captura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Captura de prospecto</h1>
    <h3>Por favor, proporciona la siguiente informaciòn:</h3>
    <h4>Los campos con <b class="text-danger">*</b> son obligatorios</h4>

    <table class="table1 table" id="tableForm" runat="server">
        <tr>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblNombre" runat="server" Font-Names="Arial" Font-Size="10pt" Width="135px"
                    Text="Nombre del prospecto:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="205px"></asp:TextBox>
            </td>

            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblApellido1" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Primer apellido:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control" Width="205px"></asp:TextBox>
            </td>

            <td>
                <asp:Label ID="lblApellido2" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Segundo apellido:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control" Width="205px"></asp:TextBox>
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblCalle" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Calle:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" Width="205px"></asp:TextBox>
            </td>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblNumero" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Nùmero:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" Width="58px" MaxLength="4"></asp:TextBox>
            </td>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblColonia" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Colonia:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" Width="205px"></asp:TextBox>
            </td>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblCP" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Còdigo Postal:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" Width="66px" MaxLength="5"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblTel" runat="server" Font-Names="Arial" Font-Size="10pt" Width="90px"
                    Text="Telèfono:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" Width="112px" MaxLength="12"></asp:TextBox>
            </td>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblRFC" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="RFC:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRFC" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
            </td>
            <td colspan="4"></td>
        </tr>

        <tr>
            <td>
                <b class="text-danger" font-size="10pt">*</b>
                <asp:Label ID="lblDocumento" runat="server" Font-Names="Arial" Font-Size="10pt"
                    Text="Documentos"></asp:Label>
            </td>
            <td colspan="7">
                <asp:Button ID="btnNuevoDoc" runat="server" CssClass="btn-primary" Font-Size="12px"
                    Text="+" OnClick="btnNuevoDoc_Click" />
            </td>
        </tr>
    </table>


    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table class="table">
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td>
                    <b class="text-danger" font-size="10pt" id="bDanger" runat="server">*</b>
                    <asp:Label ID="lblDoc" runat="server" Font-Names="Arial" Font-Size="10pt" Width="150px"
                        Text="Nombre del documento:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDoc" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                </td>
                <td colspan="6">
                    <asp:FileUpload ID="fileUpload" runat="server" Width="400px" />
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>


    <div style="padding-bottom: 30px;">
        <asp:Label ID="lblMensajes" runat="server" Font-Bold="True" Font-Names="Arial"
            Font-Size="10pt" ForeColor="Red"></asp:Label>
    </div>

    <asp:Button ID="btnEnviar" runat="server" CssClass="btn btn-success" Font-Size="20px"
        Text="Enviar" OnClick="btnEnviar_Click" />

    <input id="btnSalir" type="button" class="btn" style="font-size: 20px" value="Salir"
        onclick="btnSalir_Click();" />
</asp:Content>
