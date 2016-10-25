<%-- 
    Document   : CRUDropa.jsp
    Created on : 17-oct-2016
    Author     : QualiSoftware
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
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roId'"/>Id
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'clientela.clientelaDescripcion'"/>Clientela
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'coleccion.coleccionDescripcion'"/>Colección
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'color.colorDescripcion'"/>Color
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'look.lookDescripcion'"/>Look
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'marcas.marcaNombre'"/>Marca
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'tallas.tallaDescripcion'"/>Talla
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roDescripcion'"/>Descripción
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roPrecio'"/>Precio
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roDescuento'"/>Descuento
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roCaracteristicas'"/>Características
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roVisible'"/>Visible
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roUnidades'"/>Unidades
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'roFecha'"/>Fecha
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'categoria.catDescripcion'"/>Categoría
                    </s:a>
                </th>
                <th>
                    <s:a action="RopaAdminFiltro">
                        <s:param name="orden" value="'subcategoria.subDescripcion'"/>Subcategoría
                    </s:a>
                </th>
                <th>Fotos</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_ropa">
                <tr>
                    <td class="<%out.println(fondo);%>">
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
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roId"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.clientela.clientelaDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.coleccion.coleccionDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.color.colorDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.look.lookDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.marcas.marcaNombre"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.tallas.tallaDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roPrecio"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roDescuento"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roCaracteristicas"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roVisible"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="roUnidades"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.roFecha"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.categoria.catDescripcion"/>
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:property value="#a.subcategoria.subDescripcion"/>                        
                    </td>
                    <td class="<%out.println(fondo);%>">
                        <s:iterator var="f" value="fotoses">
                            <s:property value="fotosRuta"/>
                        </s:iterator>
                    </td>
                </tr>
                <%
                    if(fondo.equals("fondoOscuro")){
                        fondo="fondoClaro";
                    }else{
                        fondo="fondoOscuro";
                    }
                %>
            </s:iterator> 
        </table> 
    </body>
</html>

