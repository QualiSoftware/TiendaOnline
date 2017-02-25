<%-- 
    Document   : CRUDfacturas.jsp
    Created on : 26-oct-2016
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <script>            
            function BorrarFechas() {
                document.getElementById('fechaI').value = "";
                document.getElementById('fechaF').value = "";
            }
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Facturas</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Facturas</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <table border="1">
            <tr>
                <td colspan="13">
                    <s:form action="FacturasFiltro" theme="simple">
                        <s:label value=" Fecha desde " />
                        <s:textfield name="fechaI" id="fechaI" cssClass="tcal" readonly="true"/>
                        &nbsp;&nbsp;
                        <s:label value="hasta " />
                        <s:textfield name="fechaF" id="fechaF" cssClass="tcal" readonly="true"/>
                        <%
                            if((request.getParameter("fechaI") != null) && (request.getParameter("fechaF")) != null){
                                if(!(request.getParameter("fechaI").equals("")) && !(request.getParameter("fechaF").equals(""))){
                                    %>
                                    <input type="button" value="Borrar fechas" onclick="BorrarFechas();">
                                    <%
                                }
                            }
                        %>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Filtro por los demás campos: <s:textfield name="filtro" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:submit value="filtrar"></s:submit>
                    </s:form>
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
                            <s:param name="facdId" value="#a.facId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-list-alt"></i>
                        </s:a>
                        &nbsp;&nbsp;
                        <s:a action="FacturaPDF" target="_blank">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="facUsuId" value="#a.facUsuId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-print"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.facCodigo"/>
                    </td>
                    <td>
                        <s:property value="#a.facRazonsocial"/>
                    </td>
                    <td>
                        <s:property value="#a.facDireccion"/>
                    </td>
                    <td>
                        <s:property value="#a.facPoblacion"/>
                    </td>
                    <td>
                        <s:property value="#a.facProvincia"/>
                    </td>
                    <td>
                        <s:property value="#a.facCp"/>
                    </td>
                    <td>
                        <s:property value="#a.facPais"/>
                    </td>
                    <td>
                        <s:property value="#a.facDni"/>
                    </td>
                    <td>
                        <s:property value="#a.facDescuento"/>
                    </td>
                    <td>
                        <s:date name="#a.facFecha" format="dd/MM/yyyy hh:mm" />
                    </td>
                    <td>
                        <s:property value="#a.facIva"/>
                    </td>
                    <td>
                        <s:property value="#a.facObservaciones"/>
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