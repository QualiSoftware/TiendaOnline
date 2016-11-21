<%-- 
    Document   : formularioCRUDcamanias
    Created on : 20-nov-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title><s:property value="cabeceraocul" /> de Campaña</title>
        <script>
            function Verificar() {
                if (document.getElementById('accion').value === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
                        document.getElementById('frm').submit();
                    }
                } else {
                    document.getElementById('frm').submit();
                }
            }
        </script>
    </head>
    <body>
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="login">
                <s:a action="Usuario/RopaFiltro" cssStyle="padding: 5px 13px;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Volver a Tienda</s:a>
                </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Categorías</div>
                <s:include value="menuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Campañas</h3></div>
        <div  class="linea"></div>   
        
        <s:form id="frm" action="CrudActionCampanias" theme="simple" method="post" enctype="multipart/form-data">
            <input type="hidden" name="accion" id="accion" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="camId">Codigo</s:label>  
                    </td>
                    <td>
                        <s:textfield name="camId" readonly="true"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="camMarca">Marca</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="camMarca" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="camMarca" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="camNombre">Nombre de campaña</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="camNombre" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="camNombre" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="camInicio">Fecha de inicio</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="camInicio" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="camInicio" id="camInicio" cssClass="tcal" readonly="true"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="camFin">Fecha de fin</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="camFin" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="camFin" id="camFin" cssClass="tcal" readonly="true"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="camFoto">Foto</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <input type="hidden" name="camFoto" value="<s:property value="camFoto" />" />
                            <img src="../Imagenes/Campanias/<s:property value="camFoto"/>" height="70" alt="<s:property value="camFoto"/>"/>
                        </s:if>
                        <s:elseif test='%{accion == "a"}'>
                            <input type="file" name="archivo"/>
                        </s:elseif>
                        <s:else>
                            <input type="hidden" name="camFoto" value="<s:property value="camFoto" />" />
                            <img src="../Imagenes/Campanias/<s:property value="camFoto"/>" height="70" alt="<s:property value="camFoto"/>"/>
                            <input type="file" name="archivo"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverCampanias">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
