<?php

    class InternosControlador{
        static public function ctrInternos(){
            $internos = InternosModelo::mdlInternos();
            return $internos;
        }
    }

?>