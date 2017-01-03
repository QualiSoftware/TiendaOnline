<%-- 
    Document   : Confirmacion
    Created on : 04-dic-2016
    Author     : QualiSoftware
--%>
<%@page import="Modelos.Usuarios"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:property value="u.usuNombre"/>
        <center>
            <h1>La factura fue enviada por email</h1>
            <!--<s:a action="RopaFiltroU">-->
            <s:a action="Tienda">
                <i style="font-size: 20px;">Volver a la tienda</i>
            </s:a>
        </center>
    </body>
</html>
