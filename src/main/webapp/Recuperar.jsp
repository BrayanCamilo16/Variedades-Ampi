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
    </body>
</html>
