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
                <td colspan="13">
                    <s:form action="Usuario/RopaFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>                    
                    </s:form>
                </td>
                <td>
                    <s:form action="Usuario/CestaFiltro" theme="simple">
                        <s:textfield type="hidden" value="1" name="filtro" /> <s:property value="totalcestaUsuario"/> <s:submit value="cesta"></s:submit>                    
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
                <th>roPrecio</th>
                <th>roDescuento</th>
                <th>roCaracteristicas</th>
                <th>Categoría</th>
                <th>Subcategoría</th>
                <th>Fotos</th>
            </tr>

            <s:iterator var="a" value="lista_ropa">

                <tr>
                    <td>
                        <s:a action="Usuario/RopaForm">
                            <s:param name="accion" value="'c'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-euro"></i>
                        </s:a>

                            <i style="font-size: 20px" class="glyphicon glyphicon-plus-sign"></i>

                        <s:a action="Usuario/CrudActionUsuariosCesta">
                            <s:param name="accion" value="'c'"/>
                            <s:param name="accionocul" value="'c'"/>
                            <s:param name="cantidad" value="1"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-shopping-cart"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.clientela.clientelaDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.coleccion.coleccionDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.color.colorDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.look.lookDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.marcas.marcaNombre"/><br>
                    </td>
                    <td>
                        <s:property value="#a.tallas.tallaDescripcion"/><br>
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
                        <s:property value="#a.categoria.catDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.subcategoria.subDescripcion"/>                        
                    </td>
                    <td>
                        <s:iterator var="f" value="fotoses">
                            <s:property value="fotosRuta"/>
                        </s:iterator>
                    </td>
                </tr>
            </s:iterator> 
        </table> 
    </body>
</html>