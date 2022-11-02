<%@include file="../cache.jsp" %>
<%@include file="ValidarRolAdmin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reportes</title>
         <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
    </head>
    <body>
        <!-- header  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /header  -->
        
         <buttom class=" btn btn-primary text-white p100 mb100 my100 " data-bs-toggle="modal" data-bs-target="#registrarProducto"><i class="fas fa-plus-circle me-1"></i>
             
             <a style="color:white; text-decoration: none" href="vistas.jsp">Generar reporte general</a></buttom>
         <buttom class=" btn btn-primary text-white p100 mb100 my100 " data-bs-toggle="modal" data-bs-target="#registrarProducto"><i class="fas fa-plus-circle me-1"></i> 
             <a style="color:white; text-decoration: none" href="vista2.jsp">Reporte por fecha</a></buttom>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

</html>
