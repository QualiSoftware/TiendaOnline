<%-- 
    Document   : paginaAdmin
    Created on : 17-oct-2016, 17:37:49
    Author     : Damian
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <title>Página Administrador</title>
    </head>
    <body>
        <h1>Bienvenido Administrador</h1>
        <s:form id="frm" action="#" theme="simple">
            <s:a action="CategoriaFiltro">
                <span class="glyphicon glyphicon-plus"></span> Categorías
            </s:a>
            <s:a action="ClientelaFiltro">
                <span class="glyphicon glyphicon-plus"></span> Clientela
            </s:a>
            <s:a action="ColeccionFiltro">
                <span class="glyphicon glyphicon-plus"></span> Colecciones
            </s:a>
            <s:a action="ColorFiltro">
                <span class="glyphicon glyphicon-plus"></span> Colores
            </s:a>
            <s:a action="LookFiltro">
                <span class="glyphicon glyphicon-plus"></span> Looks
            </s:a>
            <s:a action="MarcasFiltro">
                <span class="glyphicon glyphicon-plus"></span> Marcas
            </s:a>
            <s:a action="TallasFiltro">
                <span class="glyphicon glyphicon-plus"></span> Tallas
            </s:a>
            <s:a action="RopaFiltro">
                <span class="glyphicon glyphicon-plus"></span> Ropa
            </s:a>
            <s:a action="FacturasFiltro">
                <span class="glyphicon glyphicon-plus"></span> Facturación
            </s:a>
        </s:form>
    </body>
</html>
