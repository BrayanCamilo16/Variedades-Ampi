<%@page import="vo.UsuarioVO"%>
<%@include file="cache.jsp" %>
<%    
    HttpSession sesion = request.getSession();

    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    int idRol = userVo.getIdRol();

    if (idRol == 1) {
        response.sendRedirect("admin/");
    } else if (idRol == 2) {
        response.sendRedirect("vendedor/");
    } else if (idRol == 3) {
        response.sendRedirect("cliente/");
    } else {
        response.sendRedirect("index.jsp");
    }
%>