<%@page import="vo.ProductoVO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<div class="col-md-12 d-flex word-wrap">
    <%
        ProductoDAO productoDao = new ProductoDAO();
        ProductoVO productoVo = null;
        List<ProductoVO> productos = productoDao.select();

        for (int i = 0; i < productos.size(); i++) {
            productoVo = productos.get(i);
    %>

    <div class="mx-2 p-2 div_categorias">
        <div class="card-body text-center">
            <img src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto() %>" width="100px" alt="alt"/>
            <p>Precio: <span class="fw-bold"><%= productoVo.getPrecioUnitarioProducto() %></span></p>
            <h5 class="card-text fw-bold"><%= productoVo.getNombreProducto() %></h5>
            <p><%= productoVo.getDescripcionProducto() %></p>
            <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="opcion" value="4">
                <input type="hidden" name="idProducto" value="<%= productoVo.getIdProducto() %>">
                <button class="btn btn-primary">Agregar <i class="fas fa-shopping-cart ms-1"></i></button>
            </form>
        </div>
    </div>
    <%
        }
    %>
</div>
