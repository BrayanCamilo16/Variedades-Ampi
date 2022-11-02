<%-- 
    Document   : vistas
    Created on : 22/08/2022, 7:31:56 a. m.
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
        <%
        Connection con;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi","root","") ;
        File jasperfile = new File(application.getRealPath("reporte/report1.jasper"));
        Map parametro = new HashMap();
        byte[] bytes =JasperRunManager.runReportToPdf(jasperfile.getPath(),null,con );
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream output = response.getOutputStream();
        response.getOutputStream();
        output.write(bytes,0,bytes.length);
        output.flush();
        output.close();
        %>
        
    </head>
    <body>
    
        
    </body>
</html>
