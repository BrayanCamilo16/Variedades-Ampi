<%@include file="../cache.jsp" %>
<%@include file="ValidarRolAdmin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>
        <jsp:include page="../WEB-INF/paginas/comunes/head-css.jsp" />
    </head>
    <body>
        <jsp:include page="../WEB-INF/paginas/comunes/navbar-roles.jsp" />
        <div class="todoContenido">
            <div id="medioContenido" class="medioContenido">
                <div class="cajas">

                    <div class="caja">
                        <a href="usuarios.jsp">
                            <span></span>
                            <img src="../img/usuarios.png" alt=""/>
                            <h1>Gestion de Usuarios</h1>
                        </a>
                    </div>

                    <div class="caja">
                        <a href="productos.jsp">
                            <span></span>
                            <img src="../img/productos.png" alt=""/>
                            <h1>Gestion de Productos</h1>
                        </a>
                    </div>

                    <div class="caja">
                        <a href="categorias.jsp">
                            <span></span>
                            <img src="../img/categorias.png" alt=""/>
                            <h1>Gestion de Categorias</h1>
                        </a>
                    </div>

                    <div class="caja">
                        <a href="reporte.jsp">
                            <span></span>
                            <img src="../img/reporte.png" alt=""/>
                            <h1>Reportes</h1>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../WEB-INF/paginas/comunes/footer.jsp" />
    </body>
</html>
