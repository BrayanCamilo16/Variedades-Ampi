<%@include file="../cache.jsp" %>
<%@page import="vo.UsuarioVO"%>
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

        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <input type="hidden" name="codigoId" value="${usuarioVo.idUsuario}">
            <a><button type="submit" class="btn btn-danger">Actualizar Mi Perfil</button></a>
            <input type="hidden" name="action" value="4">
        </form>

        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
    </body>
</html>
