<%@page import="vo.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>

        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/funciones.js" type="text/javascript"></script>
    </head>
    <body>

        ${userConsultado}
        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

        <!-- <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p><a href="categorias.jsp">Gestionar categor&#237;as</a></p>
                        <p><a href="productos.jsp">Gestionar productos</a></p>
                    </div>
                </div>
            </div>
        </section> -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a class="btn btn-success my-3" data-bs-toggle="modal" data-bs-target="#Create"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>
                    <div class="outer-wrapper">
                        <div class="table-wrapper">
                            <table id="example" class="tala">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Apellido</th>
                                        <th class="text-center">Email</th>
                                        <!-- <th class="text-center">Contrase&#241;a</th> -->
                                        <th class="text-center">Tipo Documento</th>
                                        <th class="text-center">Numero Documento</th>
                                        <th class="text-center">Estado</th>
                                        <th class="text-center">Telefono</th>
                                        <th class="text-center">Direccion</th>
                                        <th class="text-center">Sexo</th>
                                        <th class="text-center">Rol/Cargo</th>

                                        <th class="text-center" colspan="3">Acciones</th>
                                    </tr>
                                </thead>

                                <!-- <tfoot> 
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Email</th>
                                        <th>Contrase�a</th>
                                        <th>Tipo Documento</th>
                                        <th>Numero Documento</th>
                                        <th>Estado</th>
                                        <th>Telefono</th>
                                        <th>Direccion</th>
                                        <th>Sexo</th>
                                        <th>Rol/Cargo</th>
            
                                        <th colspan="3">Acciones</th>
                                    </tr>
                                </tfoot> -->
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
                                                    <button class="btn btn-success rounded-pill">${u.isEstadoUsuario()}</button>
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
                                                    <input type="hidden" name="action" value="8">
                                                </form>
                                            </td>
                                            <c:if test="${u.isEstadoUsuario() == true}">
                                                <td>
                                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaInactivar(${u.getIdUsuario()}, true)"><i class="bi bi-person-check-fill fa-x5 text-success" style="font-size: 50px;"></i></button>
                                                </td>
                                            </c:if>


                                            <c:if test="${u.isEstadoUsuario() == false}">
                                                <td>
                                                    <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                                    <button class="btn-transparent border-0 bg-transparent" onclick="alertaActivar(${u.getIdUsuario()}, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 50px;"></i></button>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="CreateUser.jsp" />
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->  

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
                                                        $('#example').DataTable({});
        </script>
        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>
        <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
    </body>
</html>
