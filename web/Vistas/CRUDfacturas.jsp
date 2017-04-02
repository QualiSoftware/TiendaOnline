<%-- 
    Document   : CRUDfacturas.jsp
    Created on : 26-oct-2016
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String orden = "";
    String filtro;
    String fechaI = "";
    String fechaF = "";
    boolean[] ascendente = new boolean[11];
    String[] completollamada = new String[11];
%>                         
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
                         <%
                            if(request.getParameter("orden") != null){
                                orden = request.getParameter("orden");
                            }
                            if(request.getParameter("filtro") != null){
                                filtro = request.getParameter("filtro");
                            }
                            if(request.getParameter("fechaI") != null){
                                fechaI = request.getParameter("fechaI");
                            }
                            if(request.getParameter("fechaF") != null){
                                fechaF = request.getParameter("fechaF");
                            }
                        %>
                        <input type="hidden" name="orden" value="<%=orden%>" />
                    </s:form>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facCodigo ASC") || orden.equals("facCodigo DESC")){
                                ascendente[0] = !ascendente[0];
                            }else{
                                ascendente[0] = true;
                            }
                            if(ascendente[0]){
                                completollamada[0] = " ASC";
                            }else{
                                
                                completollamada[0] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facCodigo<%=completollamada[0]%>" />
                        <s:submit value="Código" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facCodigo'"/>Código
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facRazonsocial ASC") || orden.equals("facRazonsocial DESC")){
                                ascendente[1] = !ascendente[1];
                            }else{
                                ascendente[1] = true;
                            }
                            if(ascendente[1]){
                                completollamada[1] = " ASC";
                            }else{
                                
                                completollamada[1] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facRazonsocial<%=completollamada[1]%>" />
                        <s:submit value="Razón Social" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facRazonsocial'"/>Razón Social
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facDireccion ASC") || orden.equals("facDireccion DESC")){
                                ascendente[2] = !ascendente[2];
                            }else{
                                ascendente[2] = true;
                            }
                            if(ascendente[2]){
                                completollamada[2] = " ASC";
                            }else{
                                
                                completollamada[2] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facDireccion<%=completollamada[2]%>" />
                        <s:submit value="Dirección" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDireccion'"/>Dirección
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facPoblacion ASC") || orden.equals("facPoblacion DESC")){
                                ascendente[3] = !ascendente[3];
                            }else{
                                ascendente[3] = true;
                            }
                            if(ascendente[3]){
                                completollamada[3] = " ASC";
                            }else{
                                
                                completollamada[3] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facPoblacion<%=completollamada[3]%>" />
                        <s:submit value="Población" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facPoblacion'"/>Población
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facProvincia ASC") || orden.equals("facProvincia DESC")){
                                ascendente[4] = !ascendente[4];
                            }else{
                                ascendente[4] = true;
                            }
                            if(ascendente[4]){
                                completollamada[4] = " ASC";
                            }else{
                                
                                completollamada[4] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facProvincia<%=completollamada[4]%>" />
                        <s:submit value="Provincia" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facProvincia'"/>Provincia
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facCp ASC") || orden.equals("facCp DESC")){
                                ascendente[5] = !ascendente[5];
                            }else{
                                ascendente[5] = true;
                            }
                            if(ascendente[5]){
                                completollamada[5] = " ASC";
                            }else{
                                
                                completollamada[5] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facCp<%=completollamada[5]%>" />
                        <s:submit value="Código Postal" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facCp'"/>Código Postal
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facPais ASC") || orden.equals("facPais DESC")){
                                ascendente[6] = !ascendente[6];
                            }else{
                                ascendente[6] = true;
                            }
                            if(ascendente[6]){
                                completollamada[6] = " ASC";
                            }else{
                                
                                completollamada[6] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facPais<%=completollamada[6]%>" />
                        <s:submit value="País" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facPais'"/>País
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facDni ASC") || orden.equals("facDni DESC")){
                                ascendente[7] = !ascendente[7];
                            }else{
                                ascendente[7] = true;
                            }
                            if(ascendente[7]){
                                completollamada[7] = " ASC";
                            }else{
                                
                                completollamada[7] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facDni<%=completollamada[7]%>" />
                        <s:submit value="NIF / CIF" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDni'"/>NIF / CIF
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facDescuento ASC") || orden.equals("facDescuento DESC")){
                                ascendente[8] = !ascendente[8];
                            }else{
                                ascendente[8] = true;
                            }
                            if(ascendente[8]){
                                completollamada[8] = " ASC";
                            }else{
                                
                                completollamada[8] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facDescuento<%=completollamada[8]%>" />
                        <s:submit value="Descuento" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facDescuento'"/>Descuento
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facFecha ASC") || orden.equals("facFecha DESC")){
                                ascendente[9] = !ascendente[9];
                            }else{
                                ascendente[9] = true;
                            }
                            if(ascendente[9]){
                                completollamada[9] = " ASC";
                            }else{
                                
                                completollamada[9] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facFecha<%=completollamada[9]%>" />
                        <s:submit value="Fecha" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facFecha'"/>Fecha
                    </s:a>-->
                </th>
                <th>
                    <s:form action="FacturasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <%
                            if(orden.equals("facObservaciones ASC") || orden.equals("facObservaciones DESC")){
                                ascendente[10] = !ascendente[10];
                            }else{
                                ascendente[10] = true;
                            }
                            if(ascendente[10]){
                                completollamada[10] = " ASC";
                            }else{
                                
                                completollamada[10] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="facObservaciones<%=completollamada[10]%>" />
                        <s:submit value="Observaciones" />
                    </s:form>
                    <!--<s:a action="FacturasFiltro">
                        <s:param name="orden" value="'facObservaciones'"/>Observaciones
                    </s:a>-->
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