<?php

    require_once '../controllers/internos.controlador.php';
    require_once '../models/internos.modelo.php';

    class ajaxInternos{
         public function ajaxQuieryInternos(){
            $internos = InternosControlador::ctrInternos();
            echo json_encode($internos);
         }
    }

    if (isset($_POST['accion']) && $_POST['accion'] ==  1){
        $internos = new ajaxInternos();
        $internos -> ajaxQuieryInternos();
    }
