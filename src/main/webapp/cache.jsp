<%@page import="vo.UsuarioVO"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <%
            //esta parte de codigo es para saber si inicio seion
        HttpSession miSesion = (HttpSession) request.getSession();
        String usuario = "";
        //ahi comprueba que halla iniciado sesion, si es igual a nulo lo redirecciona a que inicie sesion
        if (miSesion.getAttribute("usuarioVo") == null) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else {
            UsuarioVO usuVO = (UsuarioVO) miSesion.getAttribute("usuarioVo");
            usuario = usuVO.getEmailUsuario();
        }
    %>
    </body>
</html>
