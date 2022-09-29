<%-- 
    Document   : RecuperarContraseña
    Created on : 10/09/2022, 11:08:19 p. m.
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperacion de contraseña</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <h1>Recuperar contraseña</h1>
            <p>Ingrese su direccion de correo electronico y le enviaremos uun codigo de verificacion para que siga los pasos suministrados</p>
            <input type="email" name="email" placeholder="email">
            <button type="submit">Recuperar Contraseña</button>
            <input type="hidden" value="8" name="action">
        </form>

        <%
            if (request.getAttribute("MensajeEnviado") != null) {%>
        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <h1>Codigo deVerificacion</h1>
            <label for="codigo">Escribe el codigo de verificacion</label>
            <input type="number" name="codigoVerificacion" placeholder="Escribe el codigo" id="codigo">
            <button type="submit">Comprobar</button>
            <input type="hidden" value="9" name="action">
        </form>
        <%}
        %>

        <%
            //cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}
        <% } else {%>
        ${mensajeExito}
        <%}%>
    </body>
</html>
