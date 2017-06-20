<%-- 
    Document   : paginaPagarOK.jsp
    Created on : 19-jun-2017
    Author     : QualiSoftware
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra realizada</title>
    </head>
    <body>
        <center>
                <h1>¡La compra se ha realizado correctamente!</h1>
                <h1>Muchas gracias por comprar en nuestra tienda</h1>
                <br/>
            <s:a action="Tienda">
                <i style="font-size: 20px;">Volver a la tienda</i>
            </s:a>
        </center>
    </body>
</html>