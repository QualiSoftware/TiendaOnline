<%-- 
    Document   : Prueba
    Author     : Laplaga
--%>
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
                    <s:form action="ColorFiltro" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                            <s:a action="ColorForm">
                                <s:param name="accion" value="'a'"/>
                                <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                            </s:a>
                    </s:form>
                </td>
            </tr>
 <tr>

                <th>Acciones</th>
                <th>Codigo</th>
                <th>Nombre</th>


            </tr>
            <s:iterator var="a" value="Lista_Color">
                <tr>
                    <td>
                        <s:a action="ColorForm">
                            <s:param name="clave" value="#a.ColorId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="ColorForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.ColorId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.ColorId"/><br>
                    </td>
                    <td>
                        <s:property value="#a.ColorDescripcion"/><br>
                    </td>
                </tr>
            </s:iterator>
        </table> 
    </body>
</html>

