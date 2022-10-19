<%@page import="vo.UsuarioVO"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", 0);
%>
<%
    //esta parte de codigo es para saber si inicio seion
    HttpSession miSesion = (HttpSession) request.getSession();
    String usuario = "";
    //ahi comprueba que halla iniciado sesion, si es igual a nulo lo redirecciona a que inicie sesion
    if (miSesion.getAttribute("usuarioVo") == null) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    } else {
        UsuarioVO usuVO = (UsuarioVO) miSesion.getAttribute("usuarioVo");
        usuario = usuVO.getEmailUsuario();
    }
%>