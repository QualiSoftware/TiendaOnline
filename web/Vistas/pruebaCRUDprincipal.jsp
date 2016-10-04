<%-- 
    Document   : Prueba
    Author     : Laplaga
--%>
<%@page import="Modelos.Ropa"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>PruebaCRUD</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td colspan="8">
                    <s:form action="RopaFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="RopaForm">
                            <s:param name="accion" value="'a'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                        </s:a>
                    </s:form>
                </td>
            </tr>
            <tr>
                          
                <th>Acciones</th>
                <th>roId</th>
                <th>clientela</th>
                <th>coleccion</th>
                <th>color</th>
                <th>look</th>
                <th>marcas</th>
                <th>tallas</th>
                <th>roDescripcion</th>
                <th>roPrecio</th>
                <th>roDescuento</th>
                <th>roCaracteristicas</th>
                <th>roVisible</th>
                <th>roUnidades</th>
                <th>roFecha</th>

            </tr>
           <s:iterator var="a" value="lista_ropa">
                <tr>
                    <td>
                        <s:a action="RopaForm">
                            <s:param name="clave" value="#a.roId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="RopaForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.roId"/><br>
                    </td>
                    <td>
                        <s:property value="#a.clientela"/><br>
                    </td>
                    <td>
                        <s:property value="#a.coleccion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.color"/><br>
                    </td>
                    <td>
                        <s:property value="#a.look"/><br>
                    </td>
                    <td>
                        <s:property value="#a.marcas"/><br>
                    </td>
                    <td>
                        <s:property value="#a.tallas"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roPrecio"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roDescuento"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roCaracteristicas"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roVisible"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roUnidades"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roFecha"/><br>
                    </td>

                    <td>
                        <s:property value="#a.ropaCategorias.size()"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropaMaterials"/><br>
                    </td>
                    <td>
                        <s:property value="#a.fotoses"/><br>
                    </td>
                </tr>
            </s:iterator> 
        </table> 
    </body>
</html>

