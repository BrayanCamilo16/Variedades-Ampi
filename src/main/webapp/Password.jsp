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
        <form action="${pageContext.request.contextPath}/Recuperacion" method="POST">
        <h1>Recuperar contraseña</h1>
        <p>Ingrese su direccion de correo electronico y le enviaremos una contraseña nueva para que pueda iniciar sesion</p>
        <input type="email" name="email" placeholder="email">
        <button>Recuperar Contraseña</button>
        </form>
    </body>
</html>
