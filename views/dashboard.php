<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Tablero principal</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#"> Inicio </a></li>
                    <li class="breadcrumb-item active"> Tablero principal</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">
        <!-- Tarjetas de info -->
        <div class="row">
            <!-- Pinches etiquetas vrgas para hacer tarjetas dinamicas -->
            <div class="col-lg-2">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h4 id="totalinternos"> </h4>

                        <p>Total de internos</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">Mas informacion <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-2">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h4 id="totalfamiliares"> </h4>

                        <p>Familiares</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">Mas informacion <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-2">
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h4 id="totaldiag"> </h4>

                        <p>Total de diagnosticos</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">Mas informacion <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-12">
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title"> Total de internos</h3>
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
                        <div class="chart">
                            <canvas id="barChart" style="min-height: 250px; height: 300px; max-height:300px; width:100%;">

                            </canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.container-fluid -->

</div>
<!-- /.content -->

<script>
    $(document).ready(function() {
        $.ajax({
            url: "ajax/dashboard.ajax.php",
            method: "POST",
            dataType: "json",
            success: function(response) {
                //Estos datos los trae el procedimiento, se podria hacer de otras maneras
                console.log("respuesta", response);
                $("#totalinternos").html(response[0]['totalinternos']); //el nombre entre comillas viene del procedimiento
                $("#totalfamiliares").html(response[0]['totalfams']);
                $("#totaldiag").html(response[0]['totaldiag']);
            }
        })
    });

    /* Esta funcion recarga los elementos de la pagina cada 10 segundos
    setInterval(() => {
        $.ajax({
            url: "ajax/dashboard.ajax.php",
            method: "POST",
            dataType: "json",
            success: function(response) {
                //Estos datos los trae el procedimiento, se podria hacer de otras maneras
                console.log("respuesta", response);
                $("#totalinternos").html(response[0]['totalinternos']);
                $("#totalfamiliares").html(response[0]['totalfams']);
                $("#totaldiag").html(response[0]['totaldiag']);
            }
        })
    },10000)
    */

    $(document).ready(function() {
        $.ajax({
            url: "ajax/dashboard.ajax.php",
            method: "POST",
            data:{
                'accion': 1 //Parametro para obtener datos en charts
            },
            dataType: "json",
            success: function(response) {
                console.log(response);

                var fecha_diag = [];
                var ide = [];
                var total_diag_mes = 0;

                for (let i = 0; i < response.length; i++) {
                    fecha_diag.push(response[i]['fecha_diag']);
                    ide.push(response[i]['id']);
                    total_diag_mes = parseFloat(total_diag_mes) + parseFloat(response[i]['fecha_diag']);
                }

                $("#card-title").html("Total diagnosticos mes: " + parseFloat(total_diag_mes));
            }
        })
    });
</script>