 <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-dark-primary elevation-4">
     <!-- Brand Logo -->
     <a href="index3.html" class="brand-link">
         <img src="views/assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
         <span class="brand-text font-weight-light">Proyecto</span>
     </a>

     <!-- Sidebar -->
     <div class="sidebar">

         <!-- Sidebar Menu -->
         <nav class="mt-2">
             <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">

                 <li class="nav-item">
                     <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/dashboard.php','content-wrapper')">
                         <i class="nav-icon fas fa-th"></i>
                         <p>
                             Tablero principal
                         </p>
                     </a>
                 </li>
                 <li class="nav-item">
                     <a href="#" class="nav-link active">
                         <i class="nav-icon fas fa-tachometer-alt"></i>
                         <p>
                             Submenu
                             <i class="right fas fa-angle-left"></i>
                         </p>
                     </a>
                     <ul class="nav nav-treeview">
                         <li class="nav-item">
                             <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/internos.php','content-wrapper')">
                                 <i class="far fa-circle nav-icon"></i>
                                 <p>Internos</p>
                             </a>
                         </li>
                         <li class="nav-item">
                             <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/familiares.php','content-wrapper')">
                                 <i class="far fa-circle nav-icon"></i>
                                 <p>Familiares</p>
                             </a>
                         </li>
                         <li class="nav-item">
                             <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/diagnosticos.php','content-wrapper')">
                                 <i class="far fa-circle nav-icon"></i>
                                 <p>Diagnosticos</p>
                             </a>
                         </li>
                     </ul>
                 </li>
                 <li class="nav-item">
                     <a style="cursor: pointer;" class="nav-link" onclick="CargarContenido('views/usuarios.php','content-wrapper')">
                         <i class="nav-icon fas fa-th"></i>
                         <p>
                             Usuarios
                         </p>
                     </a>
                 </li>
             </ul>
         </nav>
         <!-- /.sidebar-menu -->
     </div>
     <!-- /.sidebar -->
 </aside>