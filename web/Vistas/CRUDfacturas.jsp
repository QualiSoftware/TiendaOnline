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
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Facturas</div>
            <s:include value="menuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <!--<div id="descripcion_Pagina">Aquí puede <span class="bold">ver </span>las facturas.</div>
        <div  class="linea"></div>-->
        <s:form action="FacturasFiltro" theme="simple">
        <table border="1">
            <tr>
                <td colspan="13">
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>          
                    &nbsp;&nbsp;&nbsp;&nbsp;                            
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
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_facturas">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="FacturaDetalleFiltro">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="facCodigo" value="#a.facCodigo"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-list-alt"></i>
                        </s:a>
                        <!-- lo dejo por las dudas que sea necesario modificar y/o eliminar facturas
                        <s:a action="FacturasForm">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
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
                <%
                    if(fondo.equals("fondoOscuro")){
                        fondo="fondoClaro";
                    }else{
                        fondo="fondoOscuro";
                    }
                %>
            </s:iterator> 
        </table>
        </s:form>
    </body>
</html>