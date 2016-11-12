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
        <s:form action="CargaArchivo" method="post" enctype="multipart/form-data">
            <input type="hidden" name="roId2" value=<s:property value="t.roId" /> />
            <s:file name="archivo" label="Carga archivo 1"/>
            <s:file name="archivo" label="Carga archivo 2"/>
            <s:file name="archivo" label="Carga archivo 3"/>
            <s:submit value="Subir fotos" align="center"/>
        </s:form>
        <a href="volverRopaAdmin">
            No agregar fotos
        </a>
    </body>
</html>
