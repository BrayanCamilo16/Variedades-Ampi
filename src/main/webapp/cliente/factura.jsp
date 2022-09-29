<%-- 
    Document   : factura
    Created on : 16/09/2022, 8:44:43 a. m.
    Author     : SENA
--%>

<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
            var id = prompt("ingrese el id:");
            if (id==null) {
                window.location.href="index.jsp";
} else {
     window.location.href="factura.jsp?id="+id;
}
    
    </script>
    <body>
         <%
       
       if (request.getParameter("id")!=null) {
               String valor =request.getParameter("id").toString();
               Connection con;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi","root","") ;
        File jasperfile = new File(application.getRealPath("reporte/factura.jasper"));
        Map parametro = new HashMap();
        parametro.put("id", valor);
        byte[] bytes =JasperRunManager.runReportToPdf(jasperfile.getPath(),parametro,con );
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream output = response.getOutputStream();
        response.getOutputStream();
        output.write(bytes,0,bytes.length);
        output.flush();
        output.close();
           }
    
        %>
    </body>
</html>
