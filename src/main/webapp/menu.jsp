<%@page import="vo.UsuarioVO"%>
<%@include file="cache.jsp" %>
<%    HttpSession sesion = request.getSession();

    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    if (idRol.equals("1")) {
        response.sendRedirect("admin/index.jsp");
    } else if (idRol.equals("2")) {
        response.sendRedirect("vendedor/index.jsp");
    } else if (idRol.equals("3")) {
        response.sendRedirect("cliente/index.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>