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
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
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
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="facCodigo" value="#a.facCodigo"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-list-alt"></i>
                        </s:a>
                        &nbsp;&nbsp;
                        <s:a action="FacturaPDF" target="_blank">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="facUsuId" value="#a.facUsuId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-print"></i>
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
                        <s:date name="#a.facFecha" format="dd/MM/yyyy hh:mm" /><br>
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
    </body>
</html>