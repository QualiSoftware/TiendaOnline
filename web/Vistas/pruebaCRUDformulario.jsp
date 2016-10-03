<%-- 
    Document   : pruebaCRUDformulario
    Created on : 01-oct-2016, 9:36:47
    Author     : LaPlaga
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <h1> <s:label name="cabeceraocul"></s:label> </h1>
        <s:form action="CrudActionLook" theme="simple">
            <s:textfield type="hidden" name="accionocul"/>
 <table>

                <tr>
                    <td>
                        <s:label for="codigo">Codigo</s:label>  
                        </td>
                        <td>
                        <s:textfield name="codigo2" readonly="true"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="nombre">Nombre</s:label>  
                        </td>
                        <td>
                        <s:textfield name="nombre2"/>
                    </td>
                </tr>
            <tr>
                <td colspan="2">
                   <input type="submit" value="<s:property value="botonocul" />"/>
                   <a href="volver">
                       volver
                   </a>
                </td>
            </tr>
        </table>
    </s:form>
    </body>
</html>
