<%@page import="vo.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>
        <link href="../css/Administrador.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

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
                        <a href="">
                            <span></span>
                            <img src="../img/reporte.png" alt=""/>
                            <h1>Reportes</h1>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("MensajeErroro") != null) {%>
        ${MensajeErroro}
        <%} else {%>
        ${MensajeExitoo}
        <%}%>


        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->  

        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />

        <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
    </body>
</html>
