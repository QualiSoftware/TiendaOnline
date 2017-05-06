<%-- 
    Document   : formularioCRUDsubcategorias
    Created on : 18-oct-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <link href="../Estilos/estilosBorrado.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/utilidades.js" type="text/javascript"></script>
        <title><s:property value="cabeceraocul" /> de Subcategoría</title>
        <script src="../Scripts/ValidacionCampoRelleno.js" type="text/javascript"></script>
        <script>
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    document.getElementById('botonera').style.display = 'none';
                    document.getElementById('confirmacionEliminacion').style.display = 'block';
                } else {
                    if(CampoRelleno(document.getElementById('subDescripcion'),document.getElementById('errores'))){
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
            <div id="titulo_Pagina">Subcategorías</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Subcategoría</h3></div>
        <div  class="linea"></div>
        
        <s:form id="frm" action="CrudActionSubcategorias" theme="simple">
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
                        <s:label for="subId">Código</s:label>  
                        </td>
                        <td>
                        <s:textfield name="subId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="subDescripcion">Descripción (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="subDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="subDescripcion" id="subDescripcion" maxLength="100"></s:textfield>
                        </s:else>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="catDescripcion">Categoría</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="p.categoria.catDescripcion" readonly="true" ></s:textfield>
                            <input type="hidden" name="catId2" value=<s:property value="p.categoria.catId" /> />
                        </s:if>
                        <s:else>
                            <s:select name="catId2" list="lista_categoria" listValue="catDescripcion" 
                            listKey="catId" value="p.categoria.catId" />
                            <s:if test='%{accion == "m"}'>
                                    <input type="hidden" name="catId" value=<s:property value="p.categoria.catId" /> />
                            </s:if>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="botonera">
                        <s:if test='%{mensajeNoBorrar == "" || mensajeNoBorrar == null}'>                 
                            <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </s:if> 
                        <s:a action="volverSubcategorias">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
        <s:include value="formularioConfirmacionEliminacion.jsp" />
    </body>
</html>
