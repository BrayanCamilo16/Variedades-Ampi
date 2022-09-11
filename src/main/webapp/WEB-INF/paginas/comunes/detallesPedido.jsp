<%@page import="java.util.List"%>
<%@page import="vo.DetallespedidoVO"%>
<%@page import="dao.DetallespedidoDAO"%>
<%
    String mensajeBoton = "";
    String modalStatic = "";
    String entrada = String.valueOf(request.getAttribute("id_Pedido"));
    int idPedido = Integer.parseInt(entrada);
    boolean hayPedidoConsultado = false;
    if (request.getParameter("idPedido") != null) {
        hayPedidoConsultado = true;
    } else {
    }

%>
<html>
    <head>
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <!-- header  -->
        <!-- /header  -->
<!--        <div class="modal fade" <%= modalStatic%> id="consultarDetalles">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Registrar categoria</h5>
                                <span>Es f&#225;cil y r&#225;pido.</span>
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close" id="closeModal"><i class="fas fa-times"></i></button>
                    </div>-->
                    <%
                        if (hayPedidoConsultado) {
                    %>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <table id="grid" class="table table-striped table-bordered dt-responsive nowrap">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">Producto</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Categoria</th>
                                            <th scope="col">Marca</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DetallespedidoDAO detallesDao = new DetallespedidoDAO();
                                            DetallespedidoVO detallesVo = null;
                                            List<DetallespedidoVO> detalles = detallesDao.select(idPedido);

                                            for (int i = 0; i < detalles.size(); i++) {
                                                detallesVo = detalles.get(i);
                                        %>
                                        <tr class="">
                                            <td class="text-center align-middle"><%= detallesVo.getNombreProducto()%></td>
                                            <td class="text-center align-middle"><%= detallesVo.getCantidadProducto()%></td>
                                            <td class="text-center align-middle">$ <%= detallesVo.getPrecioUnitarioProducto()%></td>
                                            <td class="text-center align-middle"><%= detallesVo.getCategoriaProducto()%></td>
                                            <td class="text-center align-middle"><%= detallesVo.getMarcaProducto()%></td>
                                    </tr>
                                    <%
                                        }
                                    }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
<!--                </div>
            </div>
        </div>-->