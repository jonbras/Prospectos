<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProspecto._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Prospectos en ASP.NET</h1>
        <br />

        <div class="row">
            <div class="col-md-6">
                <p>
                    <a class="btn btn-default btn-lg" href="/Captura">Realizar la captura de un prospecto</a>
                </p>
            </div>

             <div class="col-md-6">
                <p>
                    <a class="btn btn-default btn-lg" href="/Lista">Ver la lista de prospectos</a>
                </p>
            </div>
       </div>
    </div>

</asp:Content>
