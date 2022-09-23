<%@page import="java.util.List"%>
<%@page import="vo.CategoriaVO"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Categorias</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <buttom class=" btn btn-secondary text-white p-2 mb-2 my-3 float-end" data-bs-toggle="modal" data-bs-target="#registrarCategoria"><i class="fas fa-plus-circle me-1"></i>Agregar categor&#237;a</buttom>
                    <table class="table table-striped">
                        <thead>
                            <tr class="text-center">
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripci&#243;n</th>
                                <th scope="col">Imagen</th>
                                <th scope="col">Editar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                CategoriaDAO categoriaDao = new CategoriaDAO();
                                CategoriaVO categoriaVo = null;
                                List<CategoriaVO> categorias = categoriaDao.select();
                                int contador = 0;

                                for (int i = 0; i < categorias.size(); i++) {
                                    categoriaVo = categorias.get(i);
                                    contador++;
                            %>
                            <tr class="">
                                <td class="text-center align-middle"><%= contador%></td>
                                <td class="align-middle"><%= categoriaVo.getNombreCategoria()%></td>
                                <td class="align-middle"><%= categoriaVo.getDescripcionCategoria()%></td>
                                <td class="text-center align-middle"><img src="${pageContext.request.contextPath}/files/categoria/<%= categoriaVo.getRutaImgCategoria()%>" alt="<%= categoriaVo.getNombreCategoria()%>" loading="lazy" width="50px"/></td>
                        <form action="${pageContext.request.contextPath}/Categoria" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="idCategoria" value="<%= categoriaVo.getIdCategoria()%>">
                            <input type="hidden" name="opcion" value="1">
                            <td class="text-center align-middle"><button type="submit" class="border-0 bg-transparent text-primary"><i class="fas fa-edit"></i></button></td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <h5 class="my-3">Agregar registro por archivo Excel (csv)</h5>
                    <form action="${pageContext.request.contextPath}/Archivos" id="form" method="POST"
                          enctype="multipart/form-data">
                        <input type="file" class="form-control" accept=".csv" id="excel" name="excel">
                        <button type="submit" class="btn btn-secondary mt-3 mb-1">Registrar catagorias</button>
                    </form>
                    <a href="${pageContext.request.contextPath}/categorias.csv" download="categorias.csv">Descargar formato</a>
                    <div id="msg">
                    </div>
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
<jsp:include page="../WEB-INF/paginas/registrarCategoria.jsp" />
<!-- /registrar categoria  -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
    $('#form').on('submit', (e) => {
        e.preventDefault();
        let data = new FormData();
        data.append("option", 1);
        data.append("excel", ($("#excel"))[0].files[0]);
        $.ajax({
            data: data,
            url: '${pageContext.request.contextPath}/Files',
            type: 'POST',
            contentType: false,
            processData: false,
            success: function (mensaje) {
                $('#msg').html(mensaje);
                setTimeout(() => {
                    $('#msg').html("");
                }, 5000);
            }
        });
    })
</script>