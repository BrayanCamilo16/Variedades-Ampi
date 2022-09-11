<%@include file="../cache.jsp" %>
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
        
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Bienvenido ${usuarioVo.nombreUsuario}</h1>
                        <p><a href="pedidos.jsp">Gestionar pedidos</a></p>
                        <p><a href=""></a></p>
                    </div>
                </div>
            </div>
        </section>

        
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
    </body>
</html>
