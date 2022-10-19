<%-- 
    Document   : factura
    Created on : 16/09/2022, 8:44:43 a. m.
    Author     : SENA
--%>

<%@page import="java.util.List"%>
<%@page import="vo.ProductoVO"%>
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
   
             <%  HttpSession sesion = request.getSession();
    Double precioTotal = 0.0;  
   

       if (sesion.getAttribute("productoCarrito") != null)
       {
    ProductoVO productoVo = new ProductoVO(); 
    List<ProductoVO> productos = (List<ProductoVO>) sesion.getAttribute("productoCarrito"); 
    
    String nombre= productoVo.getNombreProducto();
    int cantidad=productoVo.getCantidad();
    Double precio = productoVo.getPrecioUnitarioProducto();
   
    precioTotal += productoVo.getPrecioUnitarioProducto() * productoVo.getCantidad();
    
      
        Connection con;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/variedades_ampi","root","") ;
        File jasperfile = new File(application.getRealPath("reporte/factura.jasper"));
        Map parametro = new HashMap();
        parametro.put("nombre", nombre);
        parametro.put("precio",precioTotal);
        parametro.put("cantidad", cantidad);
        parametro.put("precio", precio);
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
