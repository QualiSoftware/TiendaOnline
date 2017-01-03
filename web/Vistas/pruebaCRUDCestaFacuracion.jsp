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
        <script>   
            function Verificar() {
                document.getElementById('frm').submit();
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
         <table border="1">
            <tr>
                <td>
                    <!--<a href="volverRopaU">-->
                    <a href="Tienda">
                        volver
                    </a>
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
                <th>Precio con Descuento</th>
            </tr>
            <s:iterator var="a" value="lista_ropa_Cestas">
                <tr>
                    <td>
                        <s:a action="CargaEliminaCesta">
                            <s:param name="clave" value="#a.cestaId"/>
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
                        <s:property value="#a.ropa.look.lookDescripcion"/><br>
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
                    <td>
                        <s:property value="#a.cestaUnidades * (#a.ropa.roPrecio-#a.ropa.roDescuento)"/> 
                    </td>
                </tr> 
            </s:iterator> 
               <tr>              
                    <td colspan="14">
                        total
                    </td>
                    <td>
                        <s:property value="precio"/><br>
                    </td>
                </tr>
                <tr>     
                    <td colspan="14">   
                    </td>
                    <td >
                        <s:a action="FormalizaFactura">
                            <i style="font-size: 20px" class="glyphicon glyphicon-euro"></i>
                        </s:a>
                    </td>
                </tr>
        </table> 
    </body>
</html>
