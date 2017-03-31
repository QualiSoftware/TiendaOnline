<%-- 
    Document   : formularioCRUDusuarios
    Created on : 26-dic-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <!--Calendario-->
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <script>
            function validoModif(){
                var descAux = document.getElementById("descuento").value;
                var desc = descAux.replace(",",".");
                if(isNaN(desc)){
                    document.getElementById("errorDescuento").innerHTML = "Debe ser un número válido";
                }else{
                    if(desc < 0){
                        document.getElementById("errorDescuento").innerHTML = "Debe ser un número positivo";                        
                    }else if(desc > 99.99){
                        document.getElementById("errorDescuento").innerHTML = "Máximo 99,99";
                    }else{
                        document.getElementById("descuento").value = desc;
                        document.getElementById("frm").submit();
                    }
                }
            }
        </script>
        <title>Detalles de Usuario</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
        <div id="titulo_Pagina">Usuarios</div>
        <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">
            <h3 class="bold">
                Detalles de <s:property value="usuNombre2"/> <s:property value="usuApellidos2"/>
            </h3>
        </div>
        <div  class="linea"></div>
        <s:form id="frm" action="CrudActionUsuariosAdmin" theme="simple">
        <input type="hidden" name="accion" value="m" />
        <input type="hidden" name="modificaAdmin" value="modificaAdmin" />
        <table>
            <tr>
                <td>
                        <s:label for="usuId2">Codigo</s:label>  
                </td>
                <td>
                    <s:textfield name="usuId2" readonly="true"></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuAdministrador">Registrado</s:label>  
                </td>
                <td>
                    <s:if test="usuAdministrador==0">Registrado</s:if>
                    <s:elseif test="usuAdministrador==1">Administrador</s:elseif>
                    <s:elseif test="usuAdministrador==2">No registrado</s:elseif>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuEmail2">E-mail</s:label>  
                </td>
                <td>
                    <s:textfield name="usuEmail2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuTelefono2">Teléfono</s:label>  
                </td>
                <td>
                    <s:textfield name="usuTelefono2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuAlta">Fecha de alta</s:label>  
                </td>
                <td>
                    <s:textfield name="usuAlta" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDni2">DNI</s:label>  
                </td>
                <td>
                    <s:textfield name="usuDni2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuFechaNac2">Fecha de nacimiento</s:label>  
                </td>
                <td>
                    <s:textfield name="usuFechaNac2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDescuento2">Descuento asignado</s:label>
                </td>
                <td>
                    <s:textfield name="usuDescuento2" id="descuento"></s:textfield>
                    <span id="errorDescuento"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuFechaLimiteDesc">Fecha límite<br/>del descuento</s:label>  
                </td>
                <td>
                    <s:textfield name="usuFechaLimiteDesc" id="usuFechaNac2" cssClass="tcal formulario_rellenar_Fecha" cssStyle="padding-right: 10px; background-color: white;" readonly="true"/>
                    <%--<s:textfield name="usuFechaLimiteDesc" readonly="true" ></s:textfield>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDireccion2">Dirección</s:label>  
                </td>
                <td>
                    <s:textfield name="usuDireccion2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuLocalidad2">Ciudad</s:label>  
                </td>
                <td>
                    <s:textfield name="usuLocalidad2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuCp2">Código Postal</s:label>  
                </td>
                <td>
                    <s:textfield name="usuCp2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="provincias2">Provincia</s:label>  
                </td>
                <td>
                    <s:textfield name="provincias2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="countryName">País</s:label>  
                </td>
                <td>
                    <s:textfield name="countryName" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="Modificar Descuento" onclick="validoModif();"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="UsuariosFiltro">
                        <i style="font-size: 20px;">Volver</i>
                    </s:a>     
                </td>
            </tr>
        </table>
        </s:form>
    </body>
</html>
