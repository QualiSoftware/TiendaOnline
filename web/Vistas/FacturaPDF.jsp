<%-- 
    Document   : FacturaPDF.jsp
    Created on : 03-nov-2016
    Author     : QualiSoftware
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JasperViewer" %>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="ControladoresDAO.cPDFConexion" %>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<%
    try{                
        Connection con = cPDFConexion.Conexion();
        String ruta = application.getRealPath("Vistas/FacturaTienda.jasper");
        File reportfile = new File(ruta);
        Map <String, Object> parameter = new HashMap <String, Object>();
        parameter.put("clave", ""+request.getAttribute("clave"));
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        OutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        String cPDF = ""+request.getAttribute("crearPDF");
        if(cPDF.equals("si")){
            Date date = new Date();
            DateFormat fechaExacta = new SimpleDateFormat("yyyyMMddHHmmss");
            String rutaOut = application.getRealPath("")+System.getProperty("file.separator")+
                    "Archivos"+System.getProperty("file.separator")+fechaExacta.format(date)+
                    request.getAttribute("facUsuId")+".pdf";
            String eliminar = "build"+System.getProperty("file.separator");
            rutaOut = rutaOut.replace(eliminar, "");                
            outputstream.flush();
            outputstream.close();
            outputstream = new FileOutputStream(rutaOut);
            outputstream.write(bytes,0,bytes.length);
        }
        outputstream.flush();
        outputstream.close();
        con.close();
    }catch(Exception e){
        System.out.println("Error: "+e.getMessage());
    }
%>