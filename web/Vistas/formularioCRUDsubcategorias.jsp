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
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Subcategorías</h3></div>
        <div  class="linea"></div>
        
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
                    <td colspan="2">                        
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverSubcategorias">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
