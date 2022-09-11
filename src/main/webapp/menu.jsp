<%@page import="vo.UsuarioVO"%>
<%@include file="cache.jsp" %>
<%    HttpSession sesion = request.getSession();

    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    if (idRol.equals("1")) {
        response.sendRedirect("admin/");
    } else if (idRol.equals("2")) {
        response.sendRedirect("vendedor/");
    } else if (idRol.equals("3")) {
        response.sendRedirect("cliente/");
    } else {
        response.sendRedirect("index.jsp");
    }
%>