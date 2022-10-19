<%@page import="vo.UsuarioVO"%>
<%
    HttpSession sesion = request.getSession();
    UsuarioVO userVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
    String idRol = userVo.getIdRol();
    //aqui se le esta diciendo si rol es diferente a 1(admin) que lo redireccione a menu
    if (!idRol.equals("1")) {
        response.sendRedirect("../menu.jsp");
    }
%>