<%@page import="vo.UsuarioVO"%>
<%    HttpSession sesion = request.getSession();

    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    
    if (idRol.equals("1")) {
        response.sendRedirect("/variedades-ampi/admin/index.jsp");
    } else if (idRol.equals("2")) {
        response.sendRedirect("/variedades-ampi/vendedor/index.jsp");
    } else if (idRol.equals("3")) {
        response.sendRedirect("/variedades-ampi/cliente/index.jsp");
    } else {
        response.sendRedirect("/variedades-ampi/cliente/index.jsp");
    }
%>