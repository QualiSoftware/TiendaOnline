<%-- 
    Document   : pruebaCRUDtallasCambios.jsp
    Created on : 01-oct-2016
    Author     : Damián Usheff Vellianitis
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a = request.getParameter("accion");
    boolean modificacion, eliminacion;
    if(a.equals("m")){
        modificacion=true;
    }else{
        modificacion=false;
    }
    if(a.equals("e")){
        eliminacion=true;
    }else{
        eliminacion=false;
    }
    String bloqueado = " readonly='readonly'";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title><s:property value="titulo" /></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script>
            function Verificar(){
                if(document.getElementById('accion').value === 'e'){
                    if(confirm("¿Seguro que desea borrar?")){
                        document.getElementById('frm').submit();
                    }
                }else{
                    document.getElementById('frm').submit();
                }
            }
        </script>
    </head>
    <body>
    <center>
        <h1><s:property value="titulo" /> de talla</h1>
      
        <s:form action="CrudActionTallas" theme="simple" id="frm">
            <input type="hidden" name="accion" id="accion" value=<s:property value="accion" /> />
            <input type="hidden" name="titulo" value=<s:property value="titulo" /> />
            <input type="hidden" name="boton" value=<s:property value="boton" /> />
            <table class="table">
                <tr>                       
                    <td>
                        <s:label for="tallaId">ID</s:label>
                    </td>
                    <td>
                        <%if(eliminacion || modificacion){%>
                        <input type="text" name="tallaId" 
                               value="<s:property value="tallaId" />" <%=bloqueado%> />
                        <%}else{out.println("Se asigna automáticamente");}%>
                    </td>
                    <td></td>
                </tr><tr>
                    <td>
                        <s:label for="tallaDescripcion">Descripción</s:label>
                    </td>
                    <td>
                        <input type="text" name="tallaDescripcion" value="<s:property value="tallaDescripcion" />"
                               <%if(eliminacion){out.print(bloqueado);}%> />
                    </td>
                    <td>
                        <s:fielderror fieldName="tallaDescripcion" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <s:a action="TallasFiltro">
                            <i style="font-size: 20px;" class="glyphicon glyphicon-arrow-left">Volver</i>
                        </s:a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" onclick="Verificar();" value=<s:property value="boton" /> />
                    </td>
                    <td></td>
                </tr>
            </table>
        </s:form>
    </center>
    </body>
</html>
