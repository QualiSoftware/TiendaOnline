<%-- 
    Document   : pruebaPagarCorreo
    Created on : 02-nov-2016, 21:22:24
    Author     : javiermartinroncero
--%>
<%@page import="Modelos.Usuarios"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuarios usuario;
    boolean emailEnviado;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:property value="us.usuNombre"/>
        <s:action name="GenerarFactura" executeResult="true">
            <s:param name="clave" value="traigo_el_valor_de_homeCesta_del_facId"/>
            <s:param name="facUsuId" value="us.usuId"/>
            <s:param name="crearPDF" value="'si'"/>            
        </s:action>            
        <%
            usuario = ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(request.getParameter("clave")));
            emailEnviado = ControladoresDAO.cEmail.enviarCorreo(usuario.getUsuEmail());
            if(emailEnviado){
        %>
                <h1>Correo enviado a <%=usuario.getUsuEmail()%></h1>
            <%}else{%>    
                <h1>Correo NO enviado a <%=usuario.getUsuEmail()%></h1>
            <%}%>     
        <s:a action="RopaFiltroU">
            <i style="font-size: 20px;">Volver</i>
        </s:a>
    </body>
</html>
