<%@page import="vo.UsuarioVO"%>
<%
    HttpSession sesion = request.getSession();
    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    if (!idRol.equals("2")) {
        response.sendRedirect("../menu.jsp");
    }
%>