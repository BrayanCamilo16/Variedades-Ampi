<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vo.UsuarioVO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="head-css.jsp" />
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
            UsuarioVO userrVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
            String idRol = userrVo.getIdRol();
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
        <header class="headerr-usuario">
            <div class="logo">
                <a href=""><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""></a>
            </div>
            <div class="admin-modale">
                <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                <img src="${pageContext.request.contextPath}/img/admin.png" style="border-radius: 50%; width: 30px;"/>
                <input type="checkbox" id="salir">
                <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer; color: #0F42A6;"></i></label>
                <div class="modales">
                    <div class="contenedorr">
                        <div class="contenidoo">
                            <img src="${pageContext.request.contextPath}/img/admin.png" alt=""/>
                            <h1><%=elrol%></h1>
                            <h2>${usuarioVo.emailUsuario}</h2>
                            <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                <input type="submit" value="Cerrar sesi&#243;n" class="CerrarSesion">
                            </form>
                        </div>
                    </div>
                    <label for="salir" class="cerrar-modal"></label>
                </div>
            </div>
        </header>
        <%} else if (idRol.equals("2")) {%>
        <header class="headerr-usuario">
            <div class="logo">
                <a href=""><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""></a>
            </div>
            <div class="admin-modale">
                <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                <img src="${pageContext.request.contextPath}/img/vendedor.jpg" style="border-radius: 50%; width: 30px;"/>
                <input type="checkbox" id="salir">
                <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer; color: #0F42A6;"></i></label>
                <div class="modales">
                    <div class="contenedorr">
                        <div class="contenidoo">
                            <img src="${pageContext.request.contextPath}/img/vendedor.jpg" alt=""/>
                            <h1><%=elrol%></h1>
                            <h2>${usuarioVo.emailUsuario}</h2>
                            <form action="${pageContext.request.contextPath}/Usuario" method="POST">
                                <input type="hidden" name="codigoId" value="${usuarioVo.idUsuario}">
                                <a><button type="submit">Actualizar Mi Perfil</button></a>
                                <input type="hidden" name="action" value="4">
                            </form>
                            <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                <input type="submit" value="Cerrar sesi&#243;n" class="CerrarSesion">
                            </form>
                        </div>
                    </div>
                    <label for="salir" class="cerrar-modal"></label>
                </div>
            </div>
        </header>
        <%} else {%>
        <header class="headerr-usuario">
            <div class="logo">
                <a href=""><img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt=""></a>
            </div>
            <div class="admin-modale">
                <p>${usuarioVo.nombreUsuario}  ${usuarioVo.apellidoUsuario}</p>
                <img src="${pageContext.request.contextPath}/img/cliente.png" style="border-radius: 50%; width: 30px;"/>
                <input type="checkbox" id="salir">
                <label for="salir"><i class="ion-md-arrow-dropdown" style="font-size: 20px; cursor: pointer; color: #0F42A6;"></i></label>
                <div class="modales">
                    <div class="contenedorr">
                        <div class="contenidoo">
                            <img src="${pageContext.request.contextPath}/img/cliente.png" alt=""/>
                            <h1><%=elrol%></h1>
                            <h2>${usuarioVo.emailUsuario}</h2>
                            <form method="post" action="${pageContext.request.contextPath}/Sesiones">
                                <input type="submit" value="Cerrar sesi&#243;n" class="CerrarSesion">
                            </form>
                        </div>
                    </div>
                    <label for="salir" class="cerrar-modal"></label>
                </div>
            </div>
        </header>
        <%}%>
    </body>
</html>
