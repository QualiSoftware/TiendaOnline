<%-- 
    Document   : FacturaPDF.jsp
    Created on : 03-nov-2016
    Author     : QualiSoftware
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>

<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JasperViewer" %>

<%@page import="javax.servlet.ServletResponse" %>
<%@page import="ControladoresDAO.cPDFConexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            Connection con = cPDFConexion.Conexion();
            String ruta = application.getRealPath("Vistas/FacturaTienda.jasper");
            File reportfile = new File(ruta);
            Map <String, Object> parameter = new HashMap <String, Object>();
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
            con.close();
            }catch(Exception e){
                System.out.println("Error: "+e.getMessage());
            }
        %>
    </body>
</html>
