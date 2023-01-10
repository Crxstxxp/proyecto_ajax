<?php

    class conexion{

        static public function conex(){
            try{
                $conex = new PDO("mysql:host=localhost; dbname=centro","root","", array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

                return $conex;
            }
            catch(PDOException $e){
                echo "))):";
            }
        }

    }

?>