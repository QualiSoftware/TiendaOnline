<%-- 
    Document   : pruebaFormalizaFacturaUsuario
    Created on : 02-nov-2016, 18:02:31
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
        <table>
            <tr>
                <td>
                    <s:property value="us.usuNombre"/><br>
                    <s:property value="us.usuApellidos"/><br>
                    <s:property value="us.usuEmail"/><br>
                    <s:property value="us.usuDireccion"/><br>
                    <s:property value="us.usuLocalidad"/><br>
                    <s:property value="us.provincias.proNombre"/><br>
                    <s:property value="us.usuCp"/><br>
                    <s:property value="us.provincias.paises.paisNombre"/><br>
                    <s:property value="us.usuTelefono"/><br>
                </td>
                <td>
                <s:form action="Pagar" theme="simple">
                        <input type="hidden" name="prov" value="<s:property value="us.provincias.proNombre"/>"/>
                        <input type="hidden" name="pais" value="<s:property value="us.provincias.paises.paisNombre"/>"/>
                        <input type="hidden" name="facUsuId" value="<s:property value="us.usuId"/>"/>
                    <table border="1">
                         <tr>
                             <td colspan="11">
                                <a href="CestaFiltro">
                                    volver
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th>coleccion</th>
                            <th>color</th>
                            <th>marcas</th>
                            <th>tallas</th>
                            <th>Descripcion</th>
                            <th>Caracteristicas</th>
                            <th>Categoría</th>
                            <th>Subcategoría</th>
                            <th>Descuento</th>
                            <th>Precio</th>
                            <th>Total</th>
                        </tr>
                        <s:iterator var="a" value="lista_ropa_Cestas">
                        <tr>
                            <td>
                                <s:property value="#a.ropa.coleccion.coleccionDescripcion"/><br>
                            </td>
                            <td>
                                <s:property value="#a.ropa.color.colorDescripcion"/><br>
                            </td>
                            <td>
                                <s:property value="#a.ropa.marcas.marcaNombre"/><br>
                            </td>
                            <td>
                                <s:property value="#a.ropa.tallas.tallaDescripcion"/><br>
                            </td>
                            <td>
                                <s:property value="#a.ropa.roDescripcion"/><br>
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
                                <s:property value="#a.ropa.roDescuento"/><br>
                            </td>
                            <td>
                                <s:property value="#a.ropa.roPrecio"/><br>
                            </td>
                            <td>                                   
                                <s:property  value="#a.cestaUnidades * (#a.ropa.roPrecio-#a.ropa.roDescuento)"/> 
                            </td>
                        </tr>
                        </s:iterator>
                        <tr>              
                            <td colspan="10">
                                total
                            </td>
                            <td>
                                <s:property value="precio"/><br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10">
                                <s:textarea label="Observaciones" name="obs" cols="100" rows="2" theme="simple"/>
                            </td>
                            <td>
                                <s:submit value="Pagar"><i style="font-size: 20px" class="glyphicon glyphicon-euro"></i></s:submit>
                            </td>
                        </tr>                       
                    </table>
                        </s:form>
                </td>
            </tr>
        </table>
    </body>
</html>
