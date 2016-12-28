<%-- 
    Document   : activacionError.jsp
    Created on : 09-dic-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de activación</title>
    </head>
    <body>
        <h1>Cuenta <s:property value="usuEmail2" /> no activada.</h1>
        <h2>Para más información por favor contacte con la tienda vía email. Disculpe las molestias.</h2>
        <s:a action="Tienda" >Tienda Ropa</s:a>        
    </body>
</html>
