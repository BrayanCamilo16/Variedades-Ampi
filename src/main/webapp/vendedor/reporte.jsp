<%-- 
    Document   : reporte
    Created on : 22/08/2022, 7:32:32 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reportes</title>
         <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <!-- header  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /header  -->
        
        <h1>Bienvenido ${usuarioVo.nombreUsuario}</h1>
        <a href="vistas.jsp">generar reporte general</a><br><br>
        <form>
            <input type="text" name="parametro">
            <<button><a href="vista2.jsp">reporte por fecha</a></button>
        </form>
          
          
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

</html>
