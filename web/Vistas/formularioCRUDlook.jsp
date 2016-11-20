<%-- 
    Document   : formularioCRUDlook
    Created on : 20-oct-2016
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
        <title><s:property value="cabeceraocul" /> de Look</title>
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
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Look</h3></div>
        <div  class="linea"></div>                   
        
        <s:form id="frm" action="CrudActionLook" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="lookId">Codigo</s:label>  
                        </td>
                        <td>
                        <s:textfield name="lookId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="lookDescripcion">Descripción</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="lookDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="lookDescripcion" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverLook">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
