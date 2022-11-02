<%@page import="vo.UsuarioVO" %>
<jsp:include page="head-css.jsp" />
<header class="headerr-usuarios">
    <div class="logo">
        <a href=""><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""></a>
    </div>
    <nav class="navbarr-usuarios">
        <ul class="lista-todooo">
            <% HttpSession sesion = request.getSession();
                UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
                String idRol = userVo.getIdRol();
                String elrol = " ";
            if (idRol.equals("1")) {
                elrol = "Administrador";
            } else if (idRol.equals("2")) {
                elrol = "Vendedor";
            } else if (idRol.equals("3")) {
                elrol = "Cliente";
            } else {
                elrol = "Desconocido";
            }
            %>
            <%if (idRol.equals("1")) {%>
            <!--                        ESTE ES EL INICIO DEL NAVBAR DEL ADMINISTRADOR-->
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/admin/usuarios.jsp" class="enlacesss">Usuarios<i class="fas fa-solid fa-users"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="" class="enlacesss">Mis pedidos <i class="fas fa-solid fa-cart-arrow-down"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/admin/categorias.jsp" class="enlacesss">Categorias<i class="fas fa-solid fa-cookie"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/admin/productos.jsp" class="enlacesss">Productos<i class="fas fa-solid fa-carrot"></i></a>
            </li>  
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/admin/reporte.jsp" class="enlacesss">Reportes<i class="fas fa-solid fa-envelope-open-text"></i></a>
            </li>

            <!--            <li>
                            <button class="nav-link btn btn-transparent text-dark mx-2"><i
                                    class="far fa-bell"></i></button>
                        </li>-->
            <li class="listass-enlacess">
                <div class="admin-modalee">
                    <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                    <img src="${pageContext.request.contextPath}/img/admin.png" style="border-radius: 50%; width: 30px; height: 30px;"/>
                    <input type="checkbox" id="salir">
                    <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer"></i></label>
                    <div class="modales">
                        <div class="contenedorr">
                            <div class="contenidoo">
                                <img src="${pageContext.request.contextPath}/img/admin.png" alt=""/>
                                <h1><%=elrol%></h1>
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

        <!--            ESTE ES FIN DEL NAVBAR DEL ADMINISTRADOR-->

        <!--            ESTE ES INICIO DEL NAVBAR DEL VENDEDOR-->
        <ul class="lista-todooo">
            <% } else if (idRol.equals("2")) { %>
            <li class="listass-enlacess">
                <a aria-current="page" href="" class="enlacesss">Mis pedidos<i class="fas fa-solid fa-cart-arrow-down"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/vendedor/categorias.jsp" class="enlacesss">Categorias<i class="fas fa-solid fa-cookie"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/vendedor/productos.jsp" class="enlacesss">Productos<i class="fas fa-solid fa-carrot"></i></a>
            </li>  
            <li class="listass-enlacess">
                <a aria-current="page" href="${pageContext.request.contextPath}/vendedor/reporte.jsp" class="enlacesss">Reportes<i class="fas fa-solid fa-envelope-open-text"></i></a>
            </li>
            <!--                <li>
                                <button class="nav-link btn btn-transparent text-dark mx-2"><i
                                        class="far fa-bell"></i></button>
                            </li>-->
            <li class="listass-enlacess">
                <div class="admin-modalee">
                    <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                    <img src="${pageContext.request.contextPath}/img/vendedor.jpg" style="border-radius: 50%; width: 30px; height: 30px;"/>
                    <input type="checkbox" id="salir">
                    <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer"></i></label>
                    <div class="modales">
                        <div class="contenedorr">
                            <div class="contenidoo">
                                <img src="${pageContext.request.contextPath}/img/vendedor.jpg" alt=""/>
                                <h1><%=elrol%></h1>
                                <h2>${usuarioVo.emailUsuario}</h2>
                                <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                    <input type="submit" data-bs-toggle="modal" data-bs-target="#login" value="Cerrar sesi&#243;n">
                                </form>
                            </div>
                        </div>
                        <label for="salir" class="cerrar-modal"></label>
                    </div>
                </div>
            </li>
        </ul>
        <!--            ESTE ES FIN DEL NAVBAR DEL VENDEDOR-->

        <!--            ESTE ES INICIO DEL NAVBAR DEL CLIENTE-->
        <ul class="lista-todooo">
            <%} else {%>
            <li class="listass-enlacess">
                <a aria-current="page" href="" class="enlacesss">Vender<i class="fas fa-sharp fa-solid fa-comments-dollar"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="" class="enlacesss">Pedidos<i class="fas fa-solid fa-cart-arrow-down"></i></a>
            </li>
            <li class="listass-enlacess">
                <a aria-current="page" href="" class="enlacesss">Facturas<i class="fas fa-solid fa-file-invoice-dollar"></i></a>
            </li>
            <!--                <li>
                                <button class="nav-link btn btn-transparent text-dark mx-2"><i
                                        class="far fa-bell"></i></button>
                            </li>-->
            <li class="listass-enlacess">
                <div class="admin-modalee">
                    <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                    <img src="${pageContext.request.contextPath}/img/cliente.png" style="border-radius: 50%; width: 30px; height: 30px;"/>
                    <input type="checkbox" id="salir">
                    <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer"></i></label>
                    <div class="modales">
                        <div class="contenedorr">
                            <div class="contenidoo">
                                <img src="${pageContext.request.contextPath}/img/cliente.png" alt=""/>
                                <h1><%=elrol%></h1>
                                <h2>${usuarioVo.emailUsuario}</h2>
                                <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                    <input type="submit" data-bs-toggle="modal" data-bs-target="#login" value="Cerrar sesi&#243;n">
                                </form>
                            </div>
                        </div>
                        <label for="salir" class="cerrar-modal"></label>
                    </div>
                </div>
            </li>
            <% }%>
        </ul>
        <!--            ESTE ES FIN DEL NAVBAR DEL CLIENTE-->
    </nav>
</header>
