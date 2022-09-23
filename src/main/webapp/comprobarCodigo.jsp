<%-- 
    Document   : comprobarCodigo
    Created on : 21/09/2022, 7:44:40 p. m.
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Usuario" method="POST">
            <h1>Codigo deVerificacion</h1>
<!--            <label for="pass">Nueva contrase&ntilde;a</label>
            <input type="password" name="pass" placeholder="Nueva contrase&ntilde;a" id="pass">-->
            
            <label for="codigo">Escribe el codigo de verificacion</label>
            <input type="number" name="pass" placeholder="Escribe el codigo" id="codigo">
            
            <button type="submit">Comprobar</button>
        </form>

    </body>
</html>
