<%-- 
    Document   : CRUDcolores.jsp
    Created on : 20-oct-2016
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
        <title>Colores</title>
    </head>
    <body>
        <s:form action="ColorFiltro" theme="simple">
        <table border="1">
            <tr>
                <td>
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                </td>
                <td>
                    <s:a action="irPaginaAdmin">
                        <i style="font-size: 20px;">Volver</i>
                    </s:a>                            
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="ColorForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>Color</th>
            </tr>
            <s:iterator var="a" value="Lista_Color">
                <tr>
                    <td>
                        <s:a action="ColorForm">
                            <s:param name="clave" value="#a.colorId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="ColorForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.colorId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.colorDescripcion"/><br>
                    </td>
                </tr>
            </s:iterator> 
        </table>
        </s:form>
    </body>
</html>