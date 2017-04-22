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
        <!--JQuery-->
        <script src="../Scripts/jquery_3.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <!--Validaciones de usuario-->
        <script src="../Scripts/ValidacionUsuario.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#pais').change(function (event) {
                    usarAJAX();
                });
            });
            function validoModif(esAdmin){
                if(esAdmin != 1){
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
                }else{
                    verificarUsuario('a');
                }
            }
            function usarAJAX(valor) {
                var country = $("select#pais").val();
                $.getJSON('ajaxPaises', {
                    countryName: country
                }, function (jsonResponse) {
                    var select = $('#provincias2');
                    select.find('option').remove();
                    $.each(jsonResponse.stateMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(select);
                        $("#provincias2 option[value=" + valor + "]").attr("selected", true);
                    });
                });
            }
        </script>
        <title>
            <s:if test="clave != -1">
                Detalles de Usuario
            </s:if>
            <s:else>
                Alta de Usuario
            </s:else>
        </title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
        <div id="titulo_Pagina">
            <s:if test="clave != -1">
                Usuarios
            </s:if>
            <s:else>
                Alta de Administrador
            </s:else>
        </div>
        <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">
            <h3 class="bold">
                <s:if test="clave != -1">
                Detalles de <s:property value="usuNombre2"/> <s:property value="usuApellidos2"/>
                </s:if>
                <s:else>
                    Alta de usuario Administrador
                </s:else>
            </h3>
        </div>
        <div  class="linea"></div>
        <s:form id="frm" action="CrudActionUsuariosAdmin" theme="simple">
            <input type="hidden" name="clave" value="<s:property value="clave"/>" />
            <s:if test="clave != -1">
                <input type="hidden" name="accion" value="m" />
                <input type="hidden" name="modificaAdmin" value="modificaAdmin" />
            </s:if>
            <s:else>
                <input type="hidden" name="accion" id="accionocul" value="a" />
            </s:else>
        <table>
            <tr>
                <td colspan="2">
                    <span id="camposVacios"></span>
                </td>
            </tr>
            <s:if test="clave != -1">
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
            </s:if>
            <s:else>
                <td style="padding-top: 20px;">
                    <s:label for="usuNombre2">Nombre (*)</s:label>  
                    </td>
                    <td style="padding-top: 20px;">
                    <s:textfield name="usuNombre2" cssClass="formulario_Rellenar" id="usuNombre2"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td>
                    <s:label for="usuApellidos2">Apellidos (*)</s:label>  
                    </td>
                    <td>
                    <s:textfield name="usuApellidos2" cssClass="formulario_Rellenar" id="usuApellidos2" ></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuPassword2">Contraseña (*)</s:label>  
                    </td>
                    <td>
                        <s:password name="usuPassword2" cssClass="formulario_Rellenar" id="password1" ></s:password>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="passVerif">Repita la contraseña (*)</s:label>  
                    </td>
                    <td>
                        <s:password id="password2" cssClass="formulario_Rellenar"></s:password>
                    </td>
                </tr>                       
            </s:else>
            <tr>
                <td>
                    <s:label for="usuEmail2">E-mail</s:label>  
                </td>
                <td>
                <s:if test="clave != -1">
                        <s:textfield name="usuEmail2" readonly="true" ></s:textfield>
                </s:if>
                <s:else>
                    <s:textfield name="usuEmail2" id="usuEmail2"></s:textfield>
                </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuTelefono2">Teléfono</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuTelefono2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuTelefono2" id="usuTelefono2"></s:textfield>
                    </s:else>
                </td>
            </tr>
            <s:if test="clave != -1">
                <tr>
                    <td>
                        <s:label for="usuAlta">Fecha de alta</s:label>  
                    </td>
                    <td>
                        <s:textfield name="usuAlta" readonly="true" ></s:textfield>
                    </td>
                </tr>
            </s:if>
            <tr>
                <td>
                    <s:label for="usuDni2">DNI</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuDni2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuDni2"></s:textfield>
                    </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuFechaNac2">Fecha de nacimiento</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuFechaNac2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuFechaNac2" id="usuFechaNac2" cssClass="tcal formulario_rellenar_Fecha" cssStyle="padding-right: 10px; background-color: white;" readonly="true"/>
                    </s:else>
                </td>
            </tr>
            <s:if test="clave != -1">
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuActivo">Activo</s:label>
                    </td>
                    <td>
                        <% String selected = ""; %>
                        <s:if test="%{!usuActivo}">
                            <% selected = " selected='selected'";%>
                        </s:if>
                        <select name="usuActivo" class="formulario_Rellenar" style="width: 110px">
                            <option value="true">Si</option>
                            <option value="false"<%=selected%>>No</option>
                        </select>
                    </td>
                </tr>
            </s:if>
            <s:else>
                <tr>
                    <td>
                    <s:label for="usuSexo2">Sexo</s:label>
                    </td>
                    <td>
                    <select name="usuSexo2" class="formulario_Rellenar" style="width: 110px">
                        <option value="true">Mujer</option>
                        <option value="false">Hombre</option>
                    </select>
                </td>
            </tr>
            </s:else>
            <tr>
                <td>
                    <s:label for="countryName">País</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="countryName" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>                        
                        <s:select cssClass="formulario_Rellenar" cssStyle="width: 190px;" id="pais" name="countryName" list="listaPaises" listValue="paisNombre" 
                            listKey="paisId" value="usupais" onchange= "handleChange(this.value)" />
                    </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="provincias2">Provincia</s:label>  
                </td>
                <td>                    
                    <s:if test="clave != -1">
                        <s:textfield name="provincias2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:select id="provincias2" cssClass="formulario_Rellenar" name="provincias2" list="{'Seleccione Provincia'}" />
                        <script>usarAJAX(<s:property value="provincias2"></s:property>);</script>
                    </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuLocalidad2">Ciudad</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuLocalidad2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuLocalidad2" id="usuLocalidad2"></s:textfield>
                    </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuCp2">Código Postal</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuCp2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuCp2" id="usuCp2"></s:textfield>
                    </s:else>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDireccion2">Dirección</s:label>  
                </td>
                <td>
                    <s:if test="clave != -1">
                        <s:textfield name="usuDireccion2" readonly="true" ></s:textfield>
                    </s:if>
                    <s:else>
                        <s:textfield name="usuDireccion2" id="usuDireccion2"></s:textfield>
                    </s:else>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <s:if test="clave != -1">
                    <s:set var="esAdmin" value="0"/>
                </s:if>
                <s:else>
                    <s:set var="esAdmin" value="1"/>
                </s:else>
                    <input type="button" value="<s:property value="botonocul"/>" onclick="validoModif(<s:property value="#esAdmin"/>);"/>
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
