<%
    if (request.getAttribute("redirigir") != null) {
        String redirigirA = (String) request.getAttribute("redirigir");
        request.getRequestDispatcher(redirigirA).forward(request, response);
//        response.sendRedirect(redirigirA);
    }
%>