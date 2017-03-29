<%-- 
    Document   : CRUDcampanias.jsp
    Created on : 20-nov-2016
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String orden = "";
    String filtro;
    String fechaCampania = "";
    boolean[] ascendente = new boolean[4];
    String[] completollamada = new String[4];
%>                         
<!DOCTYPE html>
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <script>            
            function BorrarFecha() {
                document.getElementById('fechaCampania').value = "";
            }
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Campañas</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Campañas</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las campañas.</div>
        <div  class="linea"></div>
        <table border="1">
            <tr>
                <td colspan="8">
                <s:form action="CampaniasFiltro" theme="simple" style="display:inline;">
                    <s:label value="Fecha con campaña activa " />
                    <s:textfield name="fechaCampania" id="fechaCampania" cssClass="tcal" readonly="true"/>
                    <%
                        if((request.getParameter("fechaCampania") != null)){
                            if(!(request.getParameter("fechaCampania").equals(""))){
                                %>
                                <input type="button" value="Borrar fecha" onclick="BorrarFecha();">
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
                            if(request.getParameter("fechaCampania") != null){
                                fechaCampania = request.getParameter("fechaCampania");
                            }
                        %>
                        <input type="hidden" name="orden" value="<%=orden%>" />  
                </s:form>                          
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="CampaniasForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>
                    <s:form action="CampaniasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaCampania" value="<%=fechaCampania%>" />
                        <%
                            if(orden.equals("camMarca ASC") || orden.equals("camMarca DESC")){
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
                        <input type="hidden" name="orden" value="camMarca<%=completollamada[0]%>" />
                        <s:submit value="Marca" />
                    </s:form>
                </th>
                <th>
                    <s:form action="CampaniasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaCampania" value="<%=fechaCampania%>" />
                        <%
                            if(orden.equals("camNombre ASC") || orden.equals("camNombre DESC")){
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
                        <input type="hidden" name="orden" value="camNombre<%=completollamada[1]%>" />
                        <s:submit value="Nombre campaña" />
                    </s:form>
                </th>
                <th>Descuento</th>
                <th>
                    <s:form action="CampaniasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaCampania" value="<%=fechaCampania%>" />
                        <%
                            if(orden.equals("camInicio ASC") || orden.equals("camInicio DESC")){
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
                        <input type="hidden" name="orden" value="camInicio<%=completollamada[2]%>" />
                        <s:submit value="Inicio" />
                    </s:form>
                </th>
                <th>
                    <s:form action="CampaniasFiltro" method="post" theme="simple">
                        <input type="hidden" name="filtro" value="<%=filtro%>" />
                        <input type="hidden" name="fechaCampania" value="<%=fechaCampania%>" />
                        <%
                            if(orden.equals("camFin ASC") || orden.equals("camFin DESC")){
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
                        <input type="hidden" name="orden" value="camFin<%=completollamada[3]%>" />
                        <s:submit value="Fin" />
                    </s:form>
                </th>
                <th>Foto</th>
                <th>Ropa asignada</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_campanias">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="CampaniasForm">
                            <s:param name="clave" value="#a.camId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="CampaniasForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.camId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.marcas.marcaNombre"/>
                    </td>
                    <td>
                        <s:property value="#a.camNombre"/>
                    </td>
                    <td>
                        <s:property value="#a.camDescuento"/>
                    </td>
                    <td>
                        <s:date name="#a.camInicio" format="dd/MM/yyyy"/>
                    </td>
                    <td>
                        <s:date name="#a.camFin" format="dd/MM/yyyy"/>
                    </td>
                    <td>
                        <img src="../Imagenes/Campanias/<s:property value="#a.camFoto"/>" height="70" alt="<s:property value="#a.camFoto"/>"/>
                    </td>
                    <td>
                        <s:a action="ModificarCampaniasRopa">
                            <s:param name="camId" value="#a.camId"/>
                            <s:param name="accion" value="'m'"/>
                            Modificar ropa<br/>asignada a campaña
                        </s:a>
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