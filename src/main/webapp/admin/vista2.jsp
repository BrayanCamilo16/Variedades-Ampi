<%-- 
    Document   : vista2
    Created on : 1/09/2022, 9:56:04 a. m.
    Author     : SENA
--%>
<%@page import="java.util.*" %>
<%@page import="java.io.File" %>
<%@page import="java.sql.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<<<<<<< HEAD
         <script>
            var codigo = prompt("ingrese la fecha:");
            if (codigo==null) {
                window.location.href="index.jsp";
} else {
     window.location.href="vista2.jsp?codigo="+codigo;
=======
        <script>
            var fecha = prompt("ingrese la fecha:");
            if (fecha==null) {
                window.location.href="index.jsp";
} else {
     window.location.href="vista2.jsp?fecha="+fecha;
>>>>>>> 6f179a10263f22c02063b2d63aab323d68225356
}
    
    </script>
    
    
    
    </head>
    <body>
   <%
       
<<<<<<< HEAD
       if (request.getParameter("codigo")!=null) {
               String valor =request.getParameter("codigo").toString();
=======
       if (request.getParameter("fecha")!=null) {
               String valor =request.getParameter("fecha").toString();
>>>>>>> 6f179a10263f22c02063b2d63aab323d68225356
               Connection con;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi","root","") ;
        File jasperfile = new File(application.getRealPath("reporte/report2.jasper"));
        Map parametro = new HashMap();
<<<<<<< HEAD
        parametro.put("codigo", valor);
=======
        parametro.put("fecha", valor);
>>>>>>> 6f179a10263f22c02063b2d63aab323d68225356
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
