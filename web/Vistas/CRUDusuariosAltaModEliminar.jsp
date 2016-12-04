<%-- 
    Document   : CRUDusuariosAltaModEliminar
    Created on : 29-nov-2016, 19:57:51
    Author     : javiermartinroncero
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title><s:property value="cabeceraocul" /> de Clientela</title>
        <script>
            
            $(document).ready(function() {
               $('#pais').change(function(event) {
                  usarAJAX();
                });
            });
            function usarAJAX (valor){
                alert("pasa");
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
            
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
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
                        <s:label for="usuNombre2">Nombre</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuNombre2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuNombre2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuApellidos2">Apellidos</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuApellidos2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuApellidos2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuEmail2">Email</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuEmail2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuEmail2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuPassword2">Password</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuPassword2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuPassword2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuDni2">D.N.I</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuDni2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuDni2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuDireccion2">Direccion</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuDireccion2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuDireccion2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuCp2">C.P</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuCp2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuCp2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usuTelefono2">Telefono</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuTelefono2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuTelefono2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                 <tr>
                        <td>
                        <s:label for="usuLocalidad2">Localidad</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuLocalidad2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuLocalidad2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                  <tr>
                        <td>
                        <s:label for="usuFechaNac2">Fecha</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usuFechaNac2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="usuFechaNac2" ></s:textfield>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="usupais">Pais</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="usupais" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select id="pais" name="usupais" list="listaPaises" listValue="paisNombre" 
                                      listKey="paisId" value="usupais" onchange= "handleChange(this.value)" />
                        
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                        <td>
                        <s:label for="provincias2">Provincia</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="provincias2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                         <s:select id="provincias2" name="provincias2" list="{'Seleccione Provincia'}" />
                            <script>usarAJAX(<s:property value="provincias2"></s:property>);</script>
                
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverRopaU">
                            <i style="font-size: 20px;">Volver</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>

