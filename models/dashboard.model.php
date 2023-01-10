<?php

    require_once "conex.php";

    class DashboardModelo{

        static public function mdlGetDatosDashboard(){
            //Llamar procedimientos de las bases de datps
            $stmt = conexion::conex() ->prepare('call datosDasboard');

            $stmt -> execute();
            return $stmt -> fetchAll(PDO::FETCH_OBJ);
        }

        static public function mdlGetDiags(){
            $internos = conexion::conex() -> prepare('call prc_diags');

            $internos -> execute();
            return $internos -> fetchAll(PDO::FETCH_OBJ);
        }
    }

?>