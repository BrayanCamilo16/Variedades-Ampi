<%@include file="../cache.jsp" %>
<<<<<<< HEAD
=======
<%@page import="vo.UsuarioVO"%>
>>>>>>> 9d96cc808d69cc2d249eefd8318f3b8d9e20d181
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <!-- header  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /header  -->
        
        <h1>Bienvenido ${usuarioVo.nombreUsuario}</h1>
<<<<<<< HEAD
        
=======

        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <input type="hidden" name="codigoId" value="${usuarioVo.idUsuario}">
            <a><button type="submit" class="btn btn-danger">Actualizar Mi Perfil</button></a>
            <input type="hidden" name="action" value="4">
        </form>


>>>>>>> 9d96cc808d69cc2d249eefd8318f3b8d9e20d181
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
    </body>
</html>
