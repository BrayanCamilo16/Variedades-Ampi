<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/RecuperacionPassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Usuario" method="POST" id="addformulario" >
            <h1>Recuperar Contraseña</h1>
            <div id="alerta"></div>
            <label for="pass">Nueva contrase&ntilde;a</label>
            <input type="password" name="pass" placeholder="Nueva contrase&ntilde;a" id="pass" class="passw">
            <label for="pass2">Confirmar contrase&ntilde;a</label>
            <input type="password" name="pass2" placeholder="Confirmar contrase&ntilde;a" id="pass2">
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
    <script>
        const formulario = document.getElementById("addformulario");
        const password1 = document.getElementById("pass");
        const password2 = document.getElementById("pass2");

        formulario.addEventListener('submit', (e) => {
            if (password1.value !== password2.value) {
                e.preventDefault();
                document.getElementById("alerta").innerHTML = "Las contraseñas no coinciden, asegurese de suministrarlas correctamente";
            }
        });
    </script>
</html>
