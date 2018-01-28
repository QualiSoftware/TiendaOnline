<%-- 
    Document   : formularioCRUDropa
    Created on : 17-oct-2016
    Author     : QualiSoftware
--%>

<%@taglib prefix="s" uri="/struts-tags" %>

<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <link href="../Estilos/estilosBorrado.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/utilidades.js" type="text/javascript"></script>
        <title>Formulario</title>
        <script src="../Scripts/jquery_3.js" type="text/javascript"></script>
        <script src="../Scripts/ValidacionCampoRelleno.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
               $('#categoria').change(function(event) {
                  usarAJAX();
                });
            });
            function usarAJAX (valor){
                var country = $("select#categoria").val();
                $.getJSON('ajaxAction', {
                    countryName : country
                    }, function(jsonResponse) {
                    var select = $('#subcategoria2');
                    select.find('option').remove();
                    $.each(jsonResponse.stateMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select);
                    $("#subcategoria2 option[value="+ valor +"]").attr("selected",true);
                    });
              });
            };
            function AltaSinFotos(){
                document.getElementById('confotos').value = 'false';
                Verificar();
            }
            function Verificar() {
                if (document.getElementById('accionocul').value === 'e') {
                    document.getElementById('botonera').style.display = 'none';
                    document.getElementById('confirmacionEliminacion').style.display = 'block';
                } else {
                    var rellenoOK = true;
                    var numeroOK = true;
                    if(!CampoRelleno(document.getElementById('roDescripcion2'),document.getElementById('errores'))){
                        rellenoOK = false;
                    }
                    if(!CampoRelleno(document.getElementById('roPrecio2'),document.getElementById('errores'))){
                        rellenoOK = false;
                    }else if(!NumeroPositivoCorrecto(document.getElementById('roPrecio2'),document.getElementById('erroresPrecio'))){
                        numeroOK = false;
                    }
                    if(!CampoRelleno(document.getElementById('roDescuento2'),document.getElementById('errores'))){
                        rellenoOK = false;
                    }else if(!NumeroPositivoCorrecto(document.getElementById('roDescuento2'),document.getElementById('erroresPrecio'))){
                        numeroOK = false;
                    }
                    if(!CampoRelleno(document.getElementById('roCaracteristicas2'),document.getElementById('errores'))){
                        rellenoOK = false;
                    }
                    if(rellenoOK){
                        document.getElementById('errores').innerHTML = "";
                    }
                    if(numeroOK){
                        document.getElementById('erroresPrecio').innerHTML = "";
                    }
                    if(rellenoOK && numeroOK){
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
                        <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="logo superlook" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Ropa</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
        
                <div  class="linea" style="margin-top: 30px;"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:label name="cabeceraocul" theme="simple" /> de Ropa</h3></div>
        <div  class="linea"></div>
        <s:form id="frm" action="CrudActionRopaAdmin" theme="simple">
            <input type="hidden" name="accionocul" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="confotos" id="confotos" value="true" />
            <table class="table_Crud">
                <tr>
                    <td colspan="2">
                        <pre><span id="errores"></span><span id="erroresPrecio"></span></pre>
                    </td>
                </tr>
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
                        <s:label for="cliCodigo">Clientela</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="t.clientela.clientelaDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:select name="cliCodigo" list="lista_clientela" listValue="clientelaDescripcion" 
                                  listKey="clientelaId" value="t.clientela.clientelaId"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="coleccion2">Colección</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="t.coleccion.coleccionDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:select name="coleccion2" list="lista_colecciones" listValue="coleccionDescripcion" 
                                  listKey="coleccionId" value="t.coleccion.coleccionId"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="look2">Look</s:label>  
                        </td>

                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="t.look.lookDescripcion" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:select name="look2" list="lista_look" listValue="lookDescripcion" 
                                  listKey="lookId" value="t.look.lookId"/>
                        </s:else>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="marca">Marca</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="t.marcas.marcaNombre" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:select name="marca" list="lista_marcas" listValue="marcaNombre" 
                                  listKey="marcaId" value="t.marcas.marcaId"/>
                        </s:else>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescripcion2">Descripción (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="roDescripcion2" id="roDescripcion2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="roDescripcion2" id="roDescripcion2" />
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roPrecio2">Precio (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="roPrecio2" id="roPrecio2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="roPrecio2" id="roPrecio2" />
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescuento2">Descuento (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="roDescuento2" id="roDescuento2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="roDescuento2" id="roDescuento2" />
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roCaracteristicas2">Características (*)</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                            <s:textfield name="roCaracteristicas2" id="roCaracteristicas2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="roCaracteristicas2" id="roCaracteristicas2" />
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roVisible2">Visible</s:label>  
                        </td>
                        <td>
                        <s:if test='%{accionocul == "e" || accionocul == "c"}'>
                        <s:textfield name="roVisible2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <% String selected = ""; %>
                            <s:if test="roVisible2==0">
                                <% selected="selected=\"selected\"";%>
                            </s:if>
                            <select name="roVisible2" id="roVisible2">
                                <option value="1">Si</option>
                                <option value="0" <%=selected%>>No</option>
                            </select>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="catCodigo">Categoría</s:label>  
                    </td>
                    

                    <td>
                        <% boolean hayfotos = false; %>                        
                        <s:iterator var="f" value="t.fotoses">
                            <% hayfotos = true; %>
                        </s:iterator>
                        <%
                            if (request.getAttribute("accionocul") == "e" || hayfotos) {
                        %>
                            <input type="hidden" name="hayFotos" value="true" />
                            <s:textfield name="t.categoria.catDescripcion" readonly="true" ></s:textfield>
                        <%
                        } else {
                        %>
                            <s:select id="categoria" name="catCodigo" list="lista_categoria" listValue="catDescripcion" 
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
                        if (request.getAttribute("accionocul") == "e" || hayfotos) {
                        %>
                            <s:textfield name="t.subcategoria.subDescripcion" readonly="true" ></s:textfield>
                        <%
                       
                        } else {
                        %>
                            <s:select id="subcategoria2" name="subcategoria2" list="{'Seleccione Categoria'}" />
                            <script>usarAJAX(<s:property value="t.subcategoria.subId"></s:property>);</script>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <% if(hayfotos){ %>
                <tr><td colspan="2">No se pueden modificar categoría y subcategoría ya que tiene fotos asociadas</td></tr>
                <%}%>
                <tr>
                    <td colspan="2" id="botonera" class="botones_Crud" >
                        <s:if test='%{accionocul == "a"}'>
                            <input type="button" onclick="Verificar();" value="Agregar fotos" />
                            <input type="button" onclick="AltaSinFotos();" value="No agregar fotos" />
                        </s:if>
                        <s:else>
                            <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />
                        </s:else>
                    </td>
                </tr>
            </table>
        </s:form>
    <center>
        <s:form action="RopaAdminFiltro" method="post" theme="simple">
            <input type="hidden" name="filtro" value="<%=request.getParameter("filtro")%>" />
            <input type="hidden" name="fechaI" value="<%=request.getParameter("fechaI")%>" />
            <input type="hidden" name="fechaF" value="<%=request.getParameter("fechaF")%>" />
            <input type="hidden" name="eliminadas" value="<%=request.getParameter("eliminadas")%>" />
            <input type="hidden" name="orden" value="<%=request.getParameter("orden")%>" />
            <s:submit value="Cancelar" />
        </s:form>
    </center>
    <s:include value="formularioConfirmacionEliminacion.jsp" />
    </body>
</html>
