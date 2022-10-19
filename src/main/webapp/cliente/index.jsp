<%@include file="../cache.jsp" %>
<%@include file="ValidarRolCliente.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
        <jsp:include page="../WEB-INF/paginas/comunes/head-bootstrap.jsp" />
    </head>
    <body class="position-relavite">

        <!-- Navbar  -->
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-enlaces.jsp" />
        <!-- /Navbar  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta.jsp" />

        <section>
            <a href="cart.jsp"><div class="div_icono"><i class="fas fa-shopping-cart icono"></i></div></a>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center fw-bold my-4">Compra por categor&#237;as</h4>
                        <!-- categorias  -->
                        <jsp:include page="../WEB-INF/paginas/comunes/categorias.jsp" />
                        <!-- /categorias  -->
                        <h4 class="text-center fw-bold my-4">Productos</h4>
                        <!-- Productos  -->
                        <jsp:include page="../WEB-INF/paginas/comunes/productos.jsp" />
                        <!-- /Productos  -->
                    </div>
                </div>
            </div>
        </section>

        <!-- footer  -->
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <jsp:include page="../WEB-INF/paginas/login.jsp" />
        <jsp:include page="../WEB-INF/paginas/signup.jsp" />

        <!-- File js  -->
        <jsp:include page="../WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->

        <jsp:include page="../WEB-INF/paginas/comunes/alerta-modal.jsp" />

    </body>
</html>
