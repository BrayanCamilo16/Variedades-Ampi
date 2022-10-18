<%@page import="vo.UsuarioVO"%>
<%
    HttpSession sesion = request.getSession();
    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    if (!idRol.equals("1") && !idRol.equals("3")) {
        request.getRequestDispatcher("vendedor/index.jsp").forward(request, response);
    }
%>