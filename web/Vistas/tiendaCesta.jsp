<%-- 
    Document   : tiendaCesta
    Created on : 11-feb-2017, 10:34:45
    Author     : QualiSoftware
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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

        <!-- FancyBox-->
        <script src="../Scripts/Fancy.js" type="text/javascript"></script>
        <!-- Add jQuery library -->
        <script type="text/javascript" src="../Fancy/lib/jquery-1.10.1.min.js"></script>                        
        <!-- Add mousewheel plugin (this is optional) -->
        <script type="text/javascript" src="../Fancy/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="../Fancy/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="../Fancy/source/jquery.fancybox.css" media="screen" />

        <!-- Add Button helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="../Fancy/source/helpers/jquery.fancybox-buttons.css" />
        <script type="text/javascript" src="../Fancy/source/helpers/jquery.fancybox-buttons.js"></script>
        <!-- Add Thumbnail helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="../Fancy//source/helpers/jquery.fancybox-thumbs.css" />
        <script type="text/javascript" src="../Fancy/source/helpers/jquery.fancybox-thumbs.js"></script>
        <!-- Add Media helper (this is optional) -->
        <script type="text/javascript" src="../Fancy/source/helpers/jquery.fancybox-media.js"></script>
        
        <!-- Zoom-->
        <link rel="stylesheet" href="../Estilos/easyzoom.css" />
        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script>
        <!-- Validación usuarios-->
        <script src="../Scripts/ValidacionUsuario.js" type="text/javascript"></script>
        <script>                    
            window.onload = cesta_Aniadir;

            function enviarPedido(){
                document.getElementById('botonEnvio').style.display = 'none';
                document.getElementById('espera').style.display = "block";
                document.getElementById('frm').submit();
            }
        </script>
        <title>Cesta de <s:property value="sesion.usuNombre"/></title>
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
                            <input type="hidden" name="actionName" value="CestaFiltro.action"/>
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
                                            <a href="#">
                                                <input type="button" onclick="usuarioLogin();" value="Acceder" style="margin: 0 auto; width: 100px; border: 0px grey solid; background-color: #cc0033; box-shadow: 5px 5px 5px grey; color: white; padding-bottom: 25px; padding-left: 10px;" onMouseOver="this.style.cssText = 'width: 100px; -webkit-transform: scale(1.09); -webkit-transition: .3s; border: 0px grey solid; color: white; background-color: #cc0033; box-shadow: 5px 5px 5px grey; padding-bottom: 25px; padding-left: 10px;'" onMouseOut="this.style.cssText = 'box-shadow: 0px; width: 100px; -webkit-transform: scale(1); -webkit-transition: .3s; border: 0px grey solid; color: white; background-color: #cc0033; box-shadow: 5px 5px 5px grey; padding-bottom: 25px; padding-left: 10px;'" class="btn btn-default btn_Acceder"/>
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
                    <input type="hidden" name="cliCodigo" value=""/>
                    <input type="hidden" name="catCodigo" value=""/>
                    <input type="hidden" name="clientelaNombre" value=""/>
                    <input type="hidden" name="categoriaNombre" value=""/>
                    <input type="hidden" name="marca" value=""/>
                    <input type="hidden" name="campania" value=""/>
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
            <div id="linea2" class="linea"></div>
            <div class="linea" style="height: 0.2em;"></div>
            <div id="contenido_Detalles">
                <div id="cesta_Titulo">Mi Cesta <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta_Titulo"/></div>
                <div class="detalle_info_Cesta">
                    <s:set var="cantidadRopa" value="0"/>
                    <div id="items_en_uso">
                        <input type="hidden" name="clave" id="roid" value="<s:property value="#a.ropaStock.ropa.roId"/>"/>
                        <input type="hidden" name="clave" id="colorid" value="<s:property value="#a.ropaStock.color.colorId"/>"/>
                        <input type="hidden" name="clave" id="tallaid" value="<s:property value="#a.ropaStock.tallas.tallaId"/>"/>
                        <input type="hidden" name="clave" id="unifact" value="<s:property value="cantidad"/>"/>
                        <input type="hidden" name="clave" id="prefact" value="<s:property value="getText('{0,number,##0.00}',{precio})"/>"/>
                    <% int cero = 0; %>
                    <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                        <s:iterator var="a" value="lista_ropa_Cestas">
                            <hr class="linea_divisoria_articulos">
                            <table> 
                                <thead >
                                    <tr>
                                        <td class="bold" style="padding-bottom: 10px;" colspan="3">
                                            <a href="Detalles.html">
                                                <span class="titulo_Producto_Cesta">
                                                    <s:property value="#a.ropaStock.ropa.roDescripcion"/>
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                </thead>
                                <tr>
                                    <td rowspan="4" style="padding-right: 100px;">
                                        <s:a action="RopaPopUp">
                                            <s:param name="roId" value="#a.ropaStock.ropa.roId"/>
                                            <% cero = 0; %>
                                            <s:iterator var="f" value="#a.ropaStock.ropa.fotoses">
                                                <% if (cero < 1) {%>
                                                <img  id="cesta_Img" src="<s:url value='../Imagenes/%{#a.ropaStock.ropa.categoria.catDescripcion}/%{#a.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />" />
                                                <% cero++;
                                                    }%>
                                            </s:iterator>
                                        </s:a>
                                    </td>
                                    <td>Color:</td>
                                    <td>
                                        <div id="color1" style="background-color: <s:property value="#a.ropaStock.color.colorDescripcion"/>;">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Talla:</td>
                                    <td>
                                        <s:property value="#a.ropaStock.tallas.tallaDescripcion"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Precio individual:
                                    </td>
                                    <td>
                                        <s:property value="getText('{0,number,##0.00}',{#a.ropaStock.ropa.roPrecio - (#a.ropaStock.ropa.roPrecio * #a.ropaStock.ropa.roDescuento / 100)})"/> €
                                    </td>
                                </tr>
                                <tr>
                                    <td  style='padding-top: 2px;'>
                                        Cantidad:
                                    </td>
                                    <td>

                                        <s:form id="formCantidad" action="CestaFiltro" theme="simple" method="post">
                                            <input type="hidden" name="accionocul" value="e"/>
                                            <input type="hidden" name="clave" id="clave"/>
                                            <input type="hidden" name="clave" id="idusu" value="<s:property value="sesion.usuId"/>"/>
                                            <img src="../Imagenes/Administracion/Signo_Menos.png" id="menos-<s:property value="#a.ropaStock.ropa.roId"/>-<s:property value="#a.ropaStock.color.colorId"/>-<s:property value="#a.ropaStock.tallas.tallaId"/>"
                                                 style="cursor:pointer; width: 30px; padding-top: 13px;"/>
                                            &nbsp;
                                            <input type="text" name="cantidad" id="cantidadIndividual<s:property value="#a.ropaStock.ropa.roId"/>" readonly="readonly" 
                                                   style="width: 25px;text-align: center;" value="<s:property value="#a.cestaUnidades"/>">
                                            &nbsp;
                                            <img src="../Imagenes/Administracion/Signo_Mas.png" id="mas-<s:property value="#a.ropaStock.ropa.roId"/>-<s:property value="#a.ropaStock.color.colorId"/>-<s:property value="#a.ropaStock.tallas.tallaId"/>" 
                                                 style="cursor:pointer; width: 30px; padding-top: 13px;" />
                                        </s:form>
                                        <script>

                                             $(document).ready(function () {
                                                $('body').on('click', '#items_en_uso img', function(){
                                                   var a =  $(this).attr('id')
                                                   var even = a.split('-');
                                                   var masmenos = even[0];
                                                   var idropa = even[1];
                                                   var idcolor = even[2];
                                                   var idtalla = even[3];
                                                   $("#roid").val(idropa); 
                                                   $("#colorid").val(idcolor);  
                                                   $("#tallaid").val(idtalla); 
                                                   if(masmenos == "mas"){
                                                        usarAJAX("+");
                                                   }else{
                                                       usarAJAX("-");
                                                   }
                                                })                                           
                                            });
                                            function usarAJAX(value) { 

                                                var unifact = document.getElementById('unifact').value;

                                                var concomaprefact = document.getElementById('prefact').value;
                                                var prefact = concomaprefact.replace(",", ".")
                                                var roid = document.getElementById('roid').value;
                                                var colorid = document.getElementById('colorid').value;
                                                var tallaid = document.getElementById('tallaid').value;
                                                var cantidadprenda =  document.getElementById('cantidadIndividual'+roid).value;
                                                var idusu =  document.getElementById('idusu').value;
                                                var masmenos = value;
                                                $.getJSON('ajaxsumaRestaRopa', {
                                                    roid: roid, colorid: colorid, tallaid: tallaid, cantidadprenda: cantidadprenda, masmenos: masmenos, idusu: idusu, prefact: prefact, unifact: unifact
                                                }, function (jsonResponse) {
                                                     $("#cantidadIndividual"+roid).val(jsonResponse.scantidad);
                                                     $("#unifact").val(jsonResponse.sunifact);
                                                     $("#prefact").val(jsonResponse.sprefactura);
                                                     $("label[for='uni"+roid+"']").text(jsonResponse.scantidad);
                                                     $("label[for='total"+roid+"']").text(jsonResponse.stotal);
                                                     $("label[for='unifact']").text(jsonResponse.sunifact);
                                                     $("label[for='prefact']").text(jsonResponse.sprefactura);      
                                                });
                                            }
                                        </script>
                                    </td>  
                                </tr>
                                <tr>
                                    <td></td><td style="width:180px;">
                                        Importe por <label for="uni<s:property value="#a.ropaStock.ropa.roId"/>"><s:property value="#a.cestaUnidades"/></label>  prendas:
                                    </td>
                                    <td>
                                        <label for="total<s:property value="#a.ropaStock.ropa.roId"/>"><s:property value="getText('{0,number,##0.00}',{#a.cestaUnidades * (#a.ropaStock.ropa.roPrecio - (#a.ropaStock.ropa.roPrecio * #a.ropaStock.ropa.roDescuento / 100))})"/></label>€

                                    </td>
                                </tr>
                                <tr>
                                    <td id="Stock_Excedido<s:property value="#a.cestaId"/>" colspan="3" style="color:red; position:absolute; margin-left: 220px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <s:a action="CestaFiltro">
                                            <s:param name="cantidad" value="0"/>
                                            <s:param name="accionocul" value="'e'"/>
                                                <s:param name="clave" value="#a.cestaId"/>
                                            <div class="btn_Elminar_Producto">Eliminar</div>
                                        </s:a>
                                    </td>
                                </tr>
                            </table>
                            <s:set var="cantidadRopa" value="%{#cantidadRopa + 1}"/>
                        </s:iterator>
                    </s:if>
                    <s:else>
                        <s:iterator var="a" value="lista_ropa_Cesta_NoLog">
                            <hr class="linea_divisoria_articulos">
                            <table> 
                                <thead >
                                    <tr>
                                        <td class="bold" style="padding-bottom: 10px;" colspan="3">
                                            <a href="Detalles.html">
                                                <span class="titulo_Producto_Cesta">
                                                    <s:property value="#a.ropaStock.ropa.roDescripcion"/>
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                </thead>
                                <tr>
                                    <td rowspan="4" style="padding-right: 100px;">
                                        <s:a action="RopaPopUp">
                                            <% cero = 0; %>
                                            <s:param name="roId" value="#a.ropaStock.ropa.roId"/>
                                            <s:iterator var="f" value="#a.ropaStock.ropa.fotoses">
                                                <% if (cero < 1) {%>
                                                <img  id="cesta_Img" src="<s:url value='../Imagenes/%{#a.ropaStock.ropa.categoria.catDescripcion}/%{#a.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />" />
                                                <% cero++;
                                                    }%>
                                            </s:iterator>
                                        </s:a>
                                    </td>
                                    <td>Color:</td>
                                    <td>
                                        <div id="color1" style="background-color: <s:property value="#a.ropaStock.color.colorDescripcion"/>;">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Talla:</td>
                                    <td>
                                        <s:property value="#a.ropaStock.tallas.tallaDescripcion"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Precio individual:
                                    </td>
                                    <td>
                                        <s:property value="getText('{0,number,##0.00}',{#a.ropaStock.ropa.roPrecio - (#a.ropaStock.ropa.roPrecio * #a.ropaStock.ropa.roDescuento / 100)})"/> €
                                    </td>
                                </tr>
                                <tr>
                                    <td  style='padding-top: 2px;'>
                                        Cantidad:
                                    </td>
                                    <td>

                                        <s:form id="formCantidad" action="CestaFiltro" theme="simple" method="post">
                                            <input type="hidden" name="accionocul" value="e"/>
                                            <input type="hidden" name="clave" id="clave"/>
                                            <input type="hidden" name="clave" id="idusu" value="<s:property value="sesion.cookieLogueado.nluNick"/>"/>
                                            <img src="../Imagenes/Administracion/Signo_Menos.png" id="menos-<s:property value="#a.ropaStock.ropa.roId"/>-<s:property value="#a.ropaStock.color.colorId"/>-<s:property value="#a.ropaStock.tallas.tallaId"/>"
                                                 style="cursor:pointer; width: 30px; padding-top: 13px;"/>
                                            &nbsp;
                                            <input type="text" name="cantidad" id="cantidadIndividual<s:property value="#a.ropaStock.ropa.roId"/>" readonly="readonly" 
                                                   style="width: 25px;text-align: center;" value="<s:property value="#a.nlcUnidades"/>">
                                            &nbsp;
                                            <img src="../Imagenes/Administracion/Signo_Mas.png" id="mas-<s:property value="#a.ropaStock.ropa.roId"/>-<s:property value="#a.ropaStock.color.colorId"/>-<s:property value="#a.ropaStock.tallas.tallaId"/>" 
                                                 style="cursor:pointer; width: 30px; padding-top: 13px;" />
                                        </s:form>
                                        <script>

                                             $(document).ready(function () {
                                                $('body').on('click', '#items_en_uso img', function(){
                                                   var a =  $(this).attr('id')
                                                   var even = a.split('-');
                                                   var masmenos = even[0];
                                                   var idropa = even[1];
                                                   var idcolor = even[2];
                                                   var idtalla = even[3];
                                                   $("#roid").val(idropa); 
                                                   $("#colorid").val(idcolor);  
                                                   $("#tallaid").val(idtalla); 
                                                   if(masmenos == "mas"){
                                                        usarAJAX("+");
                                                   }else{
                                                       usarAJAX("-");
                                                   }
                                                })                                           
                                            });
                                            function usarAJAX(value) { 

                                                var unifact = document.getElementById('unifact').value;

                                                var concomaprefact = document.getElementById('prefact').value;
                                                var prefact = concomaprefact.replace(",", ".")
                                                var roid = document.getElementById('roid').value;
                                                var colorid = document.getElementById('colorid').value;
                                                var tallaid = document.getElementById('tallaid').value;
                                                var cantidadprenda =  document.getElementById('cantidadIndividual'+roid).value;
                                                var idusu =  document.getElementById('idusu').value;
                                                var masmenos = value;
                                                $.getJSON('ajaxsumaRestaRopa', {
                                                    roid: roid, colorid: colorid, tallaid: tallaid, cantidadprenda: cantidadprenda, masmenos: masmenos, idusu: idusu, prefact: prefact, unifact: unifact
                                                }, function (jsonResponse) {
                                                     $("#cantidadIndividual"+roid).val(jsonResponse.scantidad);
                                                     $("#unifact").val(jsonResponse.sunifact);
                                                     $("#prefact").val(jsonResponse.sprefactura);
                                                     $("label[for='uni"+roid+"']").text(jsonResponse.scantidad);
                                                     $("label[for='total"+roid+"']").text(jsonResponse.stotal);
                                                     $("label[for='unifact']").text(jsonResponse.sunifact);
                                                     $("label[for='prefact']").text(jsonResponse.sprefactura);      
                                                });
                                            }
                                        </script>
                                    </td>  
                                </tr>
                                <tr>
                                    <td></td><td style="width:180px;">
                                        Importe por <label for="uni<s:property value="#a.ropaStock.ropa.roId"/>"><s:property value="#a.nlcUnidades"/></label>  prendas:
                                    </td>
                                    <td>
                                        <label for="total<s:property value="#a.ropaStock.ropa.roId"/>"><s:property value="getText('{0,number,##0.00}',{#a.nlcUnidades * (#a.ropaStock.ropa.roPrecio - (#a.ropaStock.ropa.roPrecio * #a.ropaStock.ropa.roDescuento / 100))})"/></label>€

                                    </td>
                                </tr>
                                <tr>
                                    <td id="Stock_Excedido<s:property value="#a.nlcId"/>" colspan="3" style="color:red; position:absolute; margin-left: 220px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <s:a action="CestaFiltro">
                                            <s:param name="cantidad" value="0"/>
                                            <s:param name="accionocul" value="'e'"/>
                                            <s:param name="clave" value="#a.nlcId"/>
                                            <div class="btn_Elminar_Producto">Eliminar</div>
                                        </s:a>
                                    </td>
                                </tr>
                            </table>
                            <s:set var="cantidadRopa" value="%{#cantidadRopa + 1}"/>
                        </s:iterator>
                        
                    </s:else>
                        </div>
                    <s:if test="#cantidadRopa > 0">    
                        <s:form id="frm" action="Pagar" method="POST" theme="simple">
                            <div id="contenedor_Pagar">
                                <div id="pagar">
                                    
                                    <table>                            
                                        <tr class="apartados_Pagar">
                                            <td colspan="2" class="bold apartados_Pagar">
                                                <span class="apartados_Pagar" style="padding-bottom: 50px;">Datos de Envío<br></span>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 5px;">
                                                Dirección: 
                                            </td>                            
                                            <td style="padding-top: 5px;">
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.usuDireccion"/>
                                                </s:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ciudad: 
                                            </td>                            
                                            <td>
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.usuLocalidad"/>
                                                </s:if>
                                            </td>  
                                        </tr>
                                        <tr>
                                            <td>
                                                Código Postal: 
                                            </td>                            
                                            <td>
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.usuCp"/>
                                                </s:if>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td>
                                                Provincia: 
                                            </td>                            
                                            <td>
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.provincias.proNombre"/>
                                                </s:if>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td>
                                                País: 
                                            </td>                            
                                            <td>
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.provincias.paises.paisNombre"/>
                                                </s:if>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td>
                                                Titular: 
                                            </td>                            
                                            <td>
                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                    <s:property value="u.usuNombre"/> <s:property value="u.usuApellidos"/>
                                                </s:if>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="bold" style="padding-top: 10px;">
                                                Artículos
                                            </td>                           
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 5px;">
                                                Cantidad
                                            </td>                            
                                            <td style="padding-top: 5px;">
                                                <label for="unifact"><s:property value="cantidad"/></label>
                                                
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td>
                                                Total
                                            </td>                            
                                            <td>
                                                <label for="prefact"><s:property value="getText('{0,number,##0.00}',{precio})"/></label>€
                                                
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="bold" style="padding-top: 10px;">
                                                Métodos de pago
                                            </td>                           
                                        </tr>
                                        <tr>                                                        
                                            <td colspan="2">
                                                <img id="metodo_Img" src="../Imagenes/Administracion/Pago/Metodos_Pago.PNG" alt="" />
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="bold" style="padding-top: 10px;">
                                                Observaciones
                                            </td>
                                        </tr>
                                        <tr>                                    
                                            <td colspan="10">
                                                <s:textarea label="Observaciones" name="obs" cols="46" rows="2" theme="simple"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" id="botonEnvio">
                                                <div style="margin-left: 150px" id="añadircesta_Btn">
                                                    <div onclick="enviarPedido();">Realizar Pedido</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </s:form>
                    </s:if>
                    <s:else>
                        <div id="cestaVacia">La cesta está vacía</div>
                    </s:else>
                </div>
            </div>
            <s:include value="tiendaFooter.jsp" />
        </div>
        <img id="espera" src="../Imagenes/Administracion/espera.gif" width="50"/>
    </body>
</html>
