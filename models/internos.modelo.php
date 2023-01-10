<?php

    require 'conex.php';

    class InternosModelo{

        static public function mdlInternos(){
            $smt = conexion::conex() -> prepare("SELECT * FROM internos");
            $smt -> execute();

            return $smt -> fetchAll();
        }
    }

?>