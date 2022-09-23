<%@page import="vo.CategoriaVO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/categorias.css" rel="stylesheet" type="text/css"/>
    </head>
    <%
        HttpSession sesion = request.getSession();
        CategoriaDAO categoriaDao = new CategoriaDAO();
        CategoriaVO categoriaVo = null;
        List<CategoriaVO> categorias = categoriaDao.select();

        for (int i = 0; i < categorias.size(); i++) {
            categoriaVo = categorias.get(i);
    %>
    <body>
        <div class="todo-contenido">
            <div class="carrusel">
                <figure>
                    <img src="${pageContext.request.contextPath}/files/categoria/<%= categoriaVo.getRutaImgCategoria()%>" alt="<%= categoriaVo.getDescripcionCategoria()%>">
                    <div class="capa">
                        <h2><%= categoriaVo.getNombreCategoria()%></h2>
                        <h5><%= categoriaVo.getDescripcionCategoria()%></h5>                
                    </div>
                </figure>
            </div>
        </div>
    </body>
    <%
        }
    %>
</html>