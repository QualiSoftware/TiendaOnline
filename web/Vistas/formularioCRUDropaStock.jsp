<%-- 
    Document   : formularioCRUDropaStock
    Created on : 08-ene-2017, 21:44:54
    Author     : QualiSoftware
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
        <title>Formulario Stock</title>
        <script src="../Scripts/jquery_3.js" type="text/javascript"></script>
        <script>
            function Verificar(dato) {
                if (document.getElementById('accionocul').value === 'e') {
                    if (confirm("¿Seguro que desea borrar?")) {
                        document.getElementById('frm').submit();
                    }
                } else {
                    var unidades = document.getElementById('roUnidades2').value;
                    if(isNaN(unidades) || unidades < 1){
                        document.getElementById("mensajesError").innerHTML = "Unidades mal ingresadas";
                    }else if(document.getElementById('color').value == 0){
                        document.getElementById("mensajesError").innerHTML = "Debe seleccionar un color";
                    }else{
                        if(dato == 0){
                            document.getElementById('frm').action = "CrudActionRopaStockAdminMas";
                        }
                        document.getElementById('frm').submit();
                    }
                }
            }
            
            function fondo() {
                var e = document.getElementById("color");
                document.getElementById("color").style.backgroundColor = e.options[e.selectedIndex].text;
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
        <div id="titulo_Pagina">Stock de ropa</div>
        <s:include value="cabeceraMenuAdministrador.jsp" />
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:label name="cabeceraocul" theme="simple" /> de Stock de ropa</h3></div>
        <div  class="linea"></div>
        <div>
            <!--A este div habría que darle formato o ubicarlo a un costado del formulario-->
            Descripción: <s:property value="%{t.roDescripcion}"/>
            <% int cero=0; %>
            <s:iterator var="f" value="t.fotoses">
                <% if(cero<1){%>
                <img  id="cesta_Img" src="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="#f.fotosRuta" />" width="60" />
                <% cero++;}%>
            </s:iterator>
        </div>
        <s:form id="frm" action="CrudActionRopaStockAdmin" theme="simple">
            <input type="hidden" name="accion" id="accionocul" value=<s:property value="accion" /> />
            <input type="hidden" name="roId" value=<s:property value="roId" /> />
            <input type="hidden" name="filtro" value=<s:property value="filtro" /> />
            <input type="hidden" name="eliminadas" value=<s:property value="eliminadas" /> />
            <input type="hidden" name="orden" value=<s:property value="orden" /> />
            <table>
                <tr>
                    <td>
                        <s:label for="rostockId">Código</s:label>
                    </td>
                    <td>
                        <s:textfield name="rostockId" id="rostockId" readonly="true"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="tallas2">Talla</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e" || accion == "c" || accion == "m"}'>
                            <s:textfield name="rstock.tallas.tallaDescripcion" readonly="true" ></s:textfield>
                            <input type="hidden" name="tallas2" value=<s:property value="rstock.tallas.tallaId" /> />
                        </s:if>
                        <s:else>
                            <s:select name="tallas2" list="lista_tallas" listValue="tallaDescripcion" 
                                      listKey="tallaId" value="rstock.tallas.tallaId"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="color2">Color</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e" || accion == "c" || accion == "m"}'>
                            <div id="color1" style="background-color: <s:property value="rstock.color.colorDescripcion"/>;">
                            <input type="hidden" name="color2" value=<s:property value="rstock.color.colorId" /> />
                            </div>
                        </s:if>
                        <s:else>
                            <!--<s:select name="color2" list="lista_colores" listValue="colorDescripcion" 
                                      listKey="colorId" value="rstock.color.colorId"/>-->
                            <select name="color2" id="color" class="decorated" onchange="fondo()">
                                <option value="0">Seleccione un color</option>
                                <s:iterator var="c" value="lista_colores">
                                    <option value="<s:property value="#c.colorId"/>" style="background-color:<s:property value="#c.colorDescripcion"/>;"/><s:property value="#c.colorDescripcion"/></option>
                                </s:iterator>
                                
                            </select>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roUnidades2">Unidades</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e" || accion == "c"}'>
                            <s:textfield name="roUnidades2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield id="roUnidades2" name="roUnidades2"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roFecha2">Fecha</s:label>  
                    </td>
                    <td>
                        <s:if test='%{accion == "e" || accion == "c"}'>
                            <s:textfield name="roFecha2" readonly="true" ></s:textfield>
                        </s:if>
                        <s:else>
                            <s:textfield name="roFecha2" id="roFecha2" cssClass="tcal" readonly="true"/>
                        </s:else>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="Verificar();" value="<s:property value="botonocul" /><s:if test='%{accion == "a"}'> y finalizar</s:if>" />
                        <s:if test='%{accion == "a"}'>
                            <input type="button" onclick="Verificar(0);" value="Ingresar más" />
                        </s:if>
                    </td>
                </tr>
            </table>
        </s:form>
        <div id="mensajesError"></div>
    <center>
        <s:form action="RopaAdminFiltro" method="post" theme="simple">
            <input type="hidden" name="filtro" value=<s:property value="filtro" /> />
            <input type="hidden" name="eliminadas" value="<%=request.getParameter("eliminadas")%>" />
            <input type="hidden" name="orden" value="<%=request.getParameter("orden")%>" />
            <s:submit value="Cancelar" />
        </s:form>
    </center>
</body>
</html>