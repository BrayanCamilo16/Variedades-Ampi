<%@page import="vo.UsuarioVO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/nav-enlaces.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <header class="headerr-usuarios">
    <div class="logo">
        <a href=""><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""></a>
    </div>
    <nav class="navbarr-usuarios">
        <ul class="lista-todooo">
            <li>
                <a aria-current="page" href="">Usuarios <i class="fas fa-sharp fa-solid fa-comments-dollar"></i></a>
            </li>
            <li>
                <a aria-current="page" href="">Mis pedidos<i class="fas fa-solid fa-cart-arrow-down"></i></a>
            </li>
            <li>
                <a aria-current="page" href="">Categorias<i class="fas fa-solid fa-cookie"></i></a>
            </li>
            <li>
                <a aria-current="page" href="">Productos<i class="fas fa-solid fa-carrot"></i></a>
            </li>  
            <li>
                <a aria-current="page" href="">Reportes<i class="fas fa-solid fa-envelope-open-text"></i></a>
            </li>

            <!--            <li>
                            <button class="nav-link btn btn-transparent text-dark mx-2"><i
                                    class="far fa-bell"></i></button>
                        </li>-->
            <li>
                <div class="admin-modale">
                    <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                    <img src="${pageContext.request.contextPath}/img/admin.png" style="border-radius: 50%; width: 30px;"/>
                    <input type="checkbox" id="salir">
                    <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer"></i></label>
                    <div class="modales">
                        <div class="contenedorr">
                            <div class="contenidoo">
                                <img src="${pageContext.request.contextPath}/img/admin.png" alt=""/>
                                <h1>${usuarioVo.idRol}</h1>
                                <h2>${usuarioVo.emailUsuario}</h2>
                                <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                    <input type="submit" value="Cerrar sesi&#243;n">
                                </form>
                            </div>
                        </div>
                        <label for="salir" class="cerrar-modal"></label>
                    </div>
                </div>
            </li>
        </ul>
     
    </nav>
</header>
                                    <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        
    </body>
</html>
