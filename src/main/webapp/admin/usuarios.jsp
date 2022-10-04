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
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/funciones.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>

    </head>
    <body>

        ${userConsultado}
        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->
        <div class="todo">
            <a class="btn btn-primary" href="" data-bs-toggle="modal" data-bs-target="#crear"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
            <table id="example">
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellido</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Tipo Documento</th>
                        <th class="text-center">Numero Documento</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Sexo</th>
                        <th class="text-center">Cargo</th>

                        <th class="text-center" colspan="3">Acciones</th>
                    </tr>
                </thead>
                <tfoot> 
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellido</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Tipo Documento</th>
                        <th class="text-center">Numero Documento</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Sexo</th>
                        <th class="text-center">Cargo</th>

                        <th class="text-center"  colspan="3">Acciones</th>
                    </tr>
                </tfoot> 
                <%UsuarioDAO usuDAO = new UsuarioDAO();
                    ArrayList<UsuarioVO> listarUsuarios = usuDAO.listar();
                    request.setAttribute("lista", listarUsuarios);
                %>

                <c:forEach items="${lista}" var="u">
                    <tbody>
                        <tr>
                            <td class="text-center">${u.getIdUsuario()}</td>
                            <td class="text-center">${u.getNombreUsuario()}</td>
                            <td class="text-center">${u.getApellidoUsuario()}</td>
                            <td class="text-center">${u.getEmailUsuario()}</td>
                            <!-- <td class="text-center">${u.getPassUsuario()}</td> -->
                            <td class="text-center">${u.getTipoDocumento()}</td>
                            <td class="text-center">${u.getNumDocumentoUsuario()}</td>

                            <td class="text-center">
                                <c:if test="${u.isEstadoUsuario() == true}">
                                    <button class="btn btn-primary rounded-pill">${u.isEstadoUsuario()}</button>
                                </c:if>
                                <c:if test="${u.isEstadoUsuario() == false}">
                                    <button class="btn btn-danger rounded-pill">${u.isEstadoUsuario()}</button>
                                </c:if>
                            </td>
                            <td class="text-center">${u.getTelefonoUsuario()}</td>
                            <td class="text-center">${u.getDireccionUsuario()}</td>
                            <td class="text-center">${u.getSexoUsuario()}</td>
                            <td class="text-center">${u.getIdRol()}</td>
                            <td class="text-center">
                                <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                                    <input type="hidden" name="codigo" value="${u.getIdUsuario()}">
                                    <button class="btn-transparent bg-transparent border-0" data-bs-toggle="modal" data-bs-target="#Update" type="submit"><i class="fas fa-edit text-info"></i></button>
                                    <input type="hidden" name="action" value="">
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
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
            <script>
                                        $(document).ready(function () {
                                            $('#example').DataTable();
                                        });
            </script>
        </div>


        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("MensajeErroro") != null) {%>
        ${MensajeErroro}
        <%} else {%>
        ${MensajeExitoo}
        <%}%>


        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>

        <jsp:include page="CrearUsuario.jsp" />
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->  

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />

        <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
    </body>
</html>
