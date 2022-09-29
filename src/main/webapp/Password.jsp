<%-- 
    Document   : Password
    Created on : 21/09/2022, 8:00:23 p. m.
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <h1>Recuperar Contraseña</h1>
            <label for="pass">Nueva contrase&ntilde;a</label>
            <input type="password" name="pass" placeholder="Nueva contrase&ntilde;a" id="pass">

            <label for="pass">Repetir contrase&ntilde;a</label>
            <input type="password" name="pass2" placeholder="Repetir contrase&ntilde;a" id="pass">

            <button type="submit">Validar</button>
            <input type="hidden" value="10" name="action">
            
            <%
            //cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}
        <% } else {%>
        ${mensajeExito}
        <%}%>

        </form>
    </body>
</html>
