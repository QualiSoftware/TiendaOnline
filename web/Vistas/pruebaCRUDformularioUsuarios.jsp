<%-- 
    Document   : pruebaCRUDformulario
    Created on : 01-oct-2016, 9:36:47
    Author     : LaPlaga
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
            $(document).ready(function () {
                $('#categoria').change(function (event) {
                    var country = $("select#categoria").val();

                    $.getJSON('ajaxAction', {
                        countryName: country
                    }, function (jsonResponse) {
                        $('#ajaxResponse').text(jsonResponse.dummyMsg);
                        var select = $('#subcategoria2');
                        select.find('option').remove();
                        $.each(jsonResponse.stateMap, function (key, value) {
                            $('<option>').val(key).text(value).appendTo(select);
                        });
                    });

                });

            });
        </script>
        <script>
            function Verificar() {

                    document.getElementById('frm').submit();
                
            }
        </script>        
    </head>
    <body>
        <h1> <s:label name="cabeceraocul"></s:label> </h1>
        <s:form id="frm" action="CrudActionCesta" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accionocul" /> />
            <input type="hidden" name="clave" id="accionocul" value=<s:property value="clave" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="roId2">Codigo</s:label>  
                        </td>
                        <td>
                            <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="roId2" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roId2" readonly="true"></s:textfield>
                        <%
                            }
                        %>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="clientela2">Clientela</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.clientela.clientelaDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.clientela.clientelaDescripcion" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        

                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="coleccion2">Coleccion</s:label>  
                        </td>
                        <td>
                        <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.coleccion.coleccionDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.coleccion.coleccionDescripcion" readonly="true" ></s:textfield>
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
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.color.colorDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.color.colorDescripcion" readonly="true" ></s:textfield>
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
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.look.lookDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.look.lookDescripcion" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        


                        </td>
                    </tr>
                    <tr>

                        <td>
                        <s:label for="marcas2">Marcas</s:label>  
                        </td>
                        <td>
                                <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.marcas.marcaNombre" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.marcas.marcaNombre" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        


                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="tallas2">Tallas</s:label>  
                        </td>

                        <td>
                             <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.tallas.tallaDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.tallas.tallaDescripcion" readonly="true" ></s:textfield>
                        <%
                            }
                        %>

                        

                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="roDescripcion2">Descripcion</s:label>  
                        </td>
                        <td>
                            <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.roDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roDescripcion2" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        </td>
                    </tr>
                    
                        <td>
                        <s:label for="roDescuento2">Descuento</s:label>  
                        </td>
                        <td>
                            <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.roDescuento" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roDescuento2" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        

                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="roCaracteristicas2">Caracteristicas</s:label>  
                        </td>
                        <td>
                            <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="t.ropa.roCaracteristicas" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.roCaracteristicas" readonly="true" ></s:textfield>
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
                        <s:textfield name="t.ropa.categoria.catDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.categoria.catDescripcion" readonly="true" ></s:textfield>
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
                        <s:textfield name="t.ropa.subcategoria.subDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="t.subcategoria.subDescripcion" readonly="true" ></s:textfield>
                        <%
                            }
                        %>

                        


                        </td>
                    </tr>
                    <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                         <s:iterator var="f" value="t.ropa.fotoses">
                    <tr>
                        <td><s:label for="fotos">Fotos</s:label></td>
                        <td><s:textfield name="fotosRuta" readonly="true" ></s:textfield></td>
                        </tr>
                </s:iterator>
                        
                        <%
                        } else {
                        %>
                         <s:iterator var="f" value="t.fotoses">
                    <tr>
                        <td><s:label for="fotos">Fotos</s:label></td>
                        <td><s:textfield name="fotosRuta" readonly="true" ></s:textfield></td>
                        </tr>
                </s:iterator>
                        <%
                            }
                        %>
                
               
                    <tr>
                        <td>
                            
                        <s:label for="roPrecio2">Precio</s:label>  
                        </td>
                        
                        <td>
                        
                            <%
                            if (request.getAttribute("accionocul") == "e") {
                        %>
                        <s:textfield name="precioEliminar" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                        <s:textfield name="roPrecio2" readonly="true" ></s:textfield>
                        <%
                            }
                        %>
                        

                        </td>
                    </tr>
                    <tr>
                <tr>
                    <td>
                        <s:label for="Cantidad">Cantidad</s:label>  
                        </td>
                        <td>

                        <s:if test="cantidad!=''">
                            <s:textfield type="number"  min="1" max="10" name="cantidad"></s:textfield>
                        </s:if>
                            <s:else>
                                <s:textfield type="number" value="1"  min="1" max="10" name="cantidad"></s:textfield>
                            </s:else>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />
                        <a href="volverRopaU">
                            volver
                        </a>
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
