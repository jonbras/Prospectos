function dtProspectos() {
    var table = $("#prospectoDatatable").DataTable({
        "destroy": true,
        "processing": true,
        "serverSide": true,
        "filter": true,
        "ajax": {
            "url": "/Lista2/getProspectos",
            "method": "POST",
            "contentType": "application/json; charset=utf-8",
            "datatype": "json",
            "data": function (d) {
                return JSON.stringify(d);
            },
            "dataSrc": "d.data"
        },
        "columnDefs": [{
            "targets": [0],
            "visible": false,
            "searchable": false
        }],
        "columns": [
            { "data": "Id", "name": "Id", "autoWidth": true },
            { "data": "Nombre", "name": "Nombre del prospecto", "autoWidth": true },
            { "data": "Apellido1", "name": "Primer apellido", "autoWidth": true },
            { "data": "Apellido2", "name": "Segundo apellido", "autoWidth": true },
            { "data": "Estado", "name": "Estado", "autoWidth": true },
            {
                "render": function (data, row) { return "<a href='#' class='btn btn-danger' onclick=DeleteCustomer('" + row.Id + "'); >Ver más detalles</a>"; }
            }
        ]
    });
}