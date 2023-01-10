<?php

    require_once "../controllers/dashboard.controlador.php";
    require_once "../models/dashboard.model.php";

    class AjaxDashboard{

        public function GetDatosDashboard(){
            $datos = DashBoardControlador::ctrGetDatosDashboard();
            echo json_encode($datos);
        }

        public function getDiags(){
            $internos = DashBoardControlador::crtGetDiags();
            echo json_encode($internos);
        }
    }

    if (isset($_POST['accion']) && $_POST['accion'] == 1 ){
        $internos = new AjaxDashboard();
        $internos -> getDiags();
    } else {
        $datos = new AjaxDashboard();
        $datos -> GetDatosDashboard();
    }
