<%@page import="java.util.List"%>
<%@page import="vo.PedidoVO"%>
<%@page import="dao.PedidoDAO"%>
<%
    String mensajeBoton = "";
    boolean hayUnPedidoConsultado = false;
    String modalStatic = "";
    if (request.getAttribute("pedido") != null) {
        mensajeBoton = "Actualizar pedido";
        hayUnPedidoConsultado = true;
        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
    } else {
        mensajeBoton = "Registrar pedido";
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <!-- header  -->
        <!-- /header  -->

        <div class="modal fade" <%= modalStatic %> id="registrarPedido">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Registrar pedido</h3>
                                <!--<span>Es f&#225;cil y r&#225;pido.</span>-->
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close" id="closeModal"><i class="fas fa-times"></i></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Pedido" method="POST" enctype="multipart/form-data" name="Pedidos">
                        <div class="modal-body">
                            <div class="form-group mb-2">
                                <label for="nombreCategoria">Fecha Pedido<span class="text-danger">*</span></label>
                                <input type="date" class="form-control mt-1" value="${pedido.fechaPedido}" name="nombreCategoria" id="fechaPedido" required>
                                <%                                    
                                    if (hayUnPedidoConsultado) {
                                %>
                                <input type="hidden" name="opcion" value="3">
                                <%
                                    } else {
                                %>
                                <input type="hidden" name="opcion" value="2">
                                <%
                                    }
                                %>
                            </div>
                            <div class="form-group mb-2">
                                <label for="descripcionCategoria">Descripci&#243;n <span class="text-danger">*</span></label>
                                <input type="date" class="form-control mt-1" onclick="verificar()" value="${pedido.fechaEntrega}" name="fechaEntrega" id="fechaEntrega" required>
                            </div>

                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary btn-lg" onmouseover="verificar()"><%= mensajeBoton%></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->


        <%
            if (hayUnPedidoConsultado) {
        %>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        <script>
            window.$('#registrarCategoria').modal('show');
            $(document).on('click', '#closeModal', function () {
                location.href = "${pageContext.request.contextPath}/admin/categorias.jsp";
            });
        </script>      
        <%
            }
        %>
    </body>
</html>