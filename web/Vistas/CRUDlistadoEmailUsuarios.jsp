<%-- 
    Document   : CRUDlistadoEmailUsuarios.jsp
    Created on : 17-abr-2017
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Listado Emails</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Listado Email Usuarios</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">
            Aquí puede <span class="bold">copiar </span>las direcciones de email para envío de publicidad.
        </div>
        <div  class="linea"></div>
        <center>
            <br/>
            <s:set var="saltoLinea" value="0"/>
            <s:iterator var="a" value="lista_usuarios">
                <s:property value="#a.usuEmail"/>;&nbsp
                <s:set var="saltoLinea" value="%{#saltoLinea + 1}"/>
                <s:if test="#saltoLinea == 5">
                    <s:set var="saltoLinea" value="0"/>
                    <br>
                </s:if>                
            </s:iterator>
        </center>
    </body>
</html>