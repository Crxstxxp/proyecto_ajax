<?php

    class DashBoardControlador{

        static public function ctrGetDatosDashboard(){
            $datos = DashboardModelo::mdlGetDatosDashboard();

            return $datos;
        }

        static public function crtGetDiags(){
            $internos = DashboardModelo::mdlGetDiags();

            return $internos;
        }
    }


?>