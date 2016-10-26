<%-- 
    Document   : formularioCRUDfacturas
    Created on : 17-oct-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:property value="cabeceraocul" /> de Facturas</title>
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
        <h1><s:property value="cabeceraocul" /> de Facturas</h1>
        <s:form id="frm" action="CrudActionFacturas" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="facId">Código</s:label>  
                        </td>
                        <td>
                        <s:textfield name="facCodigo" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="facRazonsocial">Razón Social</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facRazonsocial" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facRazonsocial" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facDireccion">Dirección</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facDireccion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facDireccion" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facPoblacion">Población</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facPoblacion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facPoblacion" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facProvincia">Provincia</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facProvincia" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facProvincia" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facCp">Código Postal</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facCp" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facCp" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facPais">País</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facPais" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facPais" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facDni">NIF / CIF</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facDni" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facDni" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facDescuento">Descuento</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facDescuento" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facDescuento" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facFecha">Fecha y Hora</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facFecha" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facFecha" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facIva">IVA</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facIva" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facIva" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                </tr>
                    <tr>
                        <td>
                        <s:label for="facObservaciones">Observaciones</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="facObservaciones" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="facObservaciones" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverFacturas">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
