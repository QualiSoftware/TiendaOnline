<%-- 
    Document   : formularioCRUDcoleccion
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
        <script src="../Scripts/utilidades.js" type="text/javascript"></script>
        <link href="../Estilos/estilosBorrado.css" rel="stylesheet" type="text/css"/>
        <title><s:property value="cabeceraocul" /> de Colección</title>
        <script src="../Scripts/ValidacionCampoRelleno.js" type="text/javascript"></script>
        <script>
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    document.getElementById('botonera').style.display = 'none';
                    document.getElementById('confirmacionEliminacion').style.display = 'block';
                } else {
                    if(CampoRelleno(document.getElementById('coleccionDescripcion'),document.getElementById('errores'))){
                        document.getElementById('frm').submit();
                    }
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
            <div id="titulo_Pagina">Colecciones</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de Colección</h3></div>
        <div  class="linea"></div>   
        
        
        <s:form id="frm" action="CrudActionColeccion" theme="simple">
            <input type="hidden" name="accion" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="clave" value=<s:property value="clave" /> />
            <table>
                <tr>
                    <td colspan="2">
                        <pre><span id="errores"></span><s:property value="mensajeNoBorrar"/></pre>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="coleccionId">Código</s:label>  
                        </td>
                        <td>
                        <s:textfield name="coleccionId" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="coleccionDescripcion">Descripción (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="coleccionDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="coleccionDescripcion" id="coleccionDescripcion" maxLength="20"></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="botonera">
                        <s:if test='%{mensajeNoBorrar == "" || mensajeNoBorrar == null}'>
                            <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </s:if>
                        <s:a action="volverColeccion">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
        <s:include value="formularioConfirmacionEliminacion.jsp" />
    </body>
</html>
