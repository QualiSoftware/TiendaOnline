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
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    <s:property value="u.usuNombre"/><br>
                    <s:property value="u.usuApellidos"/><br>
                    <s:property value="u.usuEmail"/><br>
                    <s:property value="u.usuDireccion"/><br>
                    <s:property value="u.usuLocalidad"/><br>
                    <s:property value="u.Provincias.proNombre"/><br>
                    <s:property value="u.usuCp"/><br>
                    <s:property value="u.usuTelefono"/><br>
                </td>
                <td>
                    <table border="1">
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
                                
                                <s:iterator  value="lista_precio_descuento">
                                <td>                                   
                                    <s:property  value="%{[0].toString()}"/> 
                                </td>
                                 </s:iterator>
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
                            <td>
                                <s:a action="Usuario/Pagar">
                                    <i style="font-size: 20px" class="glyphicon glyphicon-euro"></i>
                                </s:a>
                            </td>
                        </tr>                       
                    </table>
                </td>

            </tr>
        </table>
    </body>
</html>
