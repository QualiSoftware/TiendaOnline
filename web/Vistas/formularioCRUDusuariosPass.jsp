<%-- 
    Document   : formularioCRUDusuariosPass
    Created on : 29-nov-2016, 19:57:51
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Favicon-->
        <link rel="shortcut icon" href="../Imagenes/Administracion/Favicon house_hangers.png">        
        <!--Mis Estilos-->
        <link href="../Estilos/IndexEstilo.css" rel="stylesheet" type="text/css"/>
        <!--Bootstrap-->
        <link href="../Estilos/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--JQuery-->
        <script src="../Scripts/jquery_3.js"></script>
        <!-- Estilos Footer -->
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script>
        <title>Cambio de contraseña</title>
        <script>
            window.onload = muestra_Cantidad;
        </script>
        <script>
            function Verificar(orden) {
                if(orden == 'cambiar'){
                    if(document.getElementById('nueva1').value === ""){
                        document.getElementById("divError").innerHTML = "La contraseña no puede estar vacía.";
                    }else if (document.getElementById('nueva1').value === document.getElementById('nueva2').value) {
                        document.getElementById("divError").innerHTML = "";
                        document.getElementById('frm').submit();
                    } else {
                        document.getElementById("divError").innerHTML = "La contraseña nueva no es igual a la contraseña nueva repetida";
                    }
                }else if(orden == 'volver'){
                    document.getElementById('frm').action = "UsuAlta";
                    document.getElementById('frm').submit();
                }else{
                    alert("orden: "+orden+" accion: "+document.getElementById('accionocul').value+" clave: "+document.getElementById('clave').value);
                }
            }
        </script>
    </head>
    <body> 
        <s:include value="cargarCookie.jsp" />    
        <div id="todo">            
            <div id="header">
                <div id="marca">
                    <s:a action="Tienda">
                        <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="logo superlook" id="logo"/>
                    </s:a>
                </div>
                <div id="idioma">
                    <img src="../Imagenes/Administracion/flag_spain_blog.png" alt=""/>
                    <img src="../Imagenes/Administracion/lrgscaleunited_kingdom_great_british_union_jack_flag.png" alt=""/>
                </div>
                <div id="cesta">
                    <s:if test="sesion.usuAdministrador!=1">
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
                            <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta"/>
                            <div id="cantidad_Cesta"><s:property value="totalcestaUsuario"/></div>
                            <s:if test="%{totalcestaUsuario > 0}">
                                <s:set var="importeTotal" value="0"/>
                                <table id="cesta_Hover">
                                    <% int cero = 0; %>
                                    <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                        <s:iterator var="c" value="lista_ropa_Cestas">
                                            <tr style="">
                                                <td class="img_CestaPreview">
                                                    Artículo:<br>
                                                    <% cero = 0; %>
                                                    <s:iterator var="f" value="#c.ropaStock.ropa.fotoses">
                                                        <% if (cero < 1) {%>
                                                        <img src="<s:url value='../Imagenes/%{#c.ropaStock.ropa.categoria.catDescripcion}/%{#c.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />"/>
                                                        <% cero++;
                                                            }%>
                                                    </s:iterator>                                                
                                                </td>
                                                <td class="descripcion_CestaPreview">
                                                    <s:property value="#c.ropaStock.ropa.roDescripcion"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Color:
                                                </td>
                                                <td>
                                                    <div id="color1" style="background-color: <s:property value="#c.ropaStock.color.colorDescripcion"/>;">
                                                    </div>                                            
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Talla:
                                                </td>
                                                <td>
                                                    <s:property value="#c.ropaStock.tallas.tallaDescripcion"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Precio:
                                                </td>
                                                <td>
                                                    <s:property value="getText('{0,number,##0.00}',{#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)})"/>
                                                    <s:set var="importeTotal" value="%{#importeTotal + (#c.cestaUnidades * (#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)))}"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Cantidad:
                                                </td>
                                                <td>
                                                    <s:property value="#c.cestaUnidades"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" ><hr class="linea_CestaPreview"></td>                                
                                            </tr>
                                        </s:iterator>
                                    </s:if>
                                    <s:else>
                                        <s:iterator var="c" value="lista_ropa_Cesta_NoLog">
                                            <tr style="">
                                                <td class="img_CestaPreview">
                                                    Artículo:<br>
                                                    <% cero = 0; %>
                                                    <s:iterator var="f" value="#c.ropaStock.ropa.fotoses">
                                                        <% if (cero < 1) {%>
                                                        <img src="<s:url value='../Imagenes/%{#c.ropaStock.ropa.categoria.catDescripcion}/%{#c.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />"/>
                                                        <% cero++;
                                                            }%>
                                                    </s:iterator>                                                
                                                </td>
                                                <td class="descripcion_CestaPreview">
                                                    <s:property value="#c.ropaStock.ropa.roDescripcion"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Color:
                                                </td>
                                                <td>
                                                    <div id="color1" style="background-color: <s:property value="#c.ropaStock.color.colorDescripcion"/>;">
                                                    </div>                                            
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Talla:
                                                </td>
                                                <td>
                                                    <s:property value="#c.ropaStock.tallas.tallaDescripcion"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Precio:
                                                </td>
                                                <td>
                                                    <s:property value="getText('{0,number,##0.00}',{#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)})"/>
                                                    <s:set var="importeTotal" value="%{#importeTotal + (#c.nlcUnidades * (#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)))}"/>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>
                                                    Cantidad:
                                                </td>
                                                <td>
                                                    <s:property value="#c.nlcUnidades"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" ><hr class="linea_CestaPreview"></td>                                
                                            </tr>
                                        </s:iterator>
                                    </s:else>
                                    <tr>
                                        <td>
                                            Precio total:
                                        </td>
                                        <td>
                                            <s:property value="getText('{0,number,##0.00}',{#importeTotal})"/>
                                        </td>
                                    </tr>                                        
                                    <tr>
                                        <td>

                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </s:if>
                        </s:a>
                    </s:if>                                
                    <s:if test="sesion.usuAdministrador==1">
                        <s:form action="RopaAdminFiltro" theme="simple">
                            <s:submit value="Admin"></s:submit>                    
                        </s:form>
                    </s:if>
                </div>
                <div id="iniciar_Sesion">
                    <s:if test="sesion.usuId==null || sesion.usuId==''">
                        <%
                            response.sendRedirect("Vistas/Tienda.action");
                        %>
                    </s:if>
                    <s:if test="sesion.usuId!=null && sesion.usuId!=''">                   
                        <a href="#">
                            <div id="mi_Cuenta_Txt" onclick="fijarLogin();">
                                ¡Bienvenido <div id="nick_Login"><s:property value="sesion.usuNombre"/>!</div>
                            </div>
                        </a>
                        <div id="login" style="width: 50px; margin-right: 50px; margin-top: 0px;">                                        
                            <s:a action="TiendaCerrarSesion" >
                                <button style="margin: 0 auto" class="btn btn-default">Cerrar Sesión</button>
                            </s:a>
                        </div>
                    </s:if>
                </div>
                <s:if test="mensajeError == 'Usuario y/o contraseña erróneos'"><script>fijarLogin('block');</script></s:if>
                <div id="apadrina">
                    <s:a action="apadrina"><div id="apadrina_Txt">Apadrina  &nbsp;<span class="sin_Decoracion">|</span></div></s:a>
                </div>

                <div id="quienes_Somos">
                <s:a action="quienesSomos"><div id="quienes_Somos_Txt"> ¿Quiénes somos? &nbsp; <span class="sin_Decoracion">|</span></div></s:a>

                </div>
                <div id="contacto">
                <s:a action="contacto"><div id="contacto_Txt">Contacto  &nbsp;<span class="sin_Decoracion">|</span></div></s:a>
                </div>
                <div id="lista_Deseos">                       
                    <s:a action="listaDeseos">
                        <div id="lista_Deseos_Txt">
                            Lista de deseos <span class="glyphicon glyphicon-star" style="color: black;"></span>  &nbsp;<span class="sin_Decoracion">|</span>
                        </div>
                    </s:a>
                </div>
            </div>
            <div class="linea" style="height: 3px;"></div>
            <div id="menu_Desplegable">
                <img src="../Imagenes/Administracion/afdf338882d16dd2b1360aa975b18111.png" alt="" style="width: 30px; margin-right: 10px; opacity: 0.9;"/>
                <div id="menu_Tabla">
                    <table>
                        <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                            <tr>
                                <td class="con_Borde">
                                    <s:a action="UsuAlta" >
                                        <span class="glyphicon glyphicon-user"></span> Cuenta
                                        <s:param name="clave" value="sesion.usuId"/>
                                        <s:param name="accion" value="'m'"/>
                                    </s:a>
                                </td>
                            </tr>
                            <s:if test="sesion.usuAdministrador!=1">
                                <tr>
                                    <td class="con_Borde">
                                        <s:a action="pedidos">
                                            <span class="glyphicon glyphicon-shopping-cart"></span> Pedidos
                                            <s:param name="clave" value="sesion.usuId"/>
                                        </s:a>
                                    </td>
                                </tr>
                            </s:if>
                        </s:if>
                        <tr>
                            <td class="con_Borde">
                            <s:a action="ayuda"><span class="glyphicon glyphicon-question-sign"></span> Ayuda</s:a>
                            </td>
                        </tr>                        
                        <tr>
                            <td >
                            <s:a action="otros"><span class="glyphicon glyphicon-option-vertical"></span> Otros</s:a>
                            </td>
                        </tr>
                    </table>                                        
                </div>
            </div>
            <div id="filtro" class="navbar-form navbar-left">
                <s:form role="search" action="TiendaMenu" theme="simple">
                    <div class="form-group">
                        <input type="text" style="position: absolute; top:0px; left: 0px;" class="form-control" placeholder="Búsqueda" name="filtro" value="<s:property value="filtro"/>">
                    </div>
                    <button style="position: absolute; top:0px; left: 215px;" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                </s:form>
            </div>
            <div id="menu">
                <ul class="nav nav-pills">
                    <li class="dropdown">
                        <s:a action="TiendaMenu"  class="dropdown-toggle" style="font-weight: normal;">TODAS LA VENTAS</s:a>

                        </li>                    
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-weight: normal;">MUJER <b class="caret"></b></a>
                            <ul class="dropdown-menu" id="Mujer">
                            <s:iterator var="a" value= "lista_menu_ropa">
                                <s:if test="#a.clientela.clientelaDescripcion=='Mujer'">
                                    <li><s:a action="TiendaMenu">
                                            <s:property value="#a.categoria.catDescripcion"/>
                                            <s:param name="cliCodigo" value="#a.clientela.clientelaId"/>
                                            <s:param name="catCodigo" value="#a.categoria.catId"/>
                                        </s:a></li>
                                    </s:if>
                                </s:iterator>
                        </ul>                 
                    </li>
                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" style="font-weight: normal;">HOMBRE <b class="caret"></b></a>
                        <ul class="dropdown-menu" id="hombre">
                            <s:iterator var="a" value= "lista_menu_ropa">
                                <s:if test="#a.clientela.clientelaDescripcion=='Hombre'">
                                    <li><s:a action="TiendaMenu">
                                            <s:property value="#a.categoria.catDescripcion"/>
                                            <s:param name="cliCodigo" value="#a.clientela.clientelaId"/>
                                            <s:param name="catCodigo" value="#a.categoria.catId"/>
                                        </s:a></li>                                    
                                    </s:if>
                                </s:iterator>                      
                        </ul>                 
                    </li>

                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" style="font-weight: normal;">MARCAS DE TEMPORADA <b class="caret"></b></a>
                        <ul class="dropdown-menu" >
                            <s:iterator var="a" value= "lista_marcas">
                                <li><s:a action="TiendaMenu">
                                        <s:property value="#a.marcaNombre"/>
                                        <s:param name="marca" value="#a.marcaId"/>
                                    </s:a></li>
                                </s:iterator>                       
                        </ul>                 
                    </li>                    
                </ul>                
            </div>
            <div class="linea" style="height: 3px;"></div>
            <div id="divError" style="color: red; position: absolute; margin-top: 75px; margin-left: 79px;"></div>
            <s:form id="frm" action="CambiaContrasenia" theme="simple">
                <input type="hidden" name="accion" id="accionocul" value=<s:property value="accion" /> />
                <input type="hidden" name="clave" id="clave" value=<s:property value="clave" /> />
                <span id="titulo_Cuenta_Usuario">Modifique su contraseña <span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                <table id="cuenta_Usuario">
                    <tr>
                        <td style="padding-top: 25px; text-align: left;">
                            <s:label for="antigua">Antigua contraseña</s:label>  
                        </td>
                        <td style="padding-top: 25px;">                        
                        <s:password name="antigua" cssClass="formulario_Rellenar" maxLength="50" ></s:password>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <s:label for="nueva1">Nueva contraseña</s:label>  
                        </td>
                        <td>                        
                            <s:password name="usuPassword2" cssClass="formulario_Rellenar" id="nueva1" maxLength="50"></s:password>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:label for="nueva2">Repita nueva contraseña</s:label>  
                        </td>
                        <td>                        
                            <s:password name="nueva2" cssClass="formulario_Rellenar" id="nueva2"></s:password>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <s:property value="dummyMsg"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 0px; padding-bottom: 20px; padding-left: -30px;">
                            <input type="button" onclick="Verificar('cambiar');" value="Cambiar" class="botones_cuenta_usuario" style="margin-bottom: 0px; 
                                           vertical-align: 0px; 
                                           border: 0px; 
                                           background-color: #cc0033;
                                           color: white;
                                           padding-left: 10px;
                                           padding-right: 10px;
                                           padding-bottom: 3px;
                                           padding-top: 3px;
                                           cursor: pointer;
                                           border-radius: 5px;
                                           height: 26px;
                                           text-align: center;
                                           font-size: 15px;
                                           box-shadow: 3px 3px 3px grey;
                                           text-decoration: none;
                                           margin-left: 45%;" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" onclick="Verificar('volver');" value="Volver" class="botones_cuenta_usuario" style="margin-bottom: 0px; 
                                           vertical-align: 0px; 
                                           border: 0px; 
                                           background-color: #cc0033;
                                           color: white;
                                           padding-left: 10px;
                                           padding-right: 10px;
                                           padding-bottom: 3px;
                                           padding-top: 3px;
                                           cursor: pointer;
                                           border-radius: 5px;
                                           height: 26px;
                                           text-align: center;
                                           font-size: 15px;
                                           box-shadow: 3px 3px 3px grey;
                                           text-decoration: none;
                                           margin-left: 5%;" />
                        </td>
                    </tr>
                </table>
            </s:form>
        </div>
        <s:include value="tiendaFooter.jsp" />
    </body>
</html>