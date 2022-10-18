<%@page import="vo.UsuarioVO"%>
<%
    HttpSession sesion = request.getSession();
    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    if (!idRol.equals("2") && !idRol.equals("3")) {
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
    }
%>