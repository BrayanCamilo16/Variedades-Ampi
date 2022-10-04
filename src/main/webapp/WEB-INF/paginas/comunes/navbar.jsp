<%@page import="vo.UsuarioVO" %>
<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet" type="text/css"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <div class="my-1">
            <a class="navbar-brand" href="${pageContext.request.contextPath}">
                <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt="" width="210">
            </a>
        </div>
        <button class="navbar-toggler text-primary border-0" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars text-primary"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <div class="ms-auto">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <% HttpSession sesion = request.getSession();
                        UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
                        String idRol = userVo.getIdRol();
                        if (idRol.equals(1)
                                || idRol.equals(2)) { %>
                    <li class="nav-item">
                        <a class="nav-link active fw-bold" aria-current="page" href="">Vender</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="">Pedidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="">Facturas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="${pageContext.request.contextPath}/vendedor/reporte.jsp">Reportes</a>
                    </li>

                    <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link active fw-bold" aria-current="page" href="${pageContext.request.contextPath}/admin/usuarios.jsp">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="">Mis pedidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="${pageContext.request.contextPath}/admin/categorias.jsp">Categorias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="${pageContext.request.contextPath}/admin/productos.jsp">Productos</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link fw-bold" aria-current="page" href="${pageContext.request.contextPath}/vendedor/reporte.jsp">Reportes</a>
                    </li>
                    <% }%>
                </ul>
            </div>
            <div class="ms-auto">
                <ul class="navbar-nav mb-2 mb-lg-0 d-flex align-self-auto">
                    <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                        <li class="nav-item">
                            <input type="submit" class="nav-link btn btn-primary text-white ms-1 "
                                   data-bs-toggle="modal" data-bs-target="#login" value="Cerrar sesi&#243;n">
                            <!-- <i class="fas fa-sign-out-alt me-1"></i>-->
                        </li>
                    </form>
                    <li class="nav-item">
                        <button class="nav-link btn btn-transparent text-dark mx-2"><i
                                class="far fa-bell"></i></button>
                    </li>
                    <li class="nav-item">
                        <p class="py-2 fw-bold">${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}
                            <img src="${pageContext.request.contextPath}/img/admin.png" style="border-radius: 50%; width: 30px;"/>
                            <input type="checkbox" id="salir">
                            <label for="salir">
                                <i class="ion-md-arrow-dropdown" style="font-size: 20px;"></i>
                            </label></p>
                        <div class="modal">
                            <div class="contenedor">
                                <div class="contenido">
                                    <img src="${pageContext.request.contextPath}/img/admin.png" alt=""/>
                                    <h1>${usuarioVo.idRol}</h1>
                                    <h2>${usuarioVo.emailUsuario}</h2>
                                    <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                        <li class="nav-item">
                                            <input type="submit" class="nav-link btn btn-primary text-white ms-1 "
                                                   data-bs-toggle="modal" data-bs-target="#login" value="Cerrar sesi&#243;n">
                                        </li>
                                    </form>
                                </div>
                            </div>
                            <label for="salir" class="cerrar-modal"></label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
