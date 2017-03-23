<%-- 
    Document   : tiendaDetalles
    Created on : 12-ene-2017, 23:52:13
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

        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script>              
        <script>
            window.onload = muestra_Cantidad;            
        </script>
        <title><s:property value="t.roDescripcion"/></title>
            
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

        <script>
            var ventana;
            function abrir(rostockId){
                ventana = window.open("tiendaCestaPopUp.jsp?clave="+rostockId,"TallaYColor","width=300,height=300, resizable=no, scrollbars=no, menubar=no");
                /*ventana.document.write(document.getElementById('color')+'<br>');*/
            }
        </script>
        <script>            
            function ValidoDetalles(){
                if(document.getElementById('colorOculto').value == ''){
                    alert("Debe seleccionar un color");
                }else{
                    document.getElementById('frm').submit();
                }
            }
            
            function elijoColor(elegido,id) {
                var obj = document.getElementById('coloresDiv').getElementsByTagName('div');
                for(var i=0;i<obj.length;i++){
                    if(i == (elegido-1)){
                        obj[i].className = 'color_Elegido';
                    }else{
                        obj[i].className = 'color_No_Elegido';
                    }
                }
                document.getElementById('colorOculto').value = id;
                usarAJAXColor();
            }
            
            function usarAJAXColor(){
                var valorColor = document.getElementById('colorOculto').value;
                var valorRopa = document.getElementById('ropa').value;
                $.getJSON('ajaxTallas', {
                    color2 : valorColor,
                    roId2 : valorRopa
                }, function(jsonResponse2) { 
                    var select2 = $('#tallaMuchosColores');
                    select2.find('option').remove();
                    var aux = 0;
                    $.each(jsonResponse2.stateMap2, function(key, value) {
                        if(aux < 1){
                            aux = key;
                        }
                        $('<option>').val(key).text(value).appendTo(select2);
                    });
                    cambioMaximo(aux);
                });
            }
            
            function cambioMaximo(tallaId){
                var valorColor = document.getElementById('colorOculto').value;
                var valorRopa = document.getElementById('ropa').value;
                $.getJSON('ajaxMaximo', {
                    color2 : valorColor,
                    roId2 : valorRopa,
                    tallas2 : tallaId
                }, function(jsonResponse2) {
                    var select3 = document.getElementById('cantidad');
                    select3.value = 1;
                    $.each(jsonResponse2.stateMap2, function(key, value) {
                        select3.setAttribute('max',value);
                    });
                });
            }
        </script>
    </head>

    <body>
        <div id="todo">
            <div id="header">
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
                <div id="idioma">
                    <img src="../Imagenes/Administracion/flag_spain_blog.png" alt=""/>
                    <img src="../Imagenes/Administracion/lrgscaleunited_kingdom_great_british_union_jack_flag.png" alt=""/>
                </div>
                <div id="cesta">
                    <s:if test="sesion.usuarioLogueado.usuAdministrador!=1">
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
                            <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta"/>
                            <div id="cantidad_Cesta"><s:property value="totalcestaUsuario"/></div>
                            <s:if test="%{totalcestaUsuario > 0}">
                            <s:set var="importeTotal" value="0"/>
                            <table id="cesta_Hover">
                                <s:iterator var="c" value="lista_ropa_Cestas">
                                    <tr style="">
                                        <td class="img_CestaPreview">
                                            Artículo:<br>
                                            <% int cero = 0; %>
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
                    <s:if test="sesion.usuarioLogueado.usuAdministrador==1">
                        <s:form action="RopaAdminFiltro" theme="simple">
                            <s:submit value="Admin"></s:submit>                    
                        </s:form>
                    </s:if>
                </div>
                <div id="iniciar_Sesion">
                    <s:if test="usi==''">
                        <a href="#"> 
                            <div id="mi_Cuenta_Txt">Mi Cuenta</div>
                        </a>                    
                        <s:form action="TiendaLogin" theme="simple">
                            <div id="login">                                        
                                <table >
                                    <tr>
                                        <td><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>
                                            <s:textfield name="usuario" class="btn btn-default" aria-label="Left Align" style="text-align: left; color: gray" />
                                            <s:fielderror fieldName="usuario" theme="simple"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <span class="glyphicon glyphicon-lock" aria-hidden="true" ></span>
                                            <s:password name="password" class="btn btn-default" style="text-align: left; color: gray" aria-label="Left Align" />
                                            <s:fielderror fieldName="password" />
                                            <input type="hidden" name="mensajeError" value="<s:property value="mensajeError"/>"/>
                                            <s:property value="mensajeError"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <s:submit value="Acceder" style="margin: 0 auto" class="btn btn-default"/>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            ¿Nuevo Cliente? <s:a action="UsuAlta" ><s:param name="accion" value="'a'"/>¡Regístrate!</s:a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                        </s:form>
                    </s:if>
                    <s:if test="sesion.usuarioLogueado.usuId!=''">                    
                        <a href="#"> 
                            <div id="mi_Cuenta_Txt">¡Bienvenido <s:property value="sesion.usuarioLogueado.usuNombre"/>!</div>
                        </a>

                        <div id="login" style="width: 50px; margin-right: 50px; margin-top: 0px;">                                        
                            <s:a action="TiendaCerrarSesion" >
                                <button style="margin: 0 auto" class="btn btn-default">Cerrar Sesión</button>
                            </s:a>
                        </div>
                    </s:if>
                </div>
                <s:if test="mensajeError == null"><script>fijarLogin('none');</script></s:if>
                <s:else><script>fijarLogin('block');</script></s:else>
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
                <s:a action="listaDeseos"><div id="lista_Deseos_Txt">Lista de deseos <span class="glyphicon glyphicon-star" style="color: black;"></span>  &nbsp;<span class="sin_Decoracion">|</span></div></s:a>
                </div>
            </div>
            <div id="linea1" class="linea"></div>
            <div id="menu_Desplegable">
                <img src="../Imagenes/Administracion/afdf338882d16dd2b1360aa975b18111.png" alt="" style="width: 30px; margin-right: 10px; opacity: 0.9;"/>
                <div id="menu_Tabla">
                    <table>
                        <s:if test="sesion.usuarioLogueado.usuId!=''">
                            <tr>
                                <td class="con_Borde">
                                    <s:a action="UsuAlta" >
                                        <span class="glyphicon glyphicon-user"></span> Cuenta
                                        <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                                        <s:param name="accion" value="'m'"/>
                                    </s:a>
                                </td>
                            </tr>
                            <tr>
                                <td class="con_Borde">
                                    <s:a action="pedidos">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> Pedidos
                                        <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                                    </s:a>
                                    </a>
                                </td>
                            </tr>
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
                    <input type="hidden" name="clientela" value=""/>
                    <input type="hidden" name="categoria" value=""/>
                    <input type="hidden" name="clientela2" value=""/>
                    <input type="hidden" name="categoria2" value=""/>
                    <input type="hidden" name="marcas2" value=""/>
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
                                            <s:param name="clientela2" value="#a.clientela.clientelaId"/>
                                            <s:param name="categoria2" value="#a.categoria.catId"/>
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
                                        <s:param name="clientela2" value="#a.clientela.clientelaId"/>
                                        <s:param name="categoria2" value="#a.categoria.catId"/>
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
                                        <s:param name="marcas2" value="#a.marcaId"/>
                                    </s:a></li>
                            </s:iterator>                       
                        </ul>                 
                    </li>                    
                </ul>                
            </div>
            <div id="linea2" class="linea"></div>
            <div id="ruta_Navegacion">
                <s:a action="Tienda">Inicio</s:a> > 
                <s:a action="TiendaMenu">
                    <s:param name="clientela2" value="%{clientela2}"/>
                    <s:param name="categoria2" value="%{categoria2}"/>
                    <s:param name="marcas2" value="%{marcas2}"/>
                    <s:param name="campania" value="campania"/>
                    <s:if test="(marcas2==null && clientela2!=null) || (marcas2=='' && clientela2!='')"><s:property value="categoria"/> <s:property value="clientela"/></s:if>
                    <s:elseif test="(marcas2==null && clientela2==null && campania==null) || (marcas2=='' && clientela2=='' && campania=='')">Todas las ventas</s:elseif>
                    <s:elseif test="(marcas2==null && campania!=null) || (marcas2=='' && campania!='')"><s:property value="campaniaNombre"/></s:elseif>
                    <s:else><s:property value="marca"/></s:else>
                </s:a> > 
                <s:property value="t.roDescripcion"/>
            </div>
            <div id="contenido_Detalles">
            <s:form id="frm" action="TiendaCesta" method="POST" theme="simple">
                <input type='hidden' name='clientela2' value='<s:property value="clientela2"/>'/>
                <input type='hidden' name='categoria2' value='<s:property value="categoria2"/>'/>
                <input type='hidden' name='marcas2' value='<s:property value="marcas2"/>'/>
                <input type='hidden' name='campania' value='<s:property value="campania"/>'/>
                <input type='hidden' name="accionocul" value="'c'"/>
                <input type='hidden' name='ropa' id='ropa' value='<s:property value="roId"/>'/>
                <div class="nombre_Detalle">
                    <s:property value="t.roDescripcion"/>
                </div>
                <br>
                <s:set var="contador" value="0"/>           
                <s:iterator var="f" value="t.fotoses">
                    <s:if test="#contador < 1">
                        <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails" 
                             style="margin-left: 240px;
                             left: 0px;
                             padding-left: 0px;
                             float: left;" >
                            <a href="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>"  >
                                <img class="img_Principal" src="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="" />
                            </a>
                        </div>
                        <s:set var="contador" value="%{#contador + 1}"/>
                    </s:if>
                </s:iterator>

                <div class="detalle_info" style="z-index: 200">
                    <table>                    
                        <tr>
                            <td>Color:</td>
                            <td>
                                <div id="coloresDiv">
                                <% int cantColores = 0; %>
                                <s:iterator value="lista_colores" var="col">
                                    <% cantColores++; %>
                                    <div id="color1" onclick="elijoColor(<%=cantColores%>,<s:property value="#col.colorId"/>);" class="color_No_Elegido" 
                                         style="background-color: <s:property value="#col.colorDescripcion"/>;"></div>
                                </s:iterator>
                                <% if(cantColores == 1){ %>
                                    <s:iterator value="lista_colores" var="col">
                                        <input type='hidden' name='color' id='colorOculto' value='<s:property value="#col.colorId"/>'/>
                                    </s:iterator>
                                <% }else{ %>
                                    <input type='hidden' name='color' id='colorOculto' value=''/>
                                <% } %>
                                </div>
                            </td>
                        </tr>                        
                        <tr>
                            <td>Selecione talla:</td>
                            <td>
                                <% if(cantColores == 1){ %>
                                    <s:select name="talla" list="lista_tallas" listValue="tallaDescripcion" 
                                              listKey="tallaId" onchange="cambioMaximo(this.value);"/>
                                <% }else{ %>
                                    <s:select id="tallaMuchosColores" name="talla" 
                                              list="{'Seleccione Color'}" onchange="cambioMaximo(this.value);"/>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Precio:
                            </td>
                            <td>
                                <span style="text-decoration: line-through; font-size: 15px; color: #999999; font-weight: bold" ><s:property value="precio"/></span><span style="padding-left: 10px; font-size: 15px; font-weight: bold;"><s:property value="precioConDescuento"/> €</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Cantidad: 
                            </td>                            
                            <td>
                                <input type="number" id="cantidad" name="cantidad" min="1" max="<s:property value="%{maximo}"/>" step="1" value="1">
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <button type="button" onclick="ValidoDetalles();" id="añadircesta_Btn">
                                    <div>Añadir a la Cesta</div>
                                </button>
                            </td>
                            <td>
                                <div id="añadirfavoritos_Btn">Añadir a Favoritos</div>
                            </td>
                        </tr>                        
                    </table>
                </div>
                <table class="mas_Fotos thumbnails">                    
                    <s:iterator var="f" value="t.fotoses">
                        <tr>
                            <td>
                                <a  href="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" data-standard="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>">
                                    <img src="<s:url value='../Imagenes/%{t.categoria.catDescripcion}/%{t.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt=""/>
                                </a>
                            </td>
                        </tr>
                    </s:iterator>
<!--                    <tr>
                        <td>
                            <a  href="../Imagenes/Administracion/Vestidos/Detalles/663786008_184_2.jpg" data-standard="../Imagenes/Administracion/Vestidos/Detalles/663786008_184_2.jpg">
                                <img src="../Imagenes/Administracion/Vestidos/Detalles/663786008_184_2.jpg" alt=""/>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="fancybox" href="../Imagenes/Administracion/Vestidos/Detalles/663786009_563_2.jpg" data-standard="../Imagenes/Administracion/Vestidos/Detalles/663786009_563_2.jpg">
                                <img src="../Imagenes/Administracion/Vestidos/Detalles/663786009_563_2.jpg" alt=""/>
                            </a>
                        </td>
                    </tr>    
                    <tr>
                        <td>
                            <a class="fancybox" data-fancybox-group="thumb" href="../Imagenes/Administracion/Vestidos/Detalles/663786002_393_2.jpg" data-standard="../Imagenes/Administracion/Vestidos/Detalles/663786002_393_2.jpg">
                                <img src="../Imagenes/Administracion/Vestidos/Detalles/663786002_393_2.jpg" alt=""/>
                            </a>
                        </td>
                    </tr>-->
                </table>               
            </s:form>
            </div>            
            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="../Scripts/easyzoom.js"></script>
            <script>
                // Instantiate EasyZoom instances
                var $easyzoom = $('.easyzoom').easyZoom();

                // Setup thumbnails example
                var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

                $('.thumbnails').on('click', 'a', function (e) {
                    var $this = $(this);

                    e.preventDefault();

                    // Use EasyZoom's `swap` method
                    api1.swap($this.data('standard'), $this.attr('href'));
                });

                // Setup toggles example
                var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

                $('.toggle').on('click', function () {
                    var $this = $(this);

                    if ($this.data("active") === true) {
                        $this.text("Switch on").data("active", false);
                        api2.teardown();
                    } else {
                        $this.text("Switch off").data("active", true);
                        api2._init();
                    }
                });
            </script>
            <s:include value="tiendaFooter.jsp" />
        </div>
    </body>
</html>