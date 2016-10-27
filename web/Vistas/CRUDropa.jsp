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
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="login">
                <s:a action="CerrarSesion" cssStyle="padding: 5px 13px;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Cerrar sesión</s:a>
                </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Ropas</div>
            <s:include value="menuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las ropas.</div>
        <div  class="linea"></div>
        <table border="1">
            <tr>
                <td colspan="18">
                    <s:form action="RopaAdminFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                    &nbsp;&nbsp;&nbsp;&nbsp;                            
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
                <tr class="<%out.println(fondo);%>">
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
                        <s:property value="#a.roId"/>
                    </td>
                    <td>
                        <s:property value="#a.clientela.clientelaDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.coleccion.coleccionDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.color.colorDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.look.lookDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.marcas.marcaNombre"/>
                    </td>
                    <td>
                        <s:property value="#a.tallas.tallaDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.roDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.roPrecio"/>
                    </td>
                    <td>
                        <s:property value="#a.roDescuento"/>
                    </td>
                    <td>
                        <s:property value="#a.roCaracteristicas"/>
                    </td>
                    <td>
                        <s:property value="#a.roVisible"/>
                    </td>
                    <td>
                        <s:property value="roUnidades"/>
                    </td>
                    <td>
                        <s:property value="#a.roFecha"/>
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

