<%-- 
    Document   : CRUDfacturas.jsp
    Created on : 26-oct-2016
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
        <title>Facturas</title>
    </head>
    <body>
        <s:form action="FacturasFiltro" theme="simple">
        <table border="1">
            <tr>
                <td colspan="5">
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                </td>
                <td colspan="8">
                    <s:a action="irPaginaAdmin">
                        <i style="font-size: 20px;">Volver</i>
                    </s:a>                            
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <!--
                    <s:a action="FacturasForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                    -->
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facCodigo'"/>Código
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facRazonsocial'"/>Razón Social
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDireccion'"/>Dirección
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facPoblacion'"/>Población
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facProvincia'"/>Provincia
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facCp'"/>Código Postal
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facPais'"/>País
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDni'"/>NIF / CIF
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDescuento'"/>Descuento
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facFecha'"/>Fecha
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facIva'"/>IVA
                    </s:a>
                </th>
                <th>
                    <s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facObservaciones'"/>Observaciones
                    </s:a>
                </th>
            </tr>
            <s:iterator var="a" value="lista_facturas">
                <tr>
                    <td>
                        <s:a action="FacturasForm">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        <!--
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="FacturasForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.facId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                        -->
                    </td>
                    <td>
                        <s:property value="#a.facCodigo"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facRazonsocial"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facDireccion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facPoblacion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facProvincia"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facCp"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facPais"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facDni"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facDescuento"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facFecha"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facIva"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facObservaciones"/><br>
                    </td>
                </tr>
            </s:iterator> 
        </table>
        </s:form>
    </body>
</html>