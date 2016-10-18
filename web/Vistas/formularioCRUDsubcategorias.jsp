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
        <title><s:property value="cabeceraocul" /> de Subcategorías</title>
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
        <h1><s:property value="cabeceraocul" /> de Subcategorías</h1>
        <s:form id="frm" action="CrudActionSubcategorias" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="subId">Codigo</s:label>  
                        </td>
                        <td>
                        <s:textfield name="subId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="subDescripcion">Descripción</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="subDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="subDescripcion" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                    <tr>
                        <td>
                        <s:label for="catDescripcion">Categoría</s:label>  
                        </td>
                        <td>
                        <%
                        if (request.getAttribute("accionocul") == "e") {
                        %>
                            <s:textfield name="p.categoria.catDescripcion" readonly="true" ></s:textfield>
                            <input type="hidden" name="catId2" value=<s:property value="p.categoria.catId" /> />
                        <%
                        } else {
                        %>
                            <s:select name="catId2" list="lista_categoria" listValue="catDescripcion" 
                            listKey="catId" value="p.categoria.catId" />
                        <%
                            if (request.getAttribute("accionocul") == "m") {
                        %>
                                <input type="hidden" name="clave" value=<s:property value="p.categoria.catId" /> />
                        <%
                            }
                        }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:a action="volverSubcategorias">
                            <i style="font-size: 20px;" class="glyphicon glyphicon-circle-arrow-left"></i>
                        </s:a>                   
                    </td>
                    <td>
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
