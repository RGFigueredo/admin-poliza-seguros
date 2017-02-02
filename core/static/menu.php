<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="index.php?do=panel" class="navbar-brand">
                <small>
							<i class="fa fa-leaf"></i>
							Sistema de control y registro de profesores.
						</small>
            </a>
        </div>
        <!--menu-->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Foto de <?php echo $data['nombre'] ?>" />
								<span class="user-info">
								Bienvenido, <?php echo $data['nombre']?>
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="configuracion.php">
                                <i class="ace-icon fa fa-cog"></i> Configuración
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-user"></i> Perfil
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="index.php?do=salir">
                                <i class="ace-icon fa fa-power-off"></i> Cerrar sesión
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- /.navbar-container -->
</div>

<div class="main-container" id="main-container">
    <div id="sidebar" class="sidebar responsive">
        <ul class="nav nav-list">
            <li class="active">
                <a href="index.php?do=panel">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text">Panel de control</span>
                </a>

                <b class="ardata"></b>
            </li>
        </ul>





        <!--CONFIG DEL ADMINISTRADOR-->
        <ul class="nav nav-list">
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa  fa-cogs"></i>
                    <span class="menu-text"> Configuracion</span>

                    <b class="ardata fa fa-angle-down"></b>
                </a>

                <b class="ardata"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="index.php?do=registroaseguradora">
                            <i class="menu-icon fa fa-caret-right"></i> Datos de empresa
                        </a>

                        <b class="ardata"></b>
                    </li>

                    <li class="">
                        <a href="">
                            <i class="menu-icon fa fa-caret-right"></i> Tipos de seguros
                        </a>

                        <b class="ardata"></b>
                    </li>
                    
                     <li class="">
                        <a href="">
                            <i class="menu-icon fa fa-caret-right"></i> Listas Polizas
                        </a>

                        <b class="ardata"></b>
                    </li>
                    
                     <li class="">
                        <a href="">
                            <i class="menu-icon fa fa-caret-right"></i> Tipos de polizas
                        </a>

                        <b class="ardata"></b>
                    </li>
                    

                  
                  


                </ul>
            </li>
        </ul>



        
        
        
        
        
        
        
        
        
        
        
        
        
         <!--CONFIG DEL Corredor-->
        <ul class="nav nav-list">
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa  fa-cogs"></i>
                    <span class="menu-text"> Corredor</span>

                    <b class="ardata fa fa-angle-down"></b>
                </a>

                <b class="ardata"></b>

                <ul class="submenu">
                  

                  

                   
                    
                     <li class="">
                        <a href="index.php?do=registrocorredor">
                            <i class="menu-icon fa-user-secret-right"></i> Agregar corredor
                        </a>
                        <b class="ardata"></b>
                    </li>
                     <li class="">
                        <a href="index.php?do=registroasegurado">
                            <i class="menu-icon fa fa-caret-right"></i> Lista de corredor
                        </a>
                        <b class="ardata"></b>
                    </li>
                  


                </ul>
            </li>
        </ul>
        
        





        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>