<%-- 
    Document   : CRUDcategoria.jsp
    Created on : 20-oct-2016
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
        <link href="../Estilos/IndexEstilo_1.css" rel="stylesheet" type="text/css"/>
        <title>Categoría</title>
    </head>
    <body>
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Categorías</div>
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí iría una pequeña descripción de lo que podrías hacer en esta página</div>
        <div  class="linea"></div>
        <s:form action="CategoriaFiltro" theme="simple">
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
                        <s:a action="CategoriasForm">
                            <s:param name="accion" value="'a'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                        </s:a>
                    </td>
                </tr>
                <tr>
                    <th>Acciones</th>
                    <th>Categoría</th>
                </tr>
                <s:iterator var="a" value="Lista_Categorias">
                    <tr>
                        <td>
                            <s:a action="CategoriasForm">
                                <s:param name="clave" value="#a.catId"/>
                                <s:param name="accion" value="'m'"/>
                                <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                            </s:a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <s:a action="CategoriasForm">
                                <s:param name="accion" value="'e'"/>
                                <s:param name="clave" value="#a.catId"/>
                                <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                            </s:a>
                        </td>
                        <td>
                            <s:property value="#a.catDescripcion"/><br>
                        </td>
                    </tr>
                </s:iterator> 
            </table>
        </s:form>
    </body>
</html>