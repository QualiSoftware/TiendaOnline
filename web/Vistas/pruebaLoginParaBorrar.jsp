<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <s:form action="LoginPrueba" theme="simple">
        <table>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <s:textfield name="usuario" />
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
                    <s:submit />                    
                </td>
            </tr>
        </table>
    </s:form>
    <s:property value="mensajeError" />
    </body>
</html>
