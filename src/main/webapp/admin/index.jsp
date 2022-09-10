<%@include file="../cache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        
        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Bienvenido ${usuarioVo.nombreUsuario}</h1>
                        <p><a href="categorias.jsp">Gestionar categor&#237;as</a></p>
                        <p><a href="productos.jsp">Gestionar productos</a></p>
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
        
        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
    </body>
</html>
