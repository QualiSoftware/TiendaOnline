<%-- 
    Document   : tiendaCestaPopUp
    Created on : 12-ene-2017, 23:52:13
    Author     : Damian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! <% out.println(request.getParameter("clave")); %></h1>
                                    <span id="listados">
                                            <s:select name="color" list="lista_colores" listValue="colorDescripcion" 
                                                      listKey="colorId" value="rstock.color.colorId" theme="simple"/>
                                        <s:a action="TiendaCesta">
                                            <s:param name="clientela2" value="%{clientela2}"/>
                                            <s:param name="categoria2" value="%{categoria2}"/>
                                            <s:param name="marcas2" value="%{marcas2}"/>
                                            <s:param name="campania" value="%{campania}"/>
                                            <s:param name="accion" value="'c'"/>
                                            <s:param name="accionocul" value="'c'"/>
                                            <s:param name="cantidad" value="1"/>
                                            <s:param name="clave" value="#m.roId"/>
                                            Enviar
                                        </s:a> 
                                    </span>
        <a href="/TiendaOnline/Vistas/TiendaCesta.action?clientela2=&amp;categoria2=&amp;marcas2=&amp;campania=&amp;accion=c&amp;accionocul=c&amp;cantidad=1&amp;clave=<% out.println(request.getParameter("clave")); %>">
            <img src="../Imagenes/Colores/Azul.jpg" title="Añadir a la Cesta">
        </a>
    </body>
</html>
