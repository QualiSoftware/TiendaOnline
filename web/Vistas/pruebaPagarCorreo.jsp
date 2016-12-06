<%-- 
    Document   : pruebaPagarCorreo
    Created on : 02-nov-2016, 21:22:24
    Author     : javiermartinroncero
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
<%@page import="Modelos.Usuarios"%>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<%
    Usuarios usuario = null;
    boolean emailEnviado = false;
    try{
        Connection con = cPDFConexion.Conexion();
        String ruta = application.getRealPath("Vistas/FacturaTienda.jasper");
        File reportfile = new File(ruta);
        Map <String, Object> parameter = new HashMap <String, Object>();
        parameter.put("clave", ""+request.getAttribute("clave"));
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,con);
        //response.setContentType("application/pdf");
        //response.setContentLength(bytes.length);
        //OutputStream outputstream = response.getOutputStream();
        //Las líneas que siguen me ayudan a que se redirija a pruebaPagarConfirmacion... no sé por qué
        String txt = "Confirmacion.txt";
        String rutaOut = application.getRealPath("")+System.getProperty("file.separator")+
                "Archivos"+System.getProperty("file.separator")+txt;
        String eliminar = "build"+System.getProperty("file.separator");
        rutaOut = rutaOut.replace(eliminar, "");
        OutputStream outputstream = new FileOutputStream(rutaOut);        
        outputstream.write(bytes,0,bytes.length);                
        outputstream.flush();
        outputstream.close();
        //hasta acá
        
        //genero el archivo de la factura
        String nombreArchivo = "";
        Date date = new Date();
        DateFormat fechaExacta = new SimpleDateFormat("yyyyMMddHHmmss");
        nombreArchivo = fechaExacta.format(date)+request.getAttribute("facUsuId")+".pdf";
        rutaOut = application.getRealPath("")+System.getProperty("file.separator")+
                "Archivos"+System.getProperty("file.separator")+nombreArchivo;
        eliminar = "build"+System.getProperty("file.separator");
        rutaOut = rutaOut.replace(eliminar, "");
        outputstream = new FileOutputStream(rutaOut);
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
        con.close();
        
        int id = Integer.parseInt(""+request.getAttribute("facUsuId"));
        usuario = ControladoresDAO.cUsuarios.RecuperaPorId(id);
        //response.sendRedirect("RopaFiltroU.action");
        response.sendRedirect("pruebaPagarConfirmacion.jsp");
        emailEnviado = ControladoresDAO.cEmail.enviarCorreo(usuario.getUsuEmail(),nombreArchivo);
    }catch(Exception e){
        System.out.println("Error: "+e.getMessage());
    }
%>