<%-- 
    Document   : paginaPagarError.jsp
    Created on : 25-feb-2017
    Author     : QualiSoftware
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error al pagar</title>
    </head>
    <body>
        <center>
            <h1><s:property value="u.usuNombre"/>, ha habido un problema con el pago de la factura</h1>
            <s:a action="Tienda">
                <i style="font-size: 20px;">Volver a la tienda</i>
            </s:a>
        </center>
    </body>
</html>