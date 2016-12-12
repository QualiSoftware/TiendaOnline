<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Favicon-->
        <link rel="shortcut icon" href="http://luislo.esy.es/Imagenes/Favicon house_hangers.png">        
        <!--Mis Estilos-->
        <link href="http://luislo.esy.es/Estilos/IndexEstilo.css" rel="stylesheet" type="text/css"/>
        <!--Bootstrap-->
        <link href="http://luislo.esy.es/Estilos/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--JQuery-->
        <script src="http://luislo.esy.es/Scripts/jquery_3.js"></script>
        <!--Carrusel de fotos-->
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js' type='text/javascript'></script>
        <script src="http://luislo.esy.es/Scripts/Carrusel.js" type="text/javascript"></script>
        <!-- Estilos Footer -->
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

        <title>Tienda Ropa</title>
    </head>

    <body>
        <div id="todo">            
            <div id="header">
                <div id="marca">Tienda Ropa <img src="http://luislo.esy.es/Imagenes/SH14171.jpg" alt="house_hangers" id="logo"/>
                </div>
                <div id="idioma">
                    <img src="http://luislo.esy.es/Imagenes/flag_spain_blog.png" alt=""/>
                    <img src="http://luislo.esy.es/Imagenes/lrgscaleunited_kingdom_great_british_union_jack_flag.png" alt=""/>
                </div>
                <div id="cesta">
                    <s:if test="sesion.usuarioLogueado.usuAdministrador!=1">
                        <s:property value="mensajeError" />
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" />
                            
                                <s:property value="totalcestaUsuario"/>
                                <img src="http://luislo.esy.es/Imagenes/Shopping-Cart-10.png" alt="" id="imgcesta"/>
                                
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
                                            <!--<input type="text" class="btn btn-default" aria-label="Left Align" style="text-align: left; color: gray" value="Jesús"><br>-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <span class="glyphicon glyphicon-lock" aria-hidden="true" ></span>
                                            <s:password name="password" class="btn btn-default" style="text-align: left; color: gray" aria-label="Left Align" />
                                            <!--<input type="password" class="btn btn-default" style="text-align: left; color: gray" aria-label="Left Align" value="contraseña"><br>-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="http://luislo.esy.es/index_1.html">
                                                <s:submit value="Acceder" style="margin: 0 auto" class="btn btn-default"/>
                                                <!--<button style="margin: 0 auto" class="btn btn-default">Acceder</button>-->
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
                <img src="http://luislo.esy.es/Imagenes/afdf338882d16dd2b1360aa975b18111.png" alt="" style="width: 30px; margin-right: 10px; opacity: 0.9;"/>
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
                            <li><a href="#">Zapatos</a></li>
                            <li><a href="http://luislo.esy.es/Vestidos.html">Vestidos</a></li>
                            <li><a href="#">Camisas</a></li>                                    
                            <li><a href="#">Americanas</a></li>
                            <li><a href="#">Calcetines</a></li>
                            <li><a href="#">Pantalones</a></li>
                            <li><a href="#">Camisetas</a></li>
                            <li><a href="#">Gorros</a></li>
                            <li><a href="#">Sombreros</a></li>
                            <li><a href="#">Bufandas</a></li>
                            <li><a href="#">Abrigos</a></li>
                            <li><a href="#">Tops</a></li>
                            <li><a href="#">Cazadoras</a></li>
                            <li><a href="#">Otros</a></li>                         
                        </ul>                 
                    </li>
                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" style="font-weight: normal;">HOMBRE <b class="caret"></b></a>
                        <ul class="dropdown-menu" id="hombre">            

                            <li><a href="#">Zapatos</a></li>
                            <li><a href="#">Trajes</a></li>
                            <li><a href="#">Camisas</a></li>                                    
                            <li><a href="#">Americanas</a></li>
                            <li><a href="#">Calcetines</a></li>
                            <li><a href="#">Pantalones</a></li>
                            <li><a href="#">Camisetas</a></li>
                            <li><a href="#">Gorros</a></li>
                            <li><a href="#">Sombreros</a></li>
                            <li><a href="#">Bufandas</a></li>
                            <li><a href="#">Abrigos</a></li>
                            <li><a href="#">Cazadoras</a></li>
                            <li><a href="#">Otros</a></li>                         
                        </ul>                 
                    </li>

                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" style="font-weight: normal;">MARCAS DE TEMPORADA <b class="caret"></b></a>
                        <ul class="dropdown-menu" >            

                            <li><a href="#">Pepe Jeans</a></li>                    
                            <li><a href="#">Levis</a></li>
                            <li><a href="#">Adidas</a></li>
                            <li><a href="#">Reebook</a></li>
                            <li><a href="#">Dolce & Gabanna</a></li>
                            <li><a href="#">Agatha Ruíz de la Prada</a></li>
                            <li><a href="#">New Balance</a></li>
                            <li><a href="#">Puma</a></li>
                            <li><a href="#">Asics</a></li>
                            <li><a href="#">Desigual</a></li>
                            <li><a href="#">Converse</a></li>                          
                        </ul>                 
                    </li>                    
                </ul>                
            </div>


            <div id="linea2" class="linea"></div>
            <div id="contenido"><br>
                <!--
                <div id="slider">
                    <div><img src="Imagenes/Carrusel/1.jpg" class="imgcarrusel" alt="" /></div>
                    <div><img src="Imagenes/Carrusel/2.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/3.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/4.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/clarissa2.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/maxresdefault2.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/mujer-en-ropa-inferior,-morena,-ropa-interior-de-color-rosa-227296.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/mujer-en-ropa-inferior,-morena,-ropa-interior-roja-211736.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/the-saturdays-1920x1080-wallpaper-4916.jpg" class="imgcarrusel" alt=""/></div>
                    <div><img src="Imagenes/Carrusel/tumblr_o5a1jvuobo1v6qbpno1_1280.png" alt="" class="imgcarrusel"/></div>                    
                </div>
                -->
                <div id="campañas_Titulo">
                    CAMPAÑAS</div>
                <div id="campagnas">
                    <s:iterator var="a" value="lista_campanias">                        
                            <table  class="imgproducto">                        
                                <tr>
                                    <td class="descuento"><span class="descuento_Txt">¡10% de Descuento!</span><span class="validez_Txt">Hasta el <s:property value="#a.camFin"/></span></td>
                                </tr>
                                <tr>
                                    <td><img src="../Imagenes/Campanias/<s:property value="#a.camFoto"/>" alt="<s:property value="#a.camNombre"/>"/></td>                            
                                </tr>                        
                            </table>                        
                    </s:iterator>
                </div>
                <div style="font-size: 50px; color: white;">prueba</div>
                <div id="linea" class="linea"></div>
                <div id="marcas_Titulo">
                    MARCAS
                </div>
                <div id="marcas">
                    <s:iterator var="m" value="lista_marcas">
                        <table  class="img_Marcas">                        
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td><img src="../Imagenes/Marcas/<s:property value="#m.marcaFoto"/>" alt="<s:property value="#m.marcaNombre"/>"/></td>                            
                            </tr>                        
                        </table>
                    </s:iterator>
                </div>
            </div>
        </div>
        <div id="footer">
            <br><br>
            <div id="line" class="linea"></div>

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
                    <img src="http://luislo.esy.es/Imagenes/Footer/ts-trustmark_220.png" alt="" width="80"/>
                    <img src="http://luislo.esy.es/Imagenes/Footer/tl_transp.gif" alt=""/>&nbsp;
                    <img src="http://luislo.esy.es/Imagenes/Footer/confianza-ecommerce-seals.png" alt="" width="200"/>
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
                    <span style="color: white; margin-left: -20px;">Tipos de pago aceptados</span><br><br>

                    <div id="tipo_Pago">

                        <img src="http://luislo.esy.es/Imagenes/Pago/Visa_logo.png" alt=""/>
                        <img src="http://luislo.esy.es/Imagenes/Pago/visa-electron-logo_0.png" alt=""/>
                        <img src="http://luislo.esy.es/Imagenes/Pago/MasterCard_Logo.svg.png" alt=""/>
                        <img src="http://luislo.esy.es/Imagenes/Pago/Maestro_logo.svg.png" alt=""/>
                        <img src="http://luislo.esy.es/Imagenes/Pago/paypal-logo.png" alt="" style="width: 52px"/>
                    </div>
                    <br><img src="http://luislo.esy.es/Imagenes/Pago/ssl-11.png" alt="" width="100" style="margin-left: 18px;"/>
                </div>

                <div class="footer-right">

                    <p class="footer-company-about">
                        <span style="font-size: 17px;">Sobre nosotros</span>
                        Disponemos de materiales de alta calidad. Si tiene cualquier duda, no dude en contactar con nosotros. Estaremos encantados de atenderle.
                    </p>

                    <div class="footer-icons">

                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <br><br>
                        <div id="tipo_Transporte">
                        <span style="color: white; margin-left: 0px;">Empresas de Transporte</span><br><br>
                        <img src="http://luislo.esy.es/Imagenes/Footer/ce.seur.1.png" alt="" width="80"/>
                        <img src="http://luislo.esy.es/Imagenes/Footer/índice.png" alt="" width="60"/>
                        <img src="http://luislo.esy.es/Imagenes/Footer/nacex.jpg" alt="" width="80"/>
                        </div>
                    </div>

                </div>

            </footer>
        </div>

        <div id="cookies">
            <div id="cookies">
                <p>Esta web utiliza cookies para obtener datos estadísticos de la navegación de sus usuarios. Si continúas navegando consideramos que aceptas su uso.
                    <a href="http://luislo.esy.es/politica-privacidad.php">Más información</a>
                    <a onclick="aceptar_cookies();" style="cursor:pointer;">X Cerrar</a></p>
            </div>
        </div>


    </body>
</html>