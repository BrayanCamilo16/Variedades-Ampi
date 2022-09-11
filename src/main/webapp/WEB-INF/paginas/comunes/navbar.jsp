<%@page import="vo.UsuarioVO"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <div class="my-1">
            <a class="navbar-brand" href="${pageContext.request.contextPath}">
                <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt="" width="210">
            </a>
        </div>
        <button class="navbar-toggler text-primary border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars text-primary"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <div class="ms-auto">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <%
                        HttpSession sesion = request.getSession();

                        UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
                        int idRol = userVo.getIdRol();

                        switch (idRol) {
                            case 1:
                                %>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="categorias.jsp">Categorias</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="">Marcas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="productos.jsp">Productos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="">Usuarios</a>
                                </li>
                                <%
                                break;
                            case 2:
                                %>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="pedidos.jsp">Pedidos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="productos.jsp">Productos</a>
                                </li>
                                <%
                                break;
                            case 3:
                                %>
                                <li class="nav-item">
                                    <a class="nav-link active fw-bold" aria-current="page" href="">Productos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" aria-current="page" href="">Mis pedidos</a>
                                </li>
                                <%
                                break;
                            default:
                                throw new AssertionError();
                        }
                    %>
                </ul>
            </div>
            <div class="ms-auto">
                <ul class="navbar-nav mb-2 mb-lg-0 d-flex align-self-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary text-white ms-1" href="../" data-bs-toggle="modal" data-bs-target="#login"><i class="fas fa-sign-out-alt me-1"></i></a>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link btn btn-transparent text-dark mx-2"><i class="far fa-bell"></i></button>
                    </li>
                    <li class="nav-item">
                        <p class="py-2 fw-bold">${usuarioVo.nombreUsuario}</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>