 <!-- Navbar -->
 <nav class="main-header navbar navbar-expand navbar-white navbar-light">
     <!-- Left navbar links -->
     <ul class="navbar-nav">
         <li class="nav-item">
             <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
         </li>
         <li class="nav-item d-none d-sm-inline-block">
         <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/dashboard.php','content-wrapper')">
                 Inicio
             </a>
         </li>
         <li class="nav-item d-none d-sm-inline-block">
              <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/internos.php','content-wrapper')">
                 Internos
             </a>
         </li>
         <li class="nav-item d-none d-sm-inline-block">
              <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/familiares.php','content-wrapper')">
                 Familiares
             </a>
         </li>
         <li class="nav-item d-none d-sm-inline-block">
              <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/diagnosticos.php','content-wrapper')">
                 Diagnosticos
             </a>
         </li>
         <li class="nav-item d-none d-sm-inline-block">
              <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/usuarios.php','content-wrapper')">
                 Usuarios
             </a>
         </li>  

     </ul>
 </nav>
 <!-- /.navbar -->