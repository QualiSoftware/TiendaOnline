<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
    <center>
        <h1>Material</h1>
        <s:form  action="MaterialFiltro" theme="simple">
            <table class="table">
                <tr>
                    <td colspan="2">
                        Filtro: <s:textfield name="filtro" />
                        <input type="submit" value="Filtrar" />
                    </td>
                    <td colspan="2"></td>
                    <td>
                        <s:a action="volverMaterial">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>                        
                    </td>
                    <td>
                        <s:a action="MaterialForm">
                            <s:param name="clave" value="" />
                            <s:param name="accion" value="'a'" />
                            <i style="font-size: 20px;" class="glyphicon glyphicon-plus">Nuevo</i>
                        </s:a>
                    </td>
                </tr>
                <tr class="titulos">
                    <td>ID</td>
                    <td>Descripción</td>
                    <td>Acciones</td>  
                </tr>
            <s:iterator value="lista_material" var="a">
                <tr>
                    <td>
                <s:property value="materialId" />
                </td><td>
                <s:property value="materialDescripcion" />
                </td>
                <td>
                    <s:a action="MaterialForm">
                        <s:param name="clave" value="materialId" />
                        <s:param name="accion" value="'m'" />
                        <i style="font-size: 20px;" class="glyphicon glyphicon-pencil"></i>
                    </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="MaterialForm">
                        <s:param name="clave" value="materialId" />
                        <s:param name="accion" value="'e'" />
                        <i style="font-size: 20px;" class="glyphicon glyphicon-trash"></i>
                    </s:a>
                </td>
                </tr>
            </s:iterator>
            </table>
        </s:form>
    </center>
    </body>
</html>