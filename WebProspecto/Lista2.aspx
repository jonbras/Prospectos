<%@ Page Language="C#" Title="Lista" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista2.aspx.cs" Inherits="WebProspecto.Lista2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Listado de prospectos</h1>

    <link runat="server" media="screen" rel="stylesheet" href="lib/datatables/css/dataTables.bootstrap4.min.css" />

    <div class="container">
        <br />
        <div style="width: 90%; margin: 0 auto;">
            <table id="prospectoDatatable" class="table table-striped table-bordered dt-responsive nowrap" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre del prospecto</th>
                        <th>Primer apellido</th>
                        <th>Segundo apellido</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    <asp:ScriptManagerProxy runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/lib/datatables/js/jquery.dataTables.min.js" />
            <asp:ScriptReference Path="~/lib/datatables/js/dataTables.bootstrap4.min.js" />
            <asp:ScriptReference Path="~/Scripts/global.js" />
        </Scripts>
    </asp:ScriptManagerProxy>

    <script>
        $.ajax({
            method: "POST",
            url: "Lista2/getProspectos",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (info) {
                console.log(info);
            });
    </script>
</asp:Content>
