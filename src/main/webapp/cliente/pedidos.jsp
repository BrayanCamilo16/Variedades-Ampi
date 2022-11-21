<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.PedidoDAO"%>
<%@include file="../cache.jsp" %>
<%@include file="ValidarRolCliente.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="es_CO" />
<!DOCTYPE html>
<html>
     <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
    </head>
    <body class="position-relavite">

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta.jsp" />
        <div class="container">
            <div class="row">
               <!--<div class="col-md-2"></div>-->
                <div class="col-md-12 my-3">
                    <h1 class="text-center fw-bold my-2">Mis pedidos</h1>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">Producto</th>
                                <th scope="col" class="text-center">Cantidad</th>
                                <th scope="col" class="text-center">Total</th>
                                <th scope="col" class="text-center">Fecha</th>
                                <th scope="col" class="text-center">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                UsuarioVO usuarioVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
                                PedidoDAO pedidoDao = new PedidoDAO();
                                ProductoDAO productoDao = new ProductoDAO();
                                PedidoVO pedidoVo = null;
                                DetallesPedidoVO detallesPedidoVo = null;
                                ProductoVO productoVo = null;
                                UsuarioPedidoVO usuarioPedidoVo = null;
                                List<Object> datosPedidos = null;
                                List<PedidoVO> pedidos = pedidoDao.consultarPedidosCliente(usuarioVo.getIdUsuario());
                                List<ProductoVO> productos = productoDao.consultarProductosDePedidosCliente(usuarioVo.getIdUsuario());

//                                out.print(datos.toString());
                                for (int i = 0; i < pedidos.size(); i++) {
                                    pedidoVo = pedidos.get(i);
                                    productoVo = productos.get(i);

                            %>
                            <tr>
                                <td class="text-center"><%= productoVo.getNombreProducto()%></td>
                                <td class="text-center"><fmt:formatNumber value="<%= productoVo.getCantidad()%>" type="number" /></td>
                                <td class="text-center"><fmt:formatNumber value="<%= productoVo.getPrecioUnitarioProducto() * productoVo.getCantidad()%>" type="currency" /></td>
                                <td class="text-center"><%= pedidoVo.getFechaEntrega()%></td>
                                <td class="text-center"><%= pedidoVo.getEstadoPedido()%></td>
                                <td class="text-center"><a href="facturas.jsp">ver factura</td>
 

                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
            </div>
        </div>
    </body>
</html>
