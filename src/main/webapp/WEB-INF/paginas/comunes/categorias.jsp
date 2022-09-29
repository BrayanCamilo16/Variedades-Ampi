<%@page import="vo.CategoriaVO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<!--<i class="boton boton-left fas fa-chevron-circle-left" id="btn-left"></i>
<i class="boton boton-right fas fa-chevron-circle-right" id="btn-right"></i>-->


<div class="col-md-12 d-flex word-wrap categorias">
    <%
        HttpSession sesion = request.getSession();
        CategoriaDAO categoriaDao = new CategoriaDAO();
        CategoriaVO categoriaVo = null;
        List<CategoriaVO> categorias = categoriaDao.select();

        for (int i = 0; i < categorias.size(); i++) {
            categoriaVo = categorias.get(i);
    %>

    <div class="categoria">
        <div class="" id="">
            <img src="${pageContext.request.contextPath}/files/categoria/<%= categoriaVo.getRutaImgCategoria()%>" class="card-img-top mb-2" alt="<%= categoriaVo.getDescripcionCategoria()%>" title="<%= categoriaVo.getDescripcionCategoria()%>" width="6.25rem">
            <div class="mt-2 text-center d-flex justify-content-center">
                <h5 class="card-text fw-bold"><%= categoriaVo.getNombreCategoria()%></h5>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>