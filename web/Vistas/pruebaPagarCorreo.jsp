<%-- 
    Document   : pruebaPagarCorreo
    Created on : 02-nov-2016, 21:22:24
    Author     : javiermartinroncero
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:if test="aceptarpago">
            <h1>Correo enviado a <s:property value="us.usuEmail"/></h1>
        </s:if>
        <s:else>
            <h1>Correo NO enviado a <s:property value="us.usuEmail"/></h1>
        </s:else>
        <s:a action="RopaFiltroU">
            <i style="font-size: 20px;">Volver</i>
        </s:a>
    </body>
</html>
