<%-- 
    Document   : activacion.jsp
    Created on : 09-dic-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Validación usuarios-->
        <script src="../Scripts/ValidacionUsuario.js" type="text/javascript"></script>        
        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script> 
        <title>Activación exitosa</title>
    </head>
    <body>
        <s:include value="cargarCookie.jsp" />
        <h1>Felicitaciones <s:property value="accion" />, su cuenta ha sido activada!</h1>
        <br/>
        <h2>Acceda a la Tienda</h2>
        <s:form id="frmLogin" action="TiendaLogin" theme="simple">
            <input type="hidden" name="actionName" value="Tienda.action"/>
            <table>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <s:textfield id="usuPassword2" name="usuario" value="%{usuEmail2}"/>
                    </td>
                    <td>
                        <s:fielderror fieldName="usuario" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contraseña
                    </td>
                    <td>
                        <s:password id="passVerif" name="password" />
                    </td>
                    <td>
                        <s:fielderror fieldName="password" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <input type="button" onclick="usuarioLogin();" value="Acceder" />                    
                    </td>
                </tr>
                <tr id="login" style="display: none;">
                    <td colspan="2">
                        Usuario y/o contraseña erróneo
                    </td>
                </tr>
            </table>
        </s:form>
        <br/>
        <br/>
        <h3>O continúe navegando sin sesión mediante este enlace</h3>
        <s:a action="Tienda" >Tienda Ropa</s:a>
    </body>
</html>
