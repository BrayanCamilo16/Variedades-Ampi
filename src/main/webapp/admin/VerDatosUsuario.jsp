<%-- 
    Document   : VerDatosUsuario
    Created on : 15/08/2022, 10:52:32 a. m.
    Author     : pc
--%>

<%@page import="vo.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%        if (request.getAttribute("consultado") != null) {
            UsuarioVO usuarioVo = (UsuarioVO) request.getAttribute("consultado");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¡<%=usuarioVo.getNombreUsuario()%>!</title>
    </head>
    <body>
        <%
            //if (request.getAttribute("FuncionEmail") != null && request.getAttribute("FuncionPassword") != null && request.getAttribute("FuncionNombre") != null && request.getAttribute("FuncionApellido") != null && request.getAttribute("FuncionDocumento") != null && request.getAttribute("FuncionTelefono") != null && request.getAttribute("FuncionDireccion") != null && request.getAttribute("FuncionSexo") != null && request.getAttribute("FuncionEstado") != null && request.getAttribute("FuncionRol") != null && request.getAttribute("FuncionTipoDocu") != null) {
        %>
        <h2> El nombre es:</h2> <h3>${FuncionNombre}</h3>
        <h2> El apellido es:</h2> <h3>${FuncionApellido}</h3>
        <h2> El email es:</h2> <h3>${FuncionEmail}</h3>
        <h2> El password es:</h2> <h3>${FuncionPassword}</h3>
        <h2> El Tipo Documento es:</h2> <h3>${tipodocu}</h3>
        <h2> El Numero Documento es: </h2> <h3>${FuncionDocumento}</h3>
        <h2> El Telefono es:</h2> <h3>${FuncionTelefono}</h3>
        <h2> El Direccion es:</h2> <h3>${FuncionDireccion}</h3>
        <h2> El Sexo es:</h2> <h3>${FuncionSexo}</h3>
        <h2> El Estado es:</h2> <h3>${FuncionEstado}</h3>
        <h2> El Rol es:</h2> <h3>${roll}</h3>
        <%}%>
        

    </body>
</html>
