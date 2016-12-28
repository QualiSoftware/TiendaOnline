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
        <title>Activación exitosa</title>
    </head>
    <body>
        <h1>Felicitaciones <s:property value="accion" />, su cuenta ha sido activada!</h1>
        <br/>
        <h2>Acceda a la Tienda</h2>
        <s:form action="TiendaLogin" theme="simple">
            <table>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <s:textfield name="usuario" value="%{usuEmail2}"/>
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
                        <s:password name="password" />
                    </td>
                    <td>
                        <s:fielderror fieldName="password" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <s:submit  value="login"/>                    
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
