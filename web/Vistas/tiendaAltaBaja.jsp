<%-- 
    Document   : tiendaAltaBaja.jsp
    Created on : 13-abr-2016
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
        <!--Carrusel de fotos-->
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js' type='text/javascript'></script>
        <script src="../Scripts/Carrusel.js" type="text/javascript"></script>
        <!-- Estilos Footer -->
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">        
        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script> 
        <!-- Validación usuarios-->
        <script src="../Scripts/ValidacionUsuario.js" type="text/javascript"></script>             
        <script>
            window.onload = muestra_Cantidad;            
        </script>
        <title><s:property value="cabeceraocul" /> realizada correctamente</title>
    </head>
    <body>
        <s:include value="cargarCookie.jsp" />
        <div id="todo">
            <div id="header">
                <div id="marca">
                    <s:a action="Tienda">
                        <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
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
                        <a href="#"> 
                            <div id="mi_Cuenta_Txt" onclick="fijarLogin();">Mi Cuenta</div>
                        </a>                     
                        <s:form id="frmLogin" action="TiendaLogin" theme="simple">
                            <input type="hidden" name="actionName" value="apadrina.action"/>
                            <div id="login">                                        
                                <table>
                                    <tr>
                                        <td><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>
                                            <s:textfield name="usuario" id="usuPassword2" class="btn btn-default" aria-label="Left Align" style="text-align: left; background-color: white; margin-top:10px; margin-left:5px;" />
                                            <s:fielderror fieldName="usuario" theme="simple"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <span class="glyphicon glyphicon-lock" aria-hidden="true" ></span>
                                            <s:password name="password" id="passVerif" class="btn btn-default" style="text-align: left; color: gray; margin-bottom: 3px; margin-left:5px;" aria-label="Left Align" />
                                            <s:fielderror fieldName="password" />                                            
                                            <input type="hidden" name="mensajeError" value="<s:property value="mensajeError"/>"/>
                                            <span style="color: red; font-size: 13px; padding-left: 18px; position: relative;"><s:property value="mensajeError"/></span>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <s:a action="recuperaPass">Olvidé mi contraseña</s:a>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <input type="button" onclick="usuarioLogin();" value="Acceder" style="margin: 0 auto; width: 100px; border: 0px grey solid; background-color: #cc0033; box-shadow: 5px 5px 5px grey; color: white;" onMouseOver="this.style.cssText='width: 100px; -webkit-transform: scale(1.09); -webkit-transition: .3s; border: 0px grey solid; color: white; background-color: #cc0033; box-shadow: 5px 5px 5px grey;'" onMouseOut="this.style.cssText='box-shadow: 0px; width: 100px; -webkit-transform: scale(1); -webkit-transition: .3s; border: 0px grey solid; color: white; background-color: #cc0033; box-shadow: 5px 5px 5px grey;'" class="btn btn-default btn_Acceder"/>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            ¿Nuevo Cliente? 
                                            <s:a action="UsuAlta" >
                                                <s:param name="clave" value="1"/>
                                                <s:param name="accion" value="'a'"/>¡Regístrate!
                                            </s:a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </s:form>
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
            <div id="linea1" class="linea"></div>
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
                    <input type="hidden" name="cliCodigo" value="<s:property value="cliCodigo"/>"/>
                    <input type="hidden" name="catCodigo" value="<s:property value="catCodigo"/>"/>
                    <input type="hidden" name="clientelaNombre" value="<s:property value="clientelaNombre"/>"/>
                    <input type="hidden" name="categoriaNombre" value="<s:property value="categoriaNombre"/>"/>
                    <input type="hidden" name="marca" value="<s:property value="marca"/>"/>
                    <input type="hidden" name="campania" value="<s:property value="campania"/>"/>
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
        <center>
        <h1><s:property value="cabeceraocul" /> de su cuenta realizada correctamente</h1>
        <s:if test='%{accion == "a"}'>
            <br/>
            <br/>
            <br/>
            Por favor revise su correo electrónico que tendrá un enlace para activar su cuenta.
        </s:if>
        <s:elseif test='%{accion == "e"}'>
            <br/>
            <br/>
            <br/>
            Le agradecemos haber formado parte de los usuarios de nuestra tienda y esperamos que vuelva en otro momento.
        </s:elseif>
        <br/>
        <br/>
        <br/>
        </center>
        </div>
        <s:include value="tiendaFooter.jsp" />
    </body>
</html>
