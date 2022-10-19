<%@page import="java.util.List"%>
<%@page import="vo.*"%>
<%@page import="dao.ProductoDAO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="es_CO" />
<%@include file="../cache.jsp" %>
<%@include file="ValidarRolCliente.jsp" %>
<%    Double precioTotal = 0.0;
    HttpSession sesionn = request.getSession();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />

    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta.jsp" />

        <section>
            <div class="container">
                <div class="row">
                    <h4 class="text-center fw-bold my-4">Carrito de compras</h4>
                    <div class="col-md-8">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Producto</th>
                                    <th scope="col" class="text-center">Precio</th>
                                    <th scope="col" class="text-center">Cantidad</th>
                                    <th scope="col" class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (sesionn.getAttribute("productoCarrito") != null) {
                                        ProductoVO productoVo = new ProductoVO();
                                        List<ProductoVO> productos = (List<ProductoVO>) sesionn.getAttribute("productoCarrito");
                                        for (int i = 0; i < productos.size(); i++) {
                                            productoVo = productos.get(i);
                                            precioTotal += productoVo.getPrecioUnitarioProducto() * productoVo.getCantidad();
                                %>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto()%>" width="100px" alt="alt" class="me-2"> <%= productoVo.getNombreProducto()%></th>
                                    <td class="text-center align-middle fw-bold"><fmt:formatNumber value="<%= productoVo.getPrecioUnitarioProducto()%>" type="currency" /></td>
                                    <td class="text-center align-middle"><i class="fas fa-minus-circle me-2 text-danger"></i><%= productoVo.getCantidad()%><i class="fas fa-plus-circle ms-2 text-success"></i></td>
                                    <td class="text-center align-middle fw-bold"><fmt:formatNumber value="<%= productoVo.getPrecioUnitarioProducto() * productoVo.getCantidad()%>" type="currency" /></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <div class="d-flex justify-content-between">
                            <h1 class="">Total</h1>
                            <h2 class=""><fmt:formatNumber value="<%= precioTotal%>" type="currency" /></h2>
                        </div>
                        <div class="mt-3">
                            <button type="button" class="btn w-100 btn-lg btn-primary float-start" data-bs-toggle="modal" data-bs-target="#generarPedido">Generar pedido</button>
                            <a href="factura.jsp"><button type="butoon" class="btn w-100 btn-lg btn-primary float-start" data-bs-toggle="modal">generar factura</button></a>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <jsp:include page="../WEB-INF/paginas/login.jsp" />
        <jsp:include page="../WEB-INF/paginas/signup.jsp" />
        <jsp:include page="../WEB-INF/paginas/generarPedido.jsp" />

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />

    </body>
</html>
