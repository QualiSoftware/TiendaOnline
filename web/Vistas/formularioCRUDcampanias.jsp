<%-- 
    Document   : formularioCRUDcampanias
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
        <s:include value="cabeceraHeader.jsp" />
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Categorías</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
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
                            <s:textfield name="c.marcas.marcaNombre" readonly="true" ></s:textfield>
                            <input type="hidden" name="marcaId" value=<s:property value="c.marcas.marcaId" /> />
                        </s:if>
                        <s:else>
                            <s:select name="marcaId" list="lista_marcas" listValue="marcaNombre" 
                            listKey="marcaId" value="c.marcas.marcaId" />
                            <s:if test='%{accion == "m"}'>
                                <input type="hidden" name="clave" value=<s:property value="c.marcas.marcaId" /> />
                            </s:if>
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
