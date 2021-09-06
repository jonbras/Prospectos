<%@ Page Language="C#" Title="Lista" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="WebProspecto.Lista" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Listado de prospectos</h1>

    <asp:Button ID="btnCapturar" runat="server" CssClass="btn btn-info" Font-Size="20px"
        Text="Capturar nuevo" OnClick="btnCapturar_Click" />
    
    <br />
    <br />

    <asp:Repeater ID="RepeaterLista" OnItemCommand="repEmployeeDetails_ItemCommand" runat="server">
        <HeaderTemplate>
            <table class="table">
                <tr>
                    <td>
                        <b>Nombre del prospecto</b>
                    </td>

                    <td>
                        <b>Primer apellido</b>
                    </td>

                    <td>
                        <b>Segundo apellido</b>
                    </td>

                    <td>
                        <b>Estado</b>
                    </td>

                    <td></td>
                </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lblNombreList" runat="server" Font-Names="Arial" Font-Size="10pt" Width="205px"
                        Text='<%#Eval("nombre")%>'></asp:Label>
                </td>

                <td>
                    <asp:Label ID="lblApellido1List" runat="server" Font-Names="Arial" Font-Size="10pt" Width="205px"
                        Text='<%#Eval("primer_apellido")%>'></asp:Label>
                </td>

                <td>
                    <asp:Label ID="lblApellido2List" runat="server" Font-Names="Arial" Font-Size="10pt" Width="205px"
                        Text='<%#Eval("segundo_apellido")%>'></asp:Label>
                </td>

                <td>
                    <asp:Label ID="lblEstadoList"
                        CssClass='<%# Eval("estado").Equals("Enviado") ? "alert alert-info": (Eval("estado").Equals("Autorizado") ? "alert alert-success": "alert alert-danger") %>'
                        runat="server" Font-Names="Arial" Font-Size="10pt" Width="205px"
                        Text='<%#Eval("estado") %>'></asp:Label>
                </td>

                <td>
                    <asp:LinkButton ID="myLinkButton" CommandArgument='<%#Eval("id")%>' CommandName="View"
                        runat="server"> Ver más / Evaluación </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
