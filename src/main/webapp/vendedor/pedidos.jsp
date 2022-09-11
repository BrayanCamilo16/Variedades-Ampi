<%@page import="vo.PedidoVO"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pedidos</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="..//WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <buttom class=" btn btn-secondary text-white p-2 mb-2 my-3 float-end" data-bs-toggle="modal" data-bs-target="#registrarPedido"><i class="fas fa-plus-circle me-1"></i>Agregar pedido</buttom>
                    <table id="grid" class="table table-striped table-bordered dt-responsive nowrap">
                        <thead>
                            <tr class="text-center">
                                <th scope="col">Id</th>
                                <th scope="col">Fecha Pedido</th>
                                <th scope="col">Fecha Entrega</th>
                                <th scope="col">Destino</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Vendedor</th>
                                <th scope="col">Detalles</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PedidoDAO pedidoDao = new PedidoDAO();
                                PedidoVO pedidoVo = null;
                                List<PedidoVO> pedidos = pedidoDao.select();

                                for (int i = 0; i < pedidos.size(); i++) {
                                    pedidoVo = pedidos.get(i);
                            %>
                            <tr class="">
                                <td class="text-center align-middle"><%= pedidoVo.getIdPedido()%></td>
                                <td class="text-center align-middle"><%= pedidoVo.getFechaPedido()%></td>
                                <td class="text-center align-middle"><%= pedidoVo.getFechaEntrega()%></td>
                                <td class="text-center align-middle">$ <%= pedidoVo.getDestinoPedido()%></td>
                                <td class="text-center align-middle"><%= pedidoVo.getEstadoPedido()%></td>
                                <td class="text-center align-middle"><%= pedidoVo.getNombreCliente()%></td>
                                <td class="text-center align-middle"><%= pedidoVo.getNombreVendedor()%></td>
                                <form action="${pageContext.request.contextPath}/Pedido" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="idPedido" value="<%= pedidoVo.getIdPedido()%>">
                                    <input type="hidden" name="opcion" value="2">
                                    <td class="text-center align-middle"><button type="submit" class="border-0 bg-transparent text-primary"><i class="fas fa-bars"></i></button></td>
                                </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#grid').DataTable();
            });
        </script>
        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/detallesPedido.jsp" />
    </body>
</html>

<!-- registrar pedido  -->
<jsp:include page="../WEB-INF/paginas/comunes/registrarPedido.jsp" />
<!-- /registrar pedido  -->