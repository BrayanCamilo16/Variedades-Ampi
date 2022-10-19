<%@page import="vo.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>
        <link href="../css/Administrador.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/funciones.js" type="text/javascript"></script>
    </head>
    <body>  
        ${ConsultadoUsuario}
        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->

        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de activar e inactivar
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>




        <%//cuando es diferente a nulo es que si hubo un error
            //este es el mensaje de usuario creado exitosamente o no
            HttpSession sesiones = request.getSession();
            if (sesiones.getAttribute("mensajeErroro") != null) {%>
        <script>
            alert("${mensajeErroro}");
        </script>

        <%} else {%>
        <script>
            alert("${mensajeExitoo}");
        </script>
        <%}%>
        <div class="todo">
            <a class="btn btn-primary" href="" data-bs-toggle="modal" data-bs-target="#crear"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
            <a class="btn btn-primary" href="" data-bs-toggle="modal" data-bs-target="#update"><i class="fas fa-user-plus me-1"></i> usuario</a>
            <table id="example" class="tables">
                <thead>
                    <tr>
                        <th class="titulo-usuarios text-center">#</th>
                        <th class="titulo-usuarios text-center">Nombre</th>
                        <th class="titulo-usuarios text-center">Apellido</th>
                        <th class="titulo-usuarios text-center">Email</th>
                        <th class="titulo-usuarios text-center">Tipo Documento</th>
                        <th class="titulo-usuarios text-center">Numero Documento</th>
                        <th class="titulo-usuarios text-center">Estado</th>
                        <th class="titulo-usuarios text-center">Telefono</th>
                        <th class="titulo-usuarios text-center">Direccion</th>
                        <th class="titulo-usuarios text-center">Sexo</th>
                        <th class="titulo-usuarios text-center">Cargo</th>

                        <th class="titulo-usuarios text-center" colspan="3">Acciones</th>
                    </tr>
                </thead>
                <tfoot> 
                    <tr>
                        <th class="titulo-usuarios text-center">#</th>
                        <th class="titulo-usuarios text-center">Nombre</th>
                        <th class="titulo-usuarios text-center">Apellido</th>
                        <th class="titulo-usuarios text-center">Email</th>
                        <th class="titulo-usuarios text-center">Tipo Documento</th>
                        <th class="titulo-usuarios text-center">Numero Documento</th>
                        <th class="titulo-usuarios text-center">Estado</th>
                        <th class="titulo-usuarios text-center">Telefono</th>
                        <th class="titulo-usuarios text-center">Direccion</th>
                        <th class="titulo-usuarios text-center">Sexo</th>
                        <th class="titulo-usuarios text-center">Cargo</th>

                        <th class="titulo-usuarios text-center"  colspan="3">Acciones</th>
                    </tr>
                </tfoot> 
                <%UsuarioDAO usuDAO = new UsuarioDAO();
                    ArrayList<UsuarioVO> listarUsuarios = usuDAO.listar();
                    request.setAttribute("lista", listarUsuarios);
                    String estadou = "";
                %>

                <c:forEach items="${lista}" var="u">
                    <tbody>
                        <tr>
                            <td class="text-center">${u.getIdUsuario()}</td>
                            <td class="text-center">${u.getNombreUsuario()}</td>
                            <td class="text-center">${u.getApellidoUsuario()}</td>
                            <td class="text-center">${u.getEmailUsuario()}</td>
                            <td class="text-center">${u.getTipoDocumento()}</td>
                            <td class="text-center">${u.getNumDocumentoUsuario()}</td>
                            <td class="text-center">
                                <c:if test="${u.isEstadoUsuario() == true}">
                                    <button class="btn btn-primary rounded-pill"><%=estadou = "Activo"%></button>
                                </c:if>
                                <c:if test="${u.isEstadoUsuario() == false}">
                                    <button class="btn btn-danger rounded-pill"><%=estadou = "Inactivo"%></button>
                                </c:if>
                            </td>
                            <td class="text-center">${u.getTelefonoUsuario()}</td>
                            <td class="text-center">${u.getDireccionUsuario()}</td>
                            <td class="text-center">${u.getSexoUsuario()}</td>
                            <td class="text-center">${u.getIdRol()}</td>
                            <td class="text-center">
                                <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                                    <input type="hidden" name="codigo" value="${u.getIdUsuario()}">
                                    <input type="hidden" name="action" value="6">
                                    <button type="submit" class="btn-transparent bg-transparent border-0" data-bs-toggle="modal" data-bs-target="#update"><i class="fas fa-edit text-info"></i></button>
                                </form>
                            </td>
                            <c:if test="${u.isEstadoUsuario() == true}">
                                <td>
                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaInactivar(${u.getIdUsuario()}, true)"><i class="bi bi-person-check-fill fa-x5 text-primary" style="font-size: 25px;"></i></button>
                                </td>
                            </c:if>


                            <c:if test="${u.isEstadoUsuario() == false}">
                                <td>
                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaActivar(${u.getIdUsuario()}, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 25px;"></i></button>
                                </td>
                            </c:if>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->  

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
        <jsp:include page="CrearUsuario.jsp" />
        <jsp:include page="ModificarUsuario.jsp" />
       
    </body>
</html>
