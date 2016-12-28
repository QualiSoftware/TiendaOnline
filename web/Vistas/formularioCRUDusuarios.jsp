<%-- 
    Document   : CRUDusuariosAltaModEliminar
    Created on : 29-nov-2016, 19:57:51
    Author     : javiermartinroncero
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <title><s:property value="cabeceraocul" /> de Clientela</title>
        <script src="../Scripts/jquery_3.js" type="text/javascript"></script>
        <script>
            
            $(document).ready(function() {
               $('#pais').change(function(event) {
                  usarAJAX();
                });
            });
            function usarAJAX (valor){
                var country = $("select#pais").val();
                $.getJSON('ajaxPaises', {
                    countryName : country
                    }, function(jsonResponse) { 
                    var select = $('#provincias2');
                    select.find('option').remove();
                    $.each(jsonResponse.stateMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select);
                    $("#provincias2 option[value="+ valor +"]").attr("selected",true);
                    });
              });
            };
            
            function Verificar(action) {
                if (action === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
                        document.getElementById('accionocul').value = action;
                        document.getElementById('frm').submit();
                    }
                } else {
                    document.getElementById('frm').submit();
                }
            }
        </script>
    </head>
    <body>

        <s:form id="frm" action="CrudActionUsuarios" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="usuId2" value=<s:property value="usuId2" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="usuNombre2">Nombre</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuNombre2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuNombre2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuApellidos2">Apellidos</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuApellidos2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuApellidos2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuEmail2">Email</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuEmail2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuEmail2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <s:if test='%{accion == "e"}'>
                </s:if>
                <s:else>
                <tr>
                    <td>
                        <s:label for="usuPassword2">Contraseña</s:label>  
                    </td>
                    <td>                        
                    <s:password name="usuPassword2" ></s:password>
                    </td>
                </tr>
                </s:else>
                <tr>
                    <td>
                        <s:label for="usuDni2">NIF/NIE</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuDni2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuDni2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>                    
                <s:if test='%{accion == "e"}'>
                </s:if>
                <s:else>
                    <tr>
                        <td>
                            <s:label for="usuSexo2">Sexo</s:label>
                        </td>
                        <td>
                            <% String selected = ""; %>
                            <s:if test="%{!usuSexo2}">
                                <% selected = " selected='selected'"; %>
                            </s:if>
                            <select name="usuSexo2">
                                <option value="true">Mujer</option>
                                <option value="false"<%=selected %>>Hombre</option>
                            </select>
                        </td>
                    </tr>                  
                </s:else>
                <tr>
                    <td>
                        <s:label for="usuDireccion2">Dirección</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuDireccion2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuDireccion2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuCp2">Código Postal</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuCp2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuCp2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuTelefono2">Teléfono</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuTelefono2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuTelefono2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuLocalidad2">Localidad</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuLocalidad2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuLocalidad2" ></s:textfield>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="usuFechaNac2">Fecha de nacimiento</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e"}'>
                            <s:textfield name="usuFechaNac2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="usuFechaNac2" id="usuFechaNac2" cssClass="tcal" readonly="true"/>
                        </s:else>
                    </td>
                </tr>
                <s:if test='%{accion == "e"}'>
                </s:if>
                <s:else>
                    <tr>
                        <td>
                            <s:label for="usupais">País</s:label>  
                        </td>
                        <td>                        
                            <s:select id="pais" name="usupais" list="listaPaises" listValue="paisNombre" 
                                      listKey="paisId" value="usupais" onchange= "handleChange(this.value)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label for="provincias2">Provincia</s:label>  
                        </td>
                        <td>
                            <s:select id="provincias2" name="provincias2" list="{'Seleccione Provincia'}" />
                            <script>usarAJAX(<s:property value="provincias2"></s:property>);</script>
                        </td>
                    </tr>
                </s:else>
                <tr>
                    <td colspan="2">
                    <s:if test='%{accion == "m" || accion == "a"}'>
                        <input type="button" onclick="Verificar('m');" value=<s:property value="botonocul" /> />
                    </s:if>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="Tienda">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>
                    </td>
                </tr>
            </table>
            <s:if test='%{accion == "m"}'>
                Si desea dar de baja su usuario puede presionar en el botón 
                 <input type="button" onclick="Verificar('e');" value="Eliminar" /> y sus datos de usuario serán
                  eliminados de nuestra base de datos.
            </s:if>
        </s:form>
    </body>
</html>