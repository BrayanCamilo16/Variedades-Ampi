<%@page import="vo.UsuarioVO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

    </head>
    <body>
        <nav class="navbar">
            <a href="">
                <img src="img/variedades-ampi.png" alt="" width="210">
            </a>

            <ul>
                <li>
                    <a aria-current="page" href="">Usuarios</a>
                </li>
                <li>
                    <a aria-current="page" href="">Mis pedidos</a>
                </li>
                <li>
                    <a aria-current="page" href="">Categorias</a>
                </li>
                <li>
                    <a aria-current="page" href="">Productos</a>
                </li>  
                <li>
                    <a aria-current="page" href="">Reportes</a>
                </li>
                <li>
                    <input type="checkbox" id="salir">
                    <label for="salir">
                        <i class="ion-md-arrow-dropdown" style="font-size: 20px;"></i>
                    </label>
                    <div class="modal">
                        <div class="contenedor">
                            <div class="contenido">
                                <img src="img/admin.png" alt=""/>
                                <h1>Administrador</h1>
                                <h2>camilagonza@gmail.com</h2>
                                <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                    <input type="submit" class="nav-link btn btn-primary text-white ms-1 "
                                           data-bs-toggle="modal" data-bs-target="#login" value="Cerrar sesi&#243;n">
                                </form>
                            </div>
                        </div>
                        <label for="salir" class="cerrar-modal"></label> 
                    </div>
                </li>
            </ul>
        </nav>
    </body>
</html>
