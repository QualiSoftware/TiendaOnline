<%-- 
    Document   : pruebaCRUDCestaFacuracion
    Created on : 20-oct-2016, 17:11:32
    Author     : javiermartinroncero
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>JSP Page</title>
    </head>
    <body>
         <table border="1">
            <tr>
                <td colspan="18">
                    <s:form action="Usuario/CestaFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>                    
                    </s:form>
                </td>
            </tr>
            <tr>

                <th>Acciones</th>
                <th>clientela</th>
                <th>coleccion</th>
                <th>color</th>
                <th>look</th>
                <th>marcas</th>
                <th>tallas</th>
                <th>roDescripcion</th>
                <th>roDescuento</th>
                <th>roCaracteristicas</th>
                <th>Categoría</th>
                <th>Subcategoría</th>
                <th>Cantidad</th>
                <th>roPrecio</th>
          
            </tr>
            <s:iterator var="a" value="lista_ropa_Cestas">
                <tr>
                    <td>
                        <s:a action="Usuario/RopaForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.ropa.clientela.clientelaDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.coleccion.coleccionDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.color.colorDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.lookDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.marcaNombre"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.tallaDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.roDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.roDescuento"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.roCaracteristicas"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.categoria.catDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.subcategoria.subDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.cestaUnidades"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ropa.roPrecio"/><br>
                    </td>
                </tr>
                <tr>              
                    <td colspan="13">
                        total
                    </td>
                </tr>
            </s:iterator> 
        </table> 
    </body>
</html>
