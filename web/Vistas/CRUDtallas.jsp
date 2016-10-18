<%-- 
    Document   : CRUDtallas.jsp
    Created on : 17-oct-2016
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
        <title>Tallas</title>
    </head>
    <body>
        <s:form action="TallasFiltro" theme="simple">
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
                    <s:a action="TallasForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>Tallas</th>
            </tr>
            <s:iterator var="a" value="lista_tallas">
                <tr>
                    <td>
                        <s:a action="TallasForm">
                            <s:param name="clave" value="#a.tallaId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="TallasForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.tallaId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.tallaDescripcion"/><br>
                    </td>
                </tr>
            </s:iterator> 
        </table>
        </s:form>
    </body>
</html>