<%-- 
    Document   : formularioCRUDcolor
    Created on : 20-oct-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title><s:property value="cabeceraocul" /> de Color</title>
        <script src="../Scripts/ValidacionCampoRelleno.js" type="text/javascript"></script>
        <script>
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
                        document.getElementById('frm').submit();
                    }
                } else {
                    if(CampoRelleno(document.getElementById('colorDescripcion'),document.getElementById('errores'))){
                        document.getElementById('frm').submit();
                    }
                }
            }
        </script>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Colores</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Color</h3></div>
        <div  class="linea"></div>
        
        <s:form id="frm" action="CrudActionColor" theme="simple" method="post" enctype="multipart/form-data">
            <input type="hidden" name="accion" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="clave" value=<s:property value="clave" /> />
            <table>
                <tr>
                    <td colspan="2">
                        <pre><span id="errores"></span><s:property value="mensajeNoBorrar"/></pre>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="colorId">Código</s:label>  
                        </td>
                        <td>
                        <s:textfield name="colorId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="colorDescripcion">Descripción (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="colorDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="colorDescripcion" id="colorDescripcion" maxLength="30"></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="colorFoto">Foto</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <input type="hidden" name="colorFoto" value="<s:property value="colorFoto" />" />
                            <img src="../Imagenes/Colores/<s:property value="colorFoto"/>" height="70" alt="<s:property value="colorFoto"/>"/>
                        </s:if>
                        <s:elseif test='%{accion == "a"}'>
                            <input type="file" name="archivoColor"/>
                        </s:elseif>
                        <s:else>
                            <input type="hidden" name="colorFoto" value="<s:property value="colorFoto" />" />
                            <img src="../Imagenes/Colores/<s:property value="colorFoto"/>" height="70" alt="<s:property value="colorFoto"/>"/>
                            <input type="file" name="archivoColor"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <s:if test='%{mensajeNoBorrar == "" || mensajeNoBorrar == null}'>
                            <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </s:if>
                        <s:a action="volverColor">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
