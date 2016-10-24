<%-- 
    Document   : formularioCRUDropa
    Created on : 17-oct-2016
    Author     : QualiSoftware
--%>

<%@taglib prefix="s" uri="/struts-tags" %>

<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        <script src="../Scripts/jquery_3.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
               $('#categoria').change(function(event) {
                  usarAJAX();
                });
            });
        </script>
        <script>
            function usarAJAX (){
                var country = $("select#categoria").val();
                $.getJSON('ajaxAction', {
                    countryName : country
                    }, function(jsonResponse) {
                    var select = $('#subcategoria2');
                    select.find('option').remove();
                    $.each(jsonResponse.stateMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select);
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
        <h1> <s:label name="cabeceraocul"></s:label> </h1>
        <s:form id="frm" action="CrudActionRopaAdmin" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="roId2">Código</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roId2" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="clientela2">Clientela</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e" || request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.clientela.clientelaDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="clientela2" list="lista_clientela" listValue="clientelaDescripcion" 
                                  listKey="clientelaId" value="t.clientela.clientelaId"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="coleccion2">Colección</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e" || request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.coleccion.coleccionDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="coleccion2" list="lista_colecciones" listValue="coleccionDescripcion" 
                                  listKey="coleccionId" value="t.coleccion.coleccionId"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="color2">Color</s:label>  
                        </td>

                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.color.colorDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="color2" list="lista_colores" listValue="colorDescripcion" 
                                  listKey="colorId" value="t.color.colorId"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="look2">Look</s:label>  
                        </td>

                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.look.lookDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="look2" list="lista_look" listValue="lookDescripcion" 
                                  listKey="lookId" value="t.look.lookId"/>
                        <%
                            }
                        %>

                    </td>
                </tr>
                <tr>

                    <td>
                        <s:label for="marcas2">Marca</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.marcas.marcaNombre" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="marcas2" list="lista_marca" listValue="marcaNombre" 
                                  listKey="marcaId" value="t.marcas.marcaId"/>
                        <%
                            }
                        %>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="tallas2">Talla</s:label>  
                        </td>

                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="t.tallas.tallaDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:select name="tallas2" list="lista_tallas" listValue="tallaDescripcion" 
                                  listKey="tallaId" value="t.tallas.tallaId"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescripcion2">Descripción</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roDescripcion2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roDescripcion2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roPrecio2">Precio</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roPrecio2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roPrecio2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescuento2">Descuento</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roDescuento2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roDescuento2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roCaracteristicas2">Características</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roCaracteristicas2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roCaracteristicas2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roVisible2">Visible</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roVisible2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roVisible2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roUnidades2">Unidades</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roUnidades2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roUnidades2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roFecha2">Fecha</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e"|| request.getAttribute("accionocul") == "c") {
                        %>
                        <s:textfield name="roFecha2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roFecha2"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="categoria">Categoría</s:label>  
                    </td>
                    

                    <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.categoria.catDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                            <s:select id="categoria" name="categoria2" list="lista_categoria" listValue="catDescripcion" 
                                      listKey="catId" value="t.categoria.catId" onchange= "handleChange(this.value)" />
                        <%
                            }
                        %>      
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="subcategoria">Subategoría</s:label>  
                        </td>
                        <td>
                        <%
                        if (request.getAttribute("accionocul") == "e") {
                        %>
                            <s:textfield name="t.subcategoria.subDescripcion" readonly="true" ></s:textfield>
                        <%
                        }else  if (request.getAttribute("accionocul") == "a") {
                        %>
                            <s:select id="subcategoria2" name="subcategoria2" list="{'Seleccione Categoria'}" />
                            <script>usarAJAX();</script>
                        <%
                        } else {
                        %>
                        <!--listValue="subDescripcion" 
                                  listKey="subId" value="t.subcategoria.subId"  list="{'Seleccione Categoria'}"-->
                            <s:select id="subcategoria2" name="subcategoria2" list="lista_subcategoria"
                             listValue="subDescripcion" listKey="subId" value="t.subcategoria.subId"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%
                    if (request.getAttribute("accionocul") == "a") {
                %>
                <tr>
                    <td><s:label for="fotos">Foto 1</s:label></td>
                    <td><s:textfield type="file" name="fotoAlta1" ></s:textfield></td>
                    </tr>
                    <tr>
                        <td><s:label for="fotos">Foto 2</s:label></td>
                    <td><s:textfield type="file"  name="fotoAlta2" ></s:textfield></td>
                    </tr>
                    <tr>
                        <td><s:label for="fotos">Foto 3</s:label></td>
                    <td><s:textfield type="file"  name="fotoAlta3" ></s:textfield></td>
                    </tr>
                <%} else {%>
                <s:iterator var="f" value="t.fotoses">
                    <tr>
                        <td><s:label for="fotos">Fotos</s:label></td>
                        <td><s:textfield name="fotosRuta" readonly="true" ></s:textfield></td>
                        </tr>
                </s:iterator>
                <%}%>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />
                        <a href="volverRopaAdmin">
                            volver
                        </a>
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
