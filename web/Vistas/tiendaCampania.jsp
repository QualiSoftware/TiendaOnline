<%-- 
    Document   : tiendaCampania
    Created on : 15-dic-2016
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

        <title>Campaña</title>
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
                        <s:property value="mensajeError" />
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" />
                            
                                <s:property value="totalcestaUsuario"/>
                                <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta"/>
                                
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
                            <!--
                            <s:a action="UsuAlta" >
                                <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                                <s:param name="accion" value="'m'"/>
                                <button style="margin: 0 auto" class="btn btn-default">Modificar Usuario</button>
                            </s:a>
                            <s:a action="UsuAlta" >
                                <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                                <s:param name="accion" value="'e'"/>
                                <button style="margin: 0 auto" class="btn btn-default">Eliminar usuario</button>
                            </s:a>
                            -->
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

            <div id="filtro">                
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Búsqueda">
                    </div>
                    <button style="position: absolute; top:8px; left: 215px;" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                </form>
            </div>
            <div id="menu">
                <ul class="nav nav-pills">
                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" style="font-weight: normal;">TODAS LA VENTAS</a>

                    </li>                    
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-weight: normal;">MUJER <b class="caret"></b></a>
                        <ul class="dropdown-menu" id="Mujer">
                            <s:iterator var="a" value= "lista_menu_ropa">
                                <s:if test="#a.clientela.clientelaDescripcion=='Mujer'">
                                    <li><s:a action="TiendaCampanias">
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
                                    <li><s:a action="TiendaCampanias">
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
                                <li><s:a action="">
                                        <s:property value="#a.marcaNombre"/>
                                        <s:param name="marcaId" value="#a.marcas.marcaId"/>
                                    </s:a></li>
                            </s:iterator>                       
                        </ul>                 
                    </li>                    
                </ul>                
            </div>
            <div id="linea2" class="linea"></div>
            <div id="contenido">
                <div id="ruta_Navegacion">
                    <s:a action="Tienda">Inicio</s:a> > <s:property value="categoria"/> <s:property value="clientela"/>
                </div>
                <div id="nombre_Categoria">
                    <s:property value="categoria"/> <s:property value="clientela"/>
                </div>
                <div id="productos" style="margin-top: 50px;">
                    <s:iterator var="m" value="lista_ropa">
                        <table  class="imgproducto">                                                    
                            <tr class="botones_prueba">
                                <td><a href="Detalles.html">
                                        <%int aux = 0;%>
                                        <s:iterator var="f" value="fotoses">
                                            <%
                                            if(aux==0){
                                            %>
                                                <img src="<s:url value='../Imagenes/%{#m.categoria.catDescripcion}/%{#m.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />" />
                                            <%
                                            }
                                            aux++;
                                            %>
                                        </s:iterator>
                                    </a>
                                    <div id="botones_Galeria">
                                        <div id="vista_Rapida_Img">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <img src="../Imagenes/Administracion/eye.png" title="Vista Rápida" style="box-shadow: 0px 0px 0px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div id="vista_Rapida">
                                                <table border="0" >                                                
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="2" style="font-weight: bold; padding: 10px;"><s:property value="#m.roDescripcion"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Precio</td>
                                                            <td><s:property value="getText('{0,number,##0.00}',{#m.roPrecio - (#m.roPrecio * #m.roDescuento / 100)})"/> €</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Color</td>
                                                            <td><span style="width: 200px; height: 20px; background-color: red; color: red">....</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Talla</td>
                                                            <td>
                                                                <s:if test="#m.tallas.tallaDescripcion!='XXL'">
                                                                    <span style="text-decoration:line-through;">
                                                                </s:if>
                                                                    XXL
                                                                <s:if test="#m.tallas.tallaDescripcion!='XXL'">
                                                                    </span>
                                                                </s:if>
                                                                <br>
                                                                <s:if test="#m.tallas.tallaDescripcion!='XL'">
                                                                    <span style="text-decoration:line-through;">
                                                                </s:if>
                                                                    XL
                                                                <s:if test="#m.tallas.tallaDescripcion!='XL'">
                                                                    </span>
                                                                </s:if>
                                                                <br>
                                                                <s:if test="#m.tallas.tallaDescripcion!='L'">
                                                                    <span style="text-decoration:line-through;">
                                                                </s:if>
                                                                    L
                                                                <s:if test="#m.tallas.tallaDescripcion!='L'">
                                                                    </span>
                                                                </s:if>
                                                                <br>
                                                                <s:if test="#m.tallas.tallaDescripcion!='M'">
                                                                    <span style="text-decoration:line-through;">
                                                                </s:if>
                                                                    M
                                                                <s:if test="#m.tallas.tallaDescripcion!='M'">
                                                                    </span>
                                                                </s:if>
                                                                <br>
                                                                <s:if test="#m.tallas.tallaDescripcion!='S'">
                                                                    <span style="text-decoration:line-through;">
                                                                </s:if>
                                                                    S
                                                                <s:if test="#m.tallas.tallaDescripcion!='S'">
                                                                    </span>
                                                                </s:if>
                                                                <br><br>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Imagenes/Administracion/bRTdpoqi9.png" title="Аñadir a Favoritos" style="box-shadow:  0px 0px 0px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="../Imagenes/Administracion/shopping-basket-xxl.png" title="Añadir a la Cesta" style="box-shadow: 0px 0px 0px;"><br><span style="color: white">Vista &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favoritos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cesta</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <span style="font-size: 15px; text-align: left"> <s:property value="#m.roDescripcion"/></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <span style="text-decoration: line-through; font-size: 20px; color: #999999; font-weight: bold" ><s:property value="getText('{0,number,##0.00}',{#m.roPrecio})"/> €</span><span style="padding-left: 10px; font-size: 20px; font-weight: bold;"><s:property value="getText('{0,number,##0.00}',{#m.roPrecio - (#m.roPrecio * #m.roDescuento / 100)})"/> €</span>
                                </td>
                            </tr>
                        </table>
                    </s:iterator>
                </div>
                    <!--
                    <table  class="imgproducto">                        

                        <tr>
                            <td ><img src="../Imagenes/Administracion/Vestidos/10990034_1.jpg" alt=""/> </td>                            

                        </tr> 
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold;">99€ </span>
                            </td>
                        </tr>
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/1974ebaa615d81f5200ed88b731d7d36.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold;">99€ </span>
                            </td>
                        </tr>                       
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/2014-Sxey-font-b-Vintage-b-font-font-b-Wedding-b-font-font-b-Dresses-b.jpg" alt=""/></td>                            
                        </tr>    
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€ </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="font-size: 18px;"> &nbsp;(-17,5%) </span>
                            </td>
                        </tr>
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/664679695_504.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>
                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/664888915_759.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/665032598_441.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/Bata-sobre-la-rodilla-Mini-mangas-v-cuello-de-Organza-una-línea-sin-respaldo-cremallera-vestidos.jpg" alt=""/></td>                            
                        </tr> 
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/New-Arrival-Free-Shipping-Strapless-Bridal-Gown-Black-font-b-Designer-b-font-font-b-Wedding.jpg" alt=""/></td>                            
                        </tr> 
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/HTB1lhR_HpXXXXa7apXXq6xXFXXXH.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/vestido_fiesta_coral_2-554x800.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/vestido_otono-554x800.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/opción-1014.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/vestido-largo-culito-.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/ON321C0D4-K11@12.jpg" alt=""/></td>                            
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>                        
                    </table>
                    <table  class="imgproducto">                        

                        <tr>
                            <td><img src="../Imagenes/Administracion/Vestidos/vestido-zac-posen.jpg" alt=""/></td>                            
                        </tr> 
                        <tr>
                            <td style="text-align: left">
                                <span style="font-size: 15px; text-align: left"> Vestido de Fiesta Salmón</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <span style=" font-size: 20px; font-weight: bold; color: red;">99€ </span><span style="text-decoration: line-through; font-size: 20px; font-weight: bold" > 120€</span>
                            </td>
                        </tr>
                    </table>
                    -->



                
            </div>
        </div>
        <div id="footer">
            <br><br>
            <div id="linea1" class="linea"></div>

            <footer class="footer-distributed">

                <div class="footer-left">

                    <h3>Tienda<span>Ropa</span></h3>

                    <p class="footer-links">
                        <a href="#">Inicio</a>
                        ·
                        <a href="#">Blog</a>
                        ·

                        <a href="#">Sobre nosotros</a>
                        ·
                        <a href="#">Faq</a>
                        ·
                        <a href="#">Contacto</a>
                    </p>

                    <p class="footer-company-name">Company Name &copy; 2015</p><br>
                    <img src="../Imagenes/Administracion/Footer/ts-trustmark_220.png" alt="" width="80"/>
                    <img src="../Imagenes/Administracion/Footer/tl_transp.gif" alt=""/>&nbsp;
                    <img src="../Imagenes/Administracion/Footer/confianza-ecommerce-seals.png" alt="" width="200"/>
                </div>

                <div class="footer-center">

                    <div>
                        <i class="fa fa-map-marker"></i>
                        <p><span>Calle Real 21</span> Puertollano, Esapaña</p>
                    </div>

                    <div>
                        <i class="fa fa-phone"></i>
                        <p>+34 666 478 989</p>
                    </div>

                    <div>
                        <i class="fa fa-envelope"></i>
                        <p><a href="mailto:support@company.com">tiendaropa@company.com</a></p>
                    </div><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="../Imagenes/Administracion/Footer/logo-nacex-grande-20-aniversario1.png" alt="" width="80"/>
                    <img src="../Imagenes/Administracion/Footer/ce.seur.1.png" alt="" width="80"/>
                    <img src="../Imagenes/Administracion/Footer/índice.png" alt="" width="60"/>
                </div>

                <div class="footer-right">

                    <p class="footer-company-about">
                        <span>Sobre nosotros</span>
                        Disponemos de materiales de alta calidad. Si tiene cualquier duda, no dude en contactar con nosotros. Estaremos encantados de atenderle.
                    </p>

                    <div class="footer-icons">

                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <br><br>
                        <img src="../Imagenes/Administracion/Footer/Captura.PNG" alt="" width="300"/>

                    </div>

                </div>

            </footer>
        </div>




    </body>
</html>