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
        <title>Ropa</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td colspan="18">
                    <s:form action="RopaAdminFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="irPaginaAdmin">
                        <i style="font-size: 20px;">Volver</i>
                    </s:a>                            
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="RopaAdminForm">
                            <s:param name="accion" value="'a'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                        </s:a>
                    </s:form>
                </td>
            </tr>
            <tr>

                <th>Acciones</th>
                <th>Id</th>
                <th>Clientela</th>
                <th>Colección</th>
                <th>Color</th>
                <th>Look</th>
                <th>Marca</th>
                <th>Talla</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Descuento</th>
                <th>Características</th>
                <th>Visible</th>
                <th>Unidades</th>
                <th>Fecha</th>
                <th>Categoría</th>
                <th>Subcategoría</th>
                <th>Fotos</th>
            </tr>
            <s:iterator var="a" value="lista_ropa">
                <tr>
                    <td>
                        <s:a action="RopaAdminForm">
                            <s:param name="clave" value="#a.roId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="RopaAdminForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.roId"/><br>
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
                        <s:property value="#a.roVisible"/><br>
                    </td>
                    <td>
                        <s:property value="roUnidades"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roFecha"/><br>
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

