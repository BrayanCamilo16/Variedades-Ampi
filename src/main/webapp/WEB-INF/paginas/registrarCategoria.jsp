<%
    String mensajeBoton = "";
    boolean hayUnaCategoriaConsultada = false;
    String modalStatic = "";
    if (request.getAttribute("categoria") != null) {
        mensajeBoton = "Actualizar categor&#237;a";
        hayUnaCategoriaConsultada = true;
        modalStatic = "data-backdrop=\"static\" data-keyboard=\"false\" tabindex=\"-1\"";
    } else {
        mensajeBoton = "Registrar categor&#237;a";
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head-bootstrap.jsp" />
    </head>
    <body>
        <!-- header  -->
        <!-- /header  -->

        <div class="modal fade" <%= modalStatic %> id="registrarCategoria">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Registrar categoria</h5>
                                <!--<span>Es f&#225;cil y r&#225;pido.</span>-->
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close" id="closeModal"><i class="fas fa-times"></i></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Categoria" method="POST" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group mb-2">
                                <label for="nombreCategoria">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" value="${categoria.nombreCategoria}" name="nombreCategoria" id="nombreCategoria" required>
                                <%                                    
                                    if (hayUnaCategoriaConsultada) {
                                %>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="idCategoria" value="${categoria.idCategoria}">
                                <input type="hidden" name="nombreImg" value="${categoria.rutaImgCategoria}">
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
                                <input type="text" class="form-control mt-1" value="${categoria.descripcionCategoria}" name="descripcionCategoria" id="descripcionCategoria" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="imgCategoria">Imagen <span class="text-danger">*</span></label>
                                <input type="file" class="form-control mt-1" name="imgCategoria" value="${categoria.rutaImgCategoria}" id="imgCategoria" accept="image/ico,image/jpeg,image/jpg,image/png" required>
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
            if (hayUnaCategoriaConsultada) {
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