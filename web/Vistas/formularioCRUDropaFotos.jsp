<%-- 
    Document   : zzBorrar_SubirArchivos
    Created on : 10-nov-2016
    Author     : QualiSoftware
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Fotos</title>
    </head>
    <body>
        <label>Fotos de <s:property value="t.categoria.catDescripcion" />
            &nbsp;<s:property value="t.subcategoria.subDescripcion" /> 
            &nbsp;de&nbsp;<s:property value="t.clientela.clientelaDescripcion" />
            &nbsp;talla&nbsp;<s:property value="t.tallas.tallaDescripcion" />
            &nbsp;marca&nbsp;<s:property value="t.marcas.marcaNombre" />
            &nbsp;color&nbsp;<s:property value="t.color.colorDescripcion" />
        </label>
        <br>&nbsp;accionocul&nbsp;<s:property value="accionocul" />
        <s:if test="%{#accionocul == a}">
            <s:form action="CargaArchivo" method="post" enctype="multipart/form-data">
                <input type="hidden" name="roId2" value=<s:property value="t.roId" /> />
                <s:file name="archivo" label="Carga archivo 1"/>
                <s:file name="archivo" label="Carga archivo 2"/>
                <s:file name="archivo" label="Carga archivo 3"/>
                <s:submit value="Subir fotos" align="center"/>
            </s:form>
        </s:if>
        <s:else>
            No entró... (no funciona este IF, nunca entro en el else) 
        </s:else>
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
