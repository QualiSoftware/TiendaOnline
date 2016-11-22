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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
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
    <body style="margin: 0 auto;">
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="login">
                <s:a action="Usuario/RopaFiltro" cssStyle="padding: 5px 13px;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Volver a Tienda</s:a>
                </div>
                <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
                </div>
                <div id="titulo_Pagina">Fotos</div>
            <s:include value="menuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold">Fotos</h3></div>
        <div  class="linea"></div>
        <input type="hidden" id="accionocul" value=<s:property value="accionocul" /> />
        <div class="formulario_Fotos" >
            <label style="font-size: 20px;"><span style="font-weight: normal">Fotos de:</span> <s:property value="t.categoria.catDescripcion" />
                &nbsp;<s:property value="t.subcategoria.subDescripcion" /> 
                &nbsp;<span style="font-weight: normal">de</span>&nbsp;<s:property value="t.clientela.clientelaDescripcion" />
                &nbsp;- <span style="font-weight: normal">talla</span>&nbsp;<s:property value="t.tallas.tallaDescripcion" />
                &nbsp;- <span style="font-weight: normal">marca</span>&nbsp;<s:property value="t.marcas.marcaNombre" />
                &nbsp;- <span style="font-weight: normal">color</span>&nbsp;<s:property value="t.color.colorDescripcion" />
            </label><p></p>
            <div id="sel_Archivos">
                <s:form action="CargaArchivo" id="frm" method="post" enctype="multipart/form-data" theme="simple">
                    <input type="hidden" name="roId2" value=<s:property value="t.roId" /> />
                    <input type="hidden" name="accionocul" value=<s:property value="accionocul" /> />
                    <s:iterator var="f" value="t.fotoses">
                        <% nf++;%>
                        <img src="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" width="65" alt="<s:property value='%{#f.fotosRuta}' />" />
                        <s:if test='%{accionocul == "e"}'>
                            <input type="checkbox" name="elimino<%=nf%>" value="<s:property value='%{#f.fotosRuta}' />">
                        </s:if>
                        <s:else>
                            <input type="hidden" name="elimino<%=nf%>" value="<s:property value='%{#f.fotosRuta}' />" />
                            <input type="file" name="archivo<%=nf%>"/>
                        </s:else>
                        <br>
                    </s:iterator>
                    <s:if test='%{accionocul == "e"}'>
                    </s:if>
                    <s:else>
                        <%for (int i = nf; i < cantMaxFotos; i++) {%>
                        <hr style="width: 350px; margin-right: 4000px;">
                        Agregar Foto nueva <%=i + 1%>: 
                        <input type="file" name="archivo<%=i + 1%>"/>
                        <input type="hidden" name="borra<%=i + 1%>" value="no borra" />
                        <%}%>
                        <hr style="width: 350px; margin-right: 4000px;">
                    </s:else>
                    <s:submit value="Subir cambios" align="center"/>
                </s:form>
                <s:a action="RopaAdminFiltro">
                    <s:param name="filtro" value="%{filtro}" />
                    <s:param name="fechaI" value="%{fechaI}" />
                    <s:param name="fechaF" value="%{fechaF}" />
                    <s:param name="eliminadas" value="%{eliminadas}" />
                    <s:param name="orden" value="%{orden}" />
                    <p></p><br>
                        <i style="font-size: 20px" class="glyphicon glyphicon-share-alt"> No hacer cambios en fotos</i>
                </s:a>
            </div>
        </div>
    </body>
</html>
