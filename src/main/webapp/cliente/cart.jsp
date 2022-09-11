<%@page import="java.util.List"%>
<%@page import="vo.ProductoVO"%>
<%@page import="dao.ProductoDAO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="es_CO" />
<%@include file="../cache.jsp" %>
<%    Double precioTotal = 0.0;

    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("productoCarrito") != null) {
        ProductoDAO productoDao = new ProductoDAO();
        ProductoVO productoVo = null;
        List<ProductoVO> productos = (List<ProductoVO>) sesion.getAttribute("productoCarrito");

        for (int i = 0; i < productos.size(); i++) {
            productoVo = productos.get(i);

            precioTotal += productoVo.getPrecioUnitarioProducto();
        }

    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
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
                                <c:forEach var="producto" items="${productoCarrito}" varStatus="status">
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/files/producto/${producto.nombreImgProducto}" width="100px" alt="alt"/ class="me-2"> ${producto.nombreProducto}</th>
                                        <td class="text-center align-middle fw-bold"><fmt:formatNumber value="${producto.precioUnitarioProducto}" type="currency" /></td>
                                        <td class="text-center align-middle"><i class="fas fa-minus-circle me-2 text-danger"></i>1<i class="fas fa-plus-circle ms-2 text-success"></i></td>
                                        <td class="text-center align-middle fw-bold"><fmt:formatNumber value="${producto.precioUnitarioProducto}" type="currency" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <div class="">
                            <h1 class="float-start">Total</h1>
                            <h2 class="float-end"><fmt:formatNumber value="<%= precioTotal%>" type="currency" /></h2>
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

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />

    </body>
</html>
