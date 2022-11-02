<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperacion de contraseña</title>
        <jsp:include page="WEB-INF/paginas/comunes/head-css.jsp" />
    </head>
    <body class="fondoR">
        <div id="containerR" class="filter">
            <div class="todoR">
                <div class="varie">
                    <img src="img/problem.png" class="pngg"/>
                    <p><b>Nota:</b><br>
                        Tenga en cuenta que para restablecer su contraseña debe suministrar el correo con el que se registro.
                    </p>
                    <img src="img/variedades-ampi.png" class="png"/>
                </div>
                <div class="recuperarC">
                    <h1>Recuperar Contraseña</h1>
                    <img src="img/lock.png" class="pnggg"/>
                    <p>Ingrese su dirección de correo electrónico y le enviaremos un codigo de verificación para que siga los pasos suministrados.</p>
                    <form action="${pageContext.request.contextPath}/Usuario" method="POST" class="formi">
                        <div class="grupo-inputy">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" name="email" placeholder="Correo Electrónico" id="email">
                        </div>
                        <button type="submit" class="ok">Enviar</button>
                        <input type="hidden" value="8" name="action">
                    </form>
                    <%
                        if (request.getAttribute("MensajeEnviado") != null) {%>
                    <form action="${pageContext.request.contextPath}/Usuario" method="POST" class="formm">
                        <h1>Código de Verificación</h1>
                        <label for="codigo">Escribe el código de verificación:</label><br><br>
                        <div class="grupo-inputy">
                            <i class="fa-solid fa-code-compare"></i>
                            <input type="number" name="codigoVerificacion" placeholder="Escribe el codigo" id="codigo">
                        </div>
                        <button type="submit" class="ok">Comprobar</button>
                        <input type="hidden" value="9" name="action">
                    </form>
                    <%}
                    %>

                    <%
                        //cuando es diferente a nulo es que si hubo un error
                        if (request.getAttribute("mensajeError") != null) {%>
                    <script>
                        alert("${mensajeError}");
                    </script>
                    <% } else if (request.getAttribute("mensajeExito") != null) {%>
                    <script>
                        alert("${mensajeExito}");
                        <%}%>
                    </script>
                </div>
                <div class="Osvg">
                    <img src="img/ondasR.svg" class="Isvg">
                </div>
            </div>
        </div>
    </body>
</html>
