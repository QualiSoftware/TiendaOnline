<%-- 
    Document   : zzBorrar_SubirArchivos
    Created on : 10-nov-2016
    Author     : QualiSoftware
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int cantMaxFotos = 3;
    int nf = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Fotos</title>
        <script>
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
                        document.getElementById('frm').action = "EliminaArchivo";
                        document.getElementById('frm').submit();
                    }
                }
            }
        </script>
    </head>
    <body>
        <input type="hidden" id="accionocul" value=<s:property value="accionocul" /> />
        <label>Fotos de <s:property value="t.categoria.catDescripcion" />
            &nbsp;<s:property value="t.subcategoria.subDescripcion" /> 
            &nbsp;de&nbsp;<s:property value="t.clientela.clientelaDescripcion" />
            &nbsp;talla&nbsp;<s:property value="t.tallas.tallaDescripcion" />
            &nbsp;marca&nbsp;<s:property value="t.marcas.marcaNombre" />
            &nbsp;color&nbsp;<s:property value="t.color.colorDescripcion" />
        </label>
            <s:form action="CargaArchivo" id="frm" method="post" enctype="multipart/form-data" theme="simple">
                <input type="hidden" name="roId2" value=<s:property value="t.roId" /> />
                <input type="hidden" name="accionocul" value=<s:property value="accionocul" /> />
                <s:iterator var="f" value="t.fotoses">
                    <% nf++; %>
                    <img src="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" width="65" alt="<s:property value='%{#f.fotosRuta}' />" />
                    <s:if test='%{accionocul == "e"}'>
                        <input type="checkbox" name="elimino<%=nf%>" value="<s:property value='%{#f.fotosRuta}' />">
<!--Falta hacer modificar-->                        
                    </s:if>
                    <s:else>
                        <input type="hidden" name="elimino<%=nf%>" value="<s:property value='%{#f.fotosRuta}' />" />
                        <input type="file" name="archivo<%=nf%>"/>
                    </s:else>
                    <br>
                </s:iterator>
                <s:if test='%{accionocul == "e"}'>
                    <input type="button" onclick="Verificar();" value="Eliminar fotos seleccionadas" />
                </s:if>
                <s:else>
                    <%for(int i=nf;i<cantMaxFotos;i++){%>
                        Agregar Foto nueva <%=i+1%>: 
                        <input type="file" name="archivo<%=i+1%>"/>
                        <input type="hidden" name="borra<%=i+1%>" value="no borra" />
                        <br>
                    <%}%>
                <s:submit value="Subir cambios" align="center"/>
                </s:else>
            </s:form>
        <s:a action="RopaAdminFiltro">
            <s:param name="filtro" value="%{filtro}" />
            <s:param name="fechaI" value="%{fechaI}" />
            <s:param name="fechaF" value="%{fechaF}" />
            <s:param name="eliminadas" value="%{eliminadas}" />
            <s:param name="orden" value="%{orden}" />
            <i style="font-size: 20px" class="glyphicon glyphicon-share-alt">No hacer cambios en fotos</i>
        </s:a>
    </body>
</html>
