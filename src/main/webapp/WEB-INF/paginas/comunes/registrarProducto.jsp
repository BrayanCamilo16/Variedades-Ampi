<%@page import="vo.*"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%
    String mensajeBoton = "Registrar producto";
    boolean hayUnProductoConsultado = false;
    String modalStatic = "";
    if (request.getAttribute("producto") != null) {
        mensajeBoton = "Actualizar producto";
        hayUnProductoConsultado = true;
        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
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

        <div class="modal fade" <%= modalStatic%>  id="registrarProducto">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Registrar producto</h5>
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close" id="closeModal"><i class="fas fa-times"></i></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data" style="overflow-y: auto; display: block;">
                        <div class="modal-body">
                            <div class="form-group mb-2">
                                <label for="nombreCategoria">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" value="${producto.nombreProducto}" name="nombreProducto" id="nombreProducto" required>
                                <%
                                    if (hayUnProductoConsultado) {
                                %>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="idProducto" value="${producto.idProducto}">
                                <input type="hidden" name="nombreImg" value="${producto.nombreImgProducto}">
                                <%
                                } else {
                                %>
                                <input type="hidden" name="opcion" value="2">
                                <%
                                    }
                                %>
                            </div>
                            <div class="form-group mb-2">
                                <label for="descripcionProducto">Descripci&#243;n <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" value="${producto.descripcionProducto}" name="descripcionProducto" id="descripcionProducto" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="precioProducto">Precio <span class="text-danger">*</span></label>
                                <input type="number" step="any" class="form-control mt-1" value="${producto.precioUnitarioProducto}" name="precioProducto" id="precioProducto" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="stockProducto">Stock <span class="text-danger">*</span></label>
                                <input type="number" step="any" class="form-control mt-1" value="${producto.stockProducto}" name="stockProducto" id="stockProducto" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="unidadMinimaProducto">Unidad minima <span class="text-danger">*</span></label>
                                <input type="number" step="any" class="form-control mt-1" value="${producto.unidadMinimaProducto}" name="unidadMinimaProducto" id="unidadMinimaProducto" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="estadoProducto">Estado <span class="text-danger">*</span></label>
                                <input type="text" step="any" class="form-control mt-1" value="${producto.estadoProducto}" name="estadoProducto" id="estadoProducto" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="imgProducto">Imagen <span class="text-danger">*</span></label>
                                <input type="file" class="form-control mt-1" name="imgProducto" id="imgProducto" accept="image/ico,image/jpeg,image/jpg,image/png" required>
                            </div>

                            <div class="form-group mb-2">
                                <label for="imgCategoria">Categoria <span class="text-danger">*</span></label>
                                <select name="idCategoria" class="form-select" required>
                                    <%
                                        CategoriaDAO categoriaDao = new CategoriaDAO();
                                        CategoriaVO categoriaVo = null;
                                        List<CategoriaVO> categorias = categoriaDao.select();

                                        int idCategoria = 0;
                                        if (request.getAttribute("producto") != null) {
                                            ProductoVO productoVo = (ProductoVO) request.getAttribute("producto");
                                            idCategoria = productoVo.getIdCategoria();
                                        }
                                        String isSelected = "";
                                        int contador = 0;

                                        for (int i = 0; i < categorias.size(); i++) {
                                            categoriaVo = categorias.get(i);
                                            if (idCategoria == categoriaVo.getIdCategoria() && contador == 0) {
                                                isSelected = "selected";
                                                contador++;
                                            }
                                    %>
                                    <option <%= isSelected%> <%= isSelected = ""%> value="<%= categoriaVo.getIdCategoria()%>"><%= categoriaVo.getNombreCategoria()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary btn-lg"><%= mensajeBoton%></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <%
            if (hayUnProductoConsultado) {
        %>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->
        <script>
            window.$('#registrarProducto').modal('show');
            $(document).on('click', '#closeModal', function () {
                location.href = "${pageContext.request.contextPath}/admin/productos.jsp";
            });
        </script>      
        <%
            }
        %>
    </body>
</html>