<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0"> Internos / Internos </h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#"> Inicio </a></li>
                    <li class="breadcrumb-item active"> Internos / Internos </li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-12">
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title"> criterios de busqueda</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 d-lg-flex">
                                <div style="width: 20%;" class="form-floating mx-1">
                                    <input id="fam" type="text" class="form-control" placeholder="Busqueda por familiar" data-index="1">
                                    <label for="fam">familiar</label>
                                </div>

                                <div style="width: 20%;"class="form-floating mx-1">
                                    <input id="nombre" type="text" class="form-control" placeholder="Busqueda por familiar" data-index="2">
                                    <label for="nombre">nombre</label>
                                </div>

                                <div style="width: 20%;" class="form-floating mx-1">
                                    <input id="paterno" type="text" class="form-control" placeholder="Busqueda por familiar" data-index="3">
                                    <label for="paterno">paterno</label>
                                </div>

                                <div style="width: 20%;" class="form-floating mx-1">
                                    <input id="materno" type="text" class="form-control" placeholder="Busqueda por familiar" data-index="4">
                                    <label for="materno">materno</label>
                                </div>

                                <div style="width: 20%;" class="form-floating mx-1">
                                    <input id="id" type="text" class="form-control" placeholder="Busqueda por familiar" data-index="0">
                                    <label for="id">id</label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <table id="tbl_intermos" class="table table-striped w-100 shadow">
                    <thead class="bg-info">
                        <tr>

                            <th> ID </th>
                            <th> Familiar </th>
                            <th> Nombre </th>
                            <th> Paterno </th>
                            <th> Materno </th>
                            <th> Dia </th>
                            <th> Mes </th>
                            <th> Año </th>
                            <th class="text-center"> Acciones </th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div><!-- /.container-fluid -->
</div>
<!-- /.content -->

<script>
    $(document).ready(function() {
        var table;

        $.ajax({
            url: "ajax/internos.ajax.php",
            type: "POST",
            data: {
                'accion': 1
            }, //listar el query
            dataType: 'json',
            secces: function(response) {
                console.log(response);
            }
        })

        table = $("#tbl_intermos").DataTable({
            dom: 'Bfrtip',
            buttons: [{
                    text: 'Nuevo',
                    className: 'AddNewRecord',
                    action: function(e, dt, node, config) {
                        alert('nuevo boto')
                    }
                },
                'excel', 'print', 'pageLength'
            ],

            ajax: {
                url: "ajax/internos.ajax.php",
                dataSrc: '',
                type: "POST",
                data: {
                    'accion': 1
                }, //listar el query   
            },
            responsive: {
                details: {
                    type: 'column'
                }
            },
            columnDefs: [{
                    targets: 8,
                    orderable: false,
                    render: function(data, type, full, meta) {
                        return "<center>" +
                            "<span class='btn btn-info'>" +
                            "Editar" +
                            "</span>" +
                            "<span class='btn btn-danger'>" +
                            "Eliminar" +
                            "</span>" +
                            "</center>"

                    }
                },

            ],
            language: {
                url: "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json" //lemguaje en la tabla 
            }
        });

        //Criterios de busqueda en especifico
        $("#fam").keyup(function(){
            table.column($(this).data('index')).search(this.value).draw();
        })

        $("#nombre").keyup(function(){
            table.column($(this).data('index')).search(this.value).draw();
        })

        $("#paterno").keyup(function(){
            table.column($(this).data('index')).search(this.value).draw();
        })

        $("#materno").keyup(function(){
            table.column($(this).data('index')).search(this.value).draw();
        })

        $("#id").keyup(function(){
            table.column($(this).data('index')).search(this.value).draw();
        })
    })
</script>