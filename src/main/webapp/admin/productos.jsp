<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ProductoVO"%>
<%@include file="../cache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Categorias</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="..//WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <buttom class=" btn btn-secondary text-white p-2 mb-2 my-3 float-end" data-bs-toggle="modal" data-bs-target="#registrarProducto"><i class="fas fa-plus-circle me-1"></i>Agregar producto</buttom>
                    <table class="table table-striped">
                        <thead>
                            <tr class="text-center">
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripci&#243;n</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Imagen</th>
                                <th scope="col">Editar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                ProductoDAO productoDao = new ProductoDAO();
                                ProductoVO productoVo = null;
                                List<ProductoVO> categorias = productoDao.select();
                                DecimalFormat f = new DecimalFormat("##.00");
                                int contadorProductos = 0;

                                for (int i = 0; i < categorias.size(); i++) {
                                    productoVo = categorias.get(i);
                                    contadorProductos++;
                            %>
                            <tr class="">
                                <td class="text-center align-middle"><%= contadorProductos%></td>
                                <td class="align-middle"><%= productoVo.getNombreProducto()%></td>
                                <td class="align-middle"><%= productoVo.getDescripcionProducto()%></td>
                                <td class="text-center align-middle">$ <%= f.format(productoVo.getPrecioUnitarioProducto())%></td>
                                <td class="text-center align-middle"><%= f.format(productoVo.getStockProducto())%></td>
                                <td class="text-center align-middle"><%= productoVo.getEstadoProducto()%></td>
                                <td class="text-center align-middle"><img src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto()%>" alt="<%= productoVo.getNombreProducto()%>" width="50px"/></td>
                        <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="idProducto" value="<%= productoVo.getIdProducto()%>">
                            <input type="hidden" name="opcion" value="1">
                            <td class="text-center align-middle"><button type="submit" class="border-0 bg-transparent text-primary"><i class="fas fa-edit"></i></button></td>
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

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />

    </body>
</html>

<!-- registrar categoria  -->
<jsp:include page="../WEB-INF/paginas/comunes/registrarProducto.jsp" />
<!-- /registrar categoria  -->