<%-- 
    Document   : CRUDusuariosAltaModEliminar
    Created on : 29-nov-2016, 19:57:51
    Author     : javiermartinroncero
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Cambio de contraseña</title>
        <script>
            function Verificar() {
                
                if (document.getElementById('nueva1').value === document.getElementById('nueva2').value) {
                    if (confirm("¿Seguro que desea cambiar la contraseña?")) {
                        document.getElementById('frm').submit();
                    }
                } else {
                    alert("La contraseña nueva no es igual a la contraseña nueva repetida")
                }
            }
        </script>
    </head>
    <body>
        <s:form id="frm" action="CambiaContrasenia" theme="simple">
            <input type="hidden" name="accion" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="clave" value=<s:property value="clave" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="antigua">Antigua contraseña</s:label>  
                    </td>
                    <td>                        
                    <s:password name="antigua" ></s:password>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="nueva1">Nueva contraseña</s:label>  
                    </td>
                    <td>                        
                        <s:password name="usuPassword2" id="nueva1"></s:password>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="nueva2">Repita nueva contraseña</s:label>  
                    </td>
                    <td>                        
                        <s:password name="nueva2" id="nueva2"></s:password>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <s:property value="dummyMsg"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value="Cambiar" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="UsuAlta">
                            <s:param name="accion" value="accion"/>
                            <s:param name="clave" value="clave"/>
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>