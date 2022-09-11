<%@page import="java.util.List"%>
<%@page import="vo.CategoriaVO"%>
<%@page import="dao.CategoriaDAO"%>

<div class="col-md-12 d-flex word-wrap">
    <%
        HttpSession sesion = request.getSession();
        CategoriaDAO categoriaDao = new CategoriaDAO();
        CategoriaVO categoriaVo = null;
        List<CategoriaVO> categorias = categoriaDao.select();

        for (int i = 0; i < categorias.size(); i++) {
            categoriaVo = categorias.get(i);
    %>

    <div class="m-2 p-2 div_categorias">
        <img src="${pageContext.request.contextPath}/files/categoria/<%= categoriaVo.getRutaImgCategoria()%>" class="card-img-top" alt="<%= categoriaVo.getDescripcionCategoria()%>" title="<%= categoriaVo.getDescripcionCategoria()%>" width="6.25rem">
        <div class="card-body text-center">
            <h5 class="card-text fw-bold"><%= categoriaVo.getNombreCategoria()%></h5>
        </div>
    </div>
    <%
        }
    %>
</div>