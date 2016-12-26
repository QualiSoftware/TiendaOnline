<%-- 
    Document   : CRUDropa.jsp
    Created on : 17-oct-2016
    Author     : QualiSoftware
--%>
<%@page import="Modelos.Ropa"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String select1;
    String select0;
    String orden = "";
    String filtro;
    String fechaI;
    String fechaF;
    String eliminadas;
    boolean[] ascendente = new boolean[14];
    String[] completollamada = new String[14];
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
        <title>Ropa</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Ropas</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las ropas.</div>
        <div  class="linea"></div>
        <table border="1">
            <tr>
                <td colspan="20" style="padding-right: 40%;">
                    <s:form action="RopaAdminFiltro" theme="simple" id="frm" cssStyle="display:inline;">
                        <s:label value=" Fecha desde " />
                        <s:textfield name="fechaI" id="fechaI" cssClass="tcal" readonly="true"/>
                        &nbsp;&nbsp;
                        <s:label value="hasta " />
                        <s:textfield name="fechaF" id="fechaF" cssClass="tcal" readonly="true"/>
                        <%
                            if((request.getParameter("fechaI") != null) && (request.getParameter("fechaF")) != null){
                                if(!(request.getParameter("fechaI").equals("")) && !(request.getParameter("fechaF").equals(""))
                                        && !(request.getParameter("fechaI").equals("null")) && !(request.getParameter("fechaF").equals("null"))){
                                    %>
                                    <input type="button" value="Borrar fechas" onclick="BorrarFechas();">
                                    <%
                                }
                            }
                        %>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Filtro por los demás campos: <s:textfield name="filtro" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <%
                            if(request.getParameter("eliminadas") != null){
                                if(request.getParameter("eliminadas").equals("1")){
                                    select1 = " selected=\"selected\"";
                                    select0 = "";
                                }else
                                if(request.getParameter("eliminadas").equals("0")){
                                    select0 = " selected=\"selected\"";
                                    select1 = "";
                                }else{
                                    select0 = "";
                                    select1 = "";
                                }
                            }
                        %>
                        <select name="eliminadas">
                            <option value="2">Toda la ropa</option>
                            <option value="1"<%=select1%>>Ropa en stock</option>
                            <option value="0"<%=select0%>>Ropa eliminada</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:submit value="filtrar"></s:submit>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                            if(request.getParameter("eliminadas") != null){
                                eliminadas = request.getParameter("eliminadas");
                            }
                        %>
                        <input type="hidden" name="orden" value="<%=orden%>" />
                    </s:form>
                    <s:a action="RopaAdminForm">
                        <s:param name="accion" value="'a'"/>
                        <s:param name="filtro" value="%{filtro}" />
                        <s:param name="fechaI" value="%{fechaI}" />
                        <s:param name="fechaF" value="%{fechaF}" />
                        <s:param name="eliminadas" value="%{eliminadas}" />
                        <s:param name="orden" value="%{orden}" />
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roId ASC") || orden.equals("roId DESC")){
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
                        <input type="hidden" name="orden" value="roId<%=completollamada[0]%>" />
                        <s:submit value="Id" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("clientela.clientelaDescripcion ASC") || orden.equals("clientela.clientelaDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="clientela.clientelaDescripcion<%=completollamada[1]%>" />
                        <s:submit value="Clientela" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("coleccion.coleccionDescripcion ASC") || orden.equals("coleccion.coleccionDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="coleccion.coleccionDescripcion<%=completollamada[2]%>" />
                        <s:submit value="Colección" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("color.colorDescripcion ASC") || orden.equals("color.colorDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="color.colorDescripcion<%=completollamada[3]%>" />
                        <s:submit value="Color" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("look.lookDescripcion ASC") || orden.equals("look.lookDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="look.lookDescripcion<%=completollamada[4]%>" />
                        <s:submit value="Look" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("marcas.marcaNombre ASC") || orden.equals("marcas.marcaNombre DESC")){
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
                        <input type="hidden" name="orden" value="marcas.marcaNombre<%=completollamada[5]%>" />
                        <s:submit value="Marca" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("tallas.tallaDescripcion ASC") || orden.equals("tallas.tallaDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="tallas.tallaDescripcion<%=completollamada[6]%>" />
                        <s:submit value="Talla" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roDescripcion ASC") || orden.equals("roDescripcion DESC")){
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
                        <input type="hidden" name="orden" value="roDescripcion<%=completollamada[7]%>" />
                        <s:submit value="Descripción" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roPrecio ASC") || orden.equals("roPrecio DESC")){
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
                        <input type="hidden" name="orden" value="roPrecio<%=completollamada[8]%>" />
                        <s:submit value="Precio" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roDescuento ASC") || orden.equals("roDescuento DESC")){
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
                        <input type="hidden" name="orden" value="roDescuento<%=completollamada[9]%>" />
                        <s:submit value="Descuento" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roCaracteristicas ASC") || orden.equals("roCaracteristicas DESC")){
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
                        <input type="hidden" name="orden" value="roCaracteristicas<%=completollamada[10]%>" />
                        <s:submit value="Características" />
                    </s:form>
                </th>
                <th>Visible</th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("roUnidades ASC") || orden.equals("roUnidades DESC")){
                                ascendente[11] = !ascendente[11];
                            }else{
                                ascendente[11] = true;
                            }
                            if(ascendente[11]){
                                completollamada[11] = " ASC";
                            }else{
                                
                                completollamada[11] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="roUnidades<%=completollamada[11]%>" />
                        <s:submit value="Unidades" />
                    </s:form>
                </th>
                <th>Fecha</th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("categoria.catDescripcion ASC") || orden.equals("categoria.catDescripcion DESC")){
                                ascendente[12] = !ascendente[12];
                            }else{
                                ascendente[12] = true;
                            }
                            if(ascendente[12]){
                                completollamada[12] = " ASC";
                            }else{
                                
                                completollamada[12] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="categoria.catDescripcion<%=completollamada[12]%>" />
                        <s:submit value="Categoría" />
                    </s:form>
                </th>
                <th>
                    <s:form action="RopaAdminFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaI" value="<%=fechaI%>" />
                        <input type="hidden" name="fechaF" value="<%=fechaF%>" />
                        <input type="hidden" name="eliminadas" value="<%=eliminadas%>" />
                        <%
                            if(orden.equals("subcategoria.subDescripcion ASC") || orden.equals("subcategoria.subDescripcion DESC")){
                                ascendente[13] = !ascendente[13];
                            }else{
                                ascendente[13] = true;
                            }
                            if(ascendente[13]){
                                completollamada[13] = " ASC";
                            }else{
                                
                                completollamada[13] = " DESC";
                            }
                        %>
                        <input type="hidden" name="orden" value="subcategoria.subDescripcion<%=completollamada[13]%>" />
                        <s:submit value="Subcategoría" />
                    </s:form>
                </th>
                <th>Fotos</th>
                <th>Acciones con fotos</th>
                <th>Campañas</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_ropa">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="RopaAdminForm">
                            <s:param name="clave" value="#a.roId"/>
                            <s:param name="accion" value="'m'"/>
                            <s:param name="filtro" value="%{filtro}" />
                            <s:param name="fechaI" value="%{fechaI}" />
                            <s:param name="fechaF" value="%{fechaF}" />
                            <s:param name="eliminadas" value="%{eliminadas}" />
                            <s:param name="orden" value="%{orden}" />
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        <s:a action="RopaAdminForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <s:param name="filtro" value="%{filtro}" />
                            <s:param name="fechaI" value="%{fechaI}" />
                            <s:param name="fechaF" value="%{fechaF}" />
                            <s:param name="eliminadas" value="%{eliminadas}" />
                            <s:param name="orden" value="%{orden}" />
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
                    <s:if test="%{#a.roVisible==1}">
                    <td class="puntoVerde">
                        <img src="../Imagenes/Administracion/True.svg"/>
                    </s:if>
                    <s:else>
                    <td class="puntoRojo">
                        <img src="../Imagenes/Administracion/False.svg"/>
                    </s:else>
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
                            <img src="<s:url value='../Imagenes/%{#a.categoria.catDescripcion}/%{#a.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" width="40" alt="<s:property value="fotosRuta" />" />
                        </s:iterator>
                    </td>
                    <td>
                        <s:a action="FotosForm">
                            <s:param name="roId2" value="#a.roId"/>
                            <s:param name="accionocul" value="'m'"/>
                            <s:param name="filtro" value="%{filtro}" />
                            <s:param name="fechaI" value="%{fechaI}" />
                            <s:param name="fechaF" value="%{fechaF}" />
                            <s:param name="eliminadas" value="%{eliminadas}" />
                            <s:param name="orden" value="%{orden}" />
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        <s:a action="FotosForm">
                            <s:param name="accionocul" value="'e'"/>
                            <s:param name="roId2" value="#a.roId"/>
                            <s:param name="filtro" value="%{filtro}" />
                            <s:param name="fechaI" value="%{fechaI}" />
                            <s:param name="fechaF" value="%{fechaF}" />
                            <s:param name="eliminadas" value="%{eliminadas}" />
                            <s:param name="orden" value="%{orden}" />
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>                        
                        <s:iterator var="r" value="campaniaRopas">
                            <s:a action="ModificarCampaniasRopa">
                                <s:property value="#r.campania.camNombre"/><br/>
                                <s:param name="accion" value="'m'"/>
                                <s:param name="camId" value="#r.campania.camId"/>
                            </s:a>
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

