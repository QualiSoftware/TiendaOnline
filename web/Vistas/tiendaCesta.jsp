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
        <script>
            window.onload = cesta_Aniadir;            
        </script>
        <title>MyLook - Cesta</title>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <span class="glyphicon glyphicon-lock" aria-hidden="true" ></span>
                                            <s:password name="password" class="btn btn-default" style="text-align: left; color: gray" aria-label="Left Align" />
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
                <div id="apadrina">
                    <a href="#"><div id="apadrina_Txt">Apadrina  &nbsp;<span class="sin_Decoracion">|</span></div>
                    </a>
                </div>

                <div id="quienes_Somos">
                    <a href="#"><div id="quienes_Somos_Txt"> ¿Quiénes somos? &nbsp; <span class="sin_Decoracion">|</span></div></a>

                </div>
                <div id="contacto">
                    <a href="#"><div id="contacto_Txt">Contacto  &nbsp;<span class="sin_Decoracion">|</span></div>
                    </a>
                </div>
                <div id="lista_Deseos">
                    <a href="#"><div id="lista_Deseos_Txt">Lista de deseos <span class="glyphicon glyphicon-star" style="color: black;"></span>  &nbsp;<span class="sin_Decoracion">|</span></div>
                    </a>
                </div>
            </div>
            <div id="linea1" class="linea"></div>
            <div id="menu_Desplegable">
                <img src="../Imagenes/Administracion/afdf338882d16dd2b1360aa975b18111.png" alt="" style="width: 30px; margin-right: 10px; opacity: 0.9;"/>
                <div id="menu_Tabla">
                    <table>
                        <tr>
                            <td class="con_Borde">
                                <a href="#"><span class="glyphicon glyphicon-user"></span> Cuenta</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="con_Borde">
                                <a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Pedidos &nbsp;&nbsp;&nbsp;&nbsp;</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="con_Borde">
                                <a href="#"><span class="glyphicon glyphicon-question-sign"></span> Ayuda</a>
                            </td>
                        </tr>                        
                        <tr>
                            <td >
                                <a href="#"><span class="glyphicon glyphicon-option-vertical"></span> Otros</a>
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
            <div class="linea" style="height: 0.2em;"></div>
            <div id="contenido_Detalles">
                <div id="cesta_Titulo">Mi Cesta <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta_Titulo"/></div>
                <div class="detalle_info_Cesta">
                    
                <s:iterator var="a" value="lista_ropa_Cestas">
                    <hr>
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
                            <td rowspan="4">
                                <s:a action="RopaPopUp">
                                    <s:param name="roId" value="#a.ropaStock.ropa.roId"/>
                                    <% int cero=0; %>
                                    <s:iterator var="f" value="#a.ropaStock.ropa.fotoses">
                                        <% if(cero<1){%>
                                        <img  id="cesta_Img" src="<s:url value='../Imagenes/%{#a.ropaStock.ropa.categoria.catDescripcion}/%{#a.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />" width="120" />
                                        <% cero++;}%>
                                    </s:iterator>
                                </s:a>
                            </td>
                            <td>Color:</td>
                            <td>
                                <div id="color1" class="color_Box"></div> <s:property value="#a.ropaStock.color.colorDescripcion"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Selecione talla:</td>
                            <td>
                                <s:property value="#a.ropaStock.tallas.tallaDescripcion"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Precio:
                            </td>
                            <td>
                                <s:property value="getText('{0,number,##0.00}',{#a.ropaStock.ropa.roPrecio - (#a.ropaStock.ropa.roPrecio * #a.ropaStock.ropa.roDescuento / 100)})"/> €
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Cantidad
                            </td>
                            <td>
                                <s:form action="CestaFiltro" theme="simple" method="post">
                                    <input type="number" name="cantidad" min="1" step="1" value="<s:property value="#a.cestaUnidades"/>">
                                    <input type="hidden" name="accionocul" value="e"/>
                                    <input type="hidden" name="clave" value="<s:property value="#a.cestaId"/>"/>
                                    <button><div class="btn_Elminar_Producto">Modificar Cantidad</div></button>
                                </s:form>
                            </td>                        
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
                </s:iterator>
                    
                    
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
                                        <s:property value="u.usuDireccion"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Ciudad: 
                                    </td>                            
                                    <td>
                                        <s:property value="u.usuLocalidad"/>
                                    </td>  
                                </tr>
                                <tr>
                                    <td>
                                        Código Postal: 
                                    </td>                            
                                    <td>
                                        <s:property value="u.usuCp"/>
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        Provincia: 
                                    </td>                            
                                    <td>
                                        <s:property value="u.provincias.proNombre"/>
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        País: 
                                    </td>                            
                                    <td>
                                        <s:property value="u.provincias.paises.paisNombre"/>
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        Titular: 
                                    </td>                            
                                    <td>
                                        <s:property value="u.usuNombre"/> <s:property value="u.usuApellidos"/>
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
                                        <s:property value="cantidad"/>
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        Total
                                    </td>                            
                                    <td>
                                        <s:property value="precio"/>€
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
                                    <td colspan="2" >
                                        <button type="submit" style="margin-left: 150px" id="añadircesta_Btn">
                                            <div>Realizar Pedido</div>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </s:form>
                </div>
            </div>
            <s:include value="tiendaFooter.jsp" />
        </div>
    </body>
</html>