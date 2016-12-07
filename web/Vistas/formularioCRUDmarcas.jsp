<%-- 
    Document   : formularioCRUDmarcas
    Created on : 17-oct-2016
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
        <title><s:property value="cabeceraocul" /> de Marcas</title>
        <script>
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
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
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Marcas</h3></div>
        <div  class="linea"></div>
        
        <s:form id="frm" action="CrudActionMarcas" theme="simple" method="post" enctype="multipart/form-data">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="marcaId">Codigo</s:label>  
                        </td>
                        <td>
                        <s:textfield name="marcaId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="marcaNombre">Descripción</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="marcaNombre" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="marcaNombre" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="marcaFoto">Foto</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <input type="hidden" name="marcaFoto" value="<s:property value="marcaFoto" />" />
                            <img src="../Imagenes/Marcas/<s:property value="marcaFoto"/>" height="70" alt="<s:property value="marcaFoto"/>"/>
                        </s:if>
                        <s:elseif test='%{accion == "a"}'>
                            <input type="file" name="archivoMarca"/>
                        </s:elseif>
                        <s:else>
                            <input type="hidden" name="marcaFoto" value="<s:property value="marcaFoto" />" />
                            <img src="../Imagenes/Marcas/<s:property value="marcaFoto"/>" height="70" alt="<s:property value="marcaFoto"/>"/>
                            <input type="file" name="archivoMarca"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverMarcas">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
