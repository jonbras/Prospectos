<%@ Page Language="C#" Title="Evalua" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Evalua.aspx.cs" Inherits="WebProspecto.Evalua" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Evaluaciòn de prospecto</h1>
    <asp:Repeater ID="RepeaterEvalua" runat="server">
        <HeaderTemplate>
            <table class="table">
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td colspan="8">
                    <asp:Label ID="lblEstado" 
                        CssClass='<%# Eval("estado").Equals("Enviado") ? "alert alert-info": (Eval("estado").Equals("Autorizado") ? "alert alert-success": "alert alert-danger") %>'
                        runat="server" Font-Names="Arial" Font-Size="10pt" 
                        Width="135px"
                        Text='<%#Eval("estado")%>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="10pt" Width="135px"
                        Text="Nombre del prospecto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="205px"
                        Text='<%#Eval("nombre")%>' ReadOnly="True"></asp:TextBox>
                </td>

                <td>
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Primer apellido:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control" Width="205px"
                        Text='<%#Eval("primer_apellido")%>' ReadOnly="True"></asp:TextBox>
                </td>

                <td>
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Segundo apellido:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control" Width="205px"
                        Text='<%#Eval("segundo_apellido")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCalle" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Calle:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" Width="205px"
                        Text='<%#Eval("calle")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblNumero" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Nùmero:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" Width="58px" MaxLength="4"
                        Text='<%#Eval("numero")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblColonia" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Colonia:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" Width="205px"
                        Text='<%#Eval("colonia")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblCP" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Còdigo Postal:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" Width="66px" MaxLength="5"
                        Text='<%#Eval("codigo_postal")%>' ReadOnly="True"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTel" runat="server" Font-Names="Arial" Font-Size="10pt" Width="90px"
                        Text="Telèfono:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" Width="112px" MaxLength="12"
                        Text='<%#Eval("telefono")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblRFC" runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="RFC:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRFC" runat="server" CssClass="form-control" Width="150px"
                        Text='<%#Eval("rfc")%>' ReadOnly="True"></asp:TextBox>
                </td>
                <td colspan="4">
                    <asp:Label ID="lblObservacion" Visible='<%#Eval("estado").Equals("Rechazado")%>'
                        runat="server" Font-Names="Arial" Font-Size="10pt"
                        Text="Observaciones:"></asp:Label>

                    <asp:TextBox  ID="txtObservacion" ReadOnly="True" 
                        Visible='<%#Eval("estado").Equals("Rechazado")%>'
                        CssClass="form-control" Width="300px" 
                        runat="server"
                        Rows="3" TextMode="MultiLine"
                        Text='<%#Eval("observacion")%>'></asp:TextBox>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>


    <asp:Repeater ID="RepeaterDoc" OnItemCommand="repeaterDoc_ItemCommand" runat="server">
        <HeaderTemplate>
            <table class="table">
                <tr>
                    <td>
                        <b>Nombre del documento</b>
                    </td>
                    <td></td>
                </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="myLinkButton" CommandArgument='<%#String.Concat(Eval("URL"))%>' 
                        CommandName="View" runat="server"> <%#Eval("Nombre")%> </asp:LinkButton>
                </td>
                <td></td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <div style="padding-bottom: 20px;">
        <asp:Label ID="lblObservaciones" runat="server" Font-Names="Arial" Font-Size="10pt"
            Text="Observaciones:"></asp:Label>
        
        <asp:TextBox  ID="txtObservaciones" Rows="3" Width="300px" CssClass="form-control"
        runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>

    <asp:Button ID="btnAutoriza" Text="Autorizar" CssClass="btn btn-primary" runat="server" 
        Font-Size="20px" OnClick="btnAutoriza_Click" />
    
    <asp:Button ID="btnRechaza" Text="Rechazar" CssClass="btn btn-danger" runat="server" 
        Font-Size="20px" OnClick="btnRechaza_Click" />

    <asp:Button ID="btnSalir" CssClass="btn" Font-Size="20px" runat="server"
        Text="Salir" OnClick="btnSalir_Click" />
</asp:Content>
