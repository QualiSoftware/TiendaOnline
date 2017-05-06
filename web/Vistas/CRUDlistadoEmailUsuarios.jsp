<%-- 
    Document   : CRUDlistadoEmailUsuarios.jsp
    Created on : 17-abr-2017
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <script src="../Scripts/utilidades.js" type="text/javascript"></script>
        <title>Opciones publicidad</title>
        <script>
            function comprobar(){
                var dias = document.getElementById('dias').value;
                var valor = document.getElementById('valor').value;
                var periodo = document.getElementById('periodo').value;
                if(isNaN(dias) || isNaN(valor) || isNaN(periodo) || tienePunto(dias) || tienePunto(valor) || tienePunto(periodo)){
                    document.getElementById('mensajeError').innerHTML = "Los valores deben ser números enteros";
                } else {
                    document.getElementById('frm').submit();
                }
            }
            function tienePunto(cadena){
                var test = cadena.indexOf(".");
                if(test === -1){
                    return false;
                } else {
                    return true;
                }
            }
            function verificar(){
                checkboxes=document.getElementsByTagName('input'); //obtenemos todos los controles del tipo Input
                var j = 0;
                for(i=0;i<checkboxes.length;i++){ //recoremos todos los controles
                    if(checkboxes[i].type == "checkbox"){ //solo si es un checkbox entramos
                        if(checkboxes[i].checked && checkboxes[i].id != 'todos'){
                            j++;
                        }
                    }
                }
                if(j > 0){
                    document.getElementById('frmCheckbox').submit();
                } else {
                    alert("no se envía el email");
                }
            }
        </script>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Opciones publicidad</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">
            Aquí puede <span class="bold">configurar </span>las opciones para el envío de publicidad.
        </div>
        <div  class="linea"></div>
        <center>
            <input type="checkbox" id="todos" onclick="marcarDesmarcarCheckbox(this);" checked/> Marcar/Desmarcar Todos
            <br/><br/>
            <s:form id="frmCheckbox" action="abrirEmail" method="POST" theme="simple">
                <div id="" style="overflow:auto; height:100px; width: 300px; text-align: left;">
                    <s:iterator var="a" value="lista_usuarios">
                            <input type="checkbox" name="checkboxNombre" value="<s:property value="#a.usuEmail"/>" checked/>
                            &nbsp;&nbsp
                        <s:property value="#a.usuEmail"/><br/>
                    </s:iterator>
                </div>
                <input type="button" onclick="verificar();" value="Generar email" />
            </s:form>
            <br/><br/>
            <table style="margin-bottom: 50px; margin-top: 0px;">
                <s:form id="frm" action="listadoEmailUsuarios" method="POST" theme="simple">
                    <tr>
                        <td>Porcentaje de descuento a enviar a los apadrinados </td>
                        <td><s:textfield name="valor" id="valor" value="%{valor}" maxLength="2"/></td>
                    </tr>
                    <tr>
                        <td>Días que dura el descuento a enviar a los apadrinados </td>
                        <td><s:textfield name="dias" id="dias" value="%{dias}" maxLength="3"/></td>
                    </tr>
                    <tr>
                        <td>Días necesarios de antigüedad para poder apadrinar </td>
                        <td><s:textfield name="periodo" id="periodo" value="%{periodo}" maxLength="3"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="Modificar" onclick="comprobar();"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="mensajeError"><s:property value="mensajeConfirmacion"/></div>
                        </td>
                    </tr>
                </s:form>
            </table>
        </center>
    </body>
</html>