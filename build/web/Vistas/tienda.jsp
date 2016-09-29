<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bienvenido</title>
    </head>
    <body>
        <h1>Tienda Online</h1>
        
        <h4>Bienvenido, <s:property value="sesion.usuariologueado.usuNombre"/>! </h4>
        
    </body>
</html>