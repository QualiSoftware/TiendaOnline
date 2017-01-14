<%-- 
    Document   : tiendaCestaPopUp
    Created on : 12-ene-2017, 23:52:13
    Author     : Damian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function Volver(){
                document.getElementById('frm').action = "TiendaMenu";
                document.getElementById('frm').submit();                
            }
        </script>
    </head>
    <body>
        <h1>Color, Talla y Cantidad</h1>
        <br/>
        <table>
        <s:form id="frm" action="TiendaCesta" method="POST" theme="simple">
            <input type="hidden" name="clientela2" value="<s:property value="clientela2"/>"/>
            <input type="hidden" name="categoria2" value="<s:property value="categoria2"/>"/>
            <input type="hidden" name="marcas2" value="<s:property value="marcas2"/>"/>
            <input type="hidden" name="campania" value="<s:property value="campania"/>"/>
            <input type="hidden" name="accionocul" value="'c'"/>
            <input type="hidden" name="ropa" value="<s:property value="roId"/>"/>
            <tr>
                <td>
                    <s:select name="color" list="lista_colores" listValue="colorDescripcion" 
                        listKey="colorId"/>
                </td>
            </tr>
            <tr>
                <td>
                    <s:select name="talla" list="lista_tallas" listValue="tallaDescripcion" 
                              listKey="tallaId"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="number" name="cantidad" min="1" step="1" value="1">
                </td>
            </tr>
            <tr>
                <td>
                    <s:submit value="Agregar al carrito"/>
                    <input type="button" value="Cancelar" onclick="Volver();"/>
                </td>
            </tr>                
        </s:form>
        </table>
    </body>
</html>
