<%-- 
    Document   : tienda
    Created on : 12-dic-2016
    Author     : QualiSoftware
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Favicon-->
        <link rel="shortcut icon" href="../Imagenes/Administracion/Favicon.png">        
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
        
        <!-- hetor -->
        <!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="../theme/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="../theme/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="../theme/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="../theme/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="../theme/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../theme/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
        <script>
            window.onload = muestra_Cantidad;
        </script>

        <title>Super Look</title>       
    </head>

    <body>
        <s:include value="cargarCookie.jsp" />
        <!-- NUEVO -->
        <!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Bienvenidos a SuperLook!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="#"><s:a action="quienesSomos">¿Quiénes somos?</a></s:a></li>
                                                <li><a href="#"><s:a action="contacto">Contacto</a></s:a></li>
                                                <li><a href="#"><s:a action="apadrina">Apadrina</a></s:a></li>
						
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">ES <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">Español (ES)</a></li>
                                                                <li><a href="#">English (ENG)</a></li>
							</ul>
						</li>
                                                <!--
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">USD <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">USD ($)</a></li>
								<li><a href="#">EUR (€)</a></li>
							</ul>
						</li>
                                                -->
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					

					<!-- Search -->
					<div class="header-search">
						<form>
							<input class="input search-input" type="text" placeholder="Buscar ...">
                                                        <!--
							<select class="input search-categories">
								<option value="0">All Categories</option>
								<option value="1">Category 01</option>
								<option value="1">Category 02</option>
							</select>
                                                        -->
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				
                                <div class="center">
                                    <!-- Logo -->
                                    <div class="header-logo text-center">
                                            <a class="logo" href="#">
                                                    <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="">
                                            </a>
                                    </div>
                                    <!-- /Logo -->
                                </div>
                                
                                <div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">Mi cuenta <i class="fa fa-caret-down"></i></strong>
							</div>
							<a href="#" class="text-uppercase">Entrar</a> / <a href="#" class="text-uppercase">Unirse</a>
							<ul class="custom-menu">
                                                                <li><a href="#"><s:a action="listaDeseos"><i class="fa fa-heart-o"></i>Lista de deseos</s:a></li>
                                                                <li><a href="#"><s:a action="quienesSomos"><i class="fa fa-user-o"></i>Mi cuenta</s:a></li>
                                                                <!--
								<li><a href="#"><i class="fa fa-exchange"></i> Compare</a></li>
								<li><a href="#"><i class="fa fa-check"></i> Checkout</a></li>
								<li><a href="#"><i class="fa fa-unlock-alt"></i> Login</a></li>
								<li><a href="#"><i class="fa fa-user-plus"></i> Create An Account</a></li>
                                                                -->
							</ul>
						</li>
						<!-- /Account -->
                                                
                                                
                <div id="cesta">
                    
                    <s:if test="sesion.usuAdministrador!=1">
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
                            <img src="../Imagenes/Administracion/bolsa-compra-superlook.png" alt="" id="imgcesta"/>
                            <div id="cantidad_Cesta"><s:property value="totalcestaUsuario"/></div>
                            <s:if test="%{totalcestaUsuario > 0}">
                                <s:set var="importeTotal" value="0"/>
                                <table id="cesta_Hover">
                                   <%-- <% int cero = 0; %> --%>
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
                
                                                
                                                
                                                <!-- Cart -->
                                        
						<li class="header-cart dropdown default-dropdown">
                                                    <s:if test="sesion.usuAdministrador!=1">
                                                        <s:a action="CestaFiltro" theme="simple">
                                                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<img src="../Imagenes/Administracion/bolsa-compra-superlook.png" alt=""/>
									<span class="qty"><s:property value="totalcestaUsuario"/></span>
								</div>
								<strong class="text-uppercase">Mi Cesta:</strong>
								<br>
								<span><s:property value="getText('{0,number,##0.00}',{#importeTotal})"/> €</span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
                                                                    <s:if test="%{totalcestaUsuario > 0}">
                                                                        <s:set var="importeTotal" value="0"/>
									<div class="shopping-cart-list">
                                                                                <% int cero = 0; %>
                                                                                <s:if test="sesion.usuId!=null && sesion.usuId!=''">
                                                                                    <s:iterator var="c" value="lista_ropa_Cestas">
										<div class="product product-widget">
											<div class="product-thumb">
                                                                                            <% cero = 0; %>
                                                                                            <s:iterator var="f" value="#c.ropaStock.ropa.fotoses">
                                                                                                <% if (cero < 1) {%>
                                                                                                <img src="<s:url value='../Imagenes/%{#c.ropaStock.ropa.categoria.catDescripcion}/%{#c.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />"/>
                                                                                                <% cero++;
                                                                                                    }%>
                                                                                            </s:iterator>      
											</div>
											<div class="product-body">
												<h3 class="product-price">$32.50 <span class="qty">x3</span></h3>
												<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/thumb-product01.jpg" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price">$32.50 <span class="qty">x3</span></h3>
												<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
									</div>
									<div class="shopping-cart-btns">
										<button class="main-btn">View Cart</button>
										<button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->
        
        <!-- VIEJO -->
        <div id="todo">
            <div id="header">
                <!--
                <div id="marca">
                    <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="logo superlook" id="logo"/>
                </div>
                <div id="idioma">
                    <img src="../Imagenes/Administracion/flag_spain_blog.png" alt=""/>
                    <img src="../Imagenes/Administracion/lrgscaleunited_kingdom_great_british_union_jack_flag.png" alt=""/>
                </div>
                -->
                
                <div id="cesta">
                    
                    <s:if test="sesion.usuAdministrador!=1">
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
                            <img src="../Imagenes/Administracion/bolsa-compra-superlook.png" alt="" id="imgcesta"/>
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
                            <input type="hidden" name="actionName" value="Tienda.action"/>
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
                <s:if test="mensajeError == 'Usuario y/o contraseña erróneos'"><script>fijarLogin('block');</script></s:if>
                <!--    
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
                    -->
            </div>
            <div class="linea" style="height: 2px;"></div>
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
                    <!--            
                <div id="filtro" class="navbar-form navbar-left">
                <s:form role="search" action="Tienda" theme="simple">
                    <div class="form-group">
                        <input type="text" style="position: absolute; top:0px; left: 0px;" class="form-control" placeholder="Búsqueda" name="filtro" value="<s:property value="filtro"/>">
                    </div>
                    <button style="position: absolute; top:0px; left: 215px;" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </s:form>
            </div>
                    -->
            
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
            <div class="linea" style="height: 2px;"></div>
            <div id="contenido">
                <s:if test="lista_campaniasTienda.size > 0">
                    <br>
                    <!--                    <div id="campañas_Titulo">
                                            <div class="rellenoIzq" style="z-index: 0;"></div>
                                                <div class="campañas_titulo_Txt" style="z-index: 1;">CAMPAÑAS</div>
                                                <div class="rellenoDer" style="z-index: 0;"></div>
                                        </div>-->
                    <div id="campañas_titulo_Txt">CAMPAÑAS</div>
                    <div id="campagnas" >
                        <s:iterator var="a" value="lista_campaniasTienda">
                            <s:a action="TiendaMenu">
                                <table style="height: 250px; width: 350px;" class="imgproducto" >                        
                                    <tr>
                                        <td class="descuento"><span class="descuento_Txt">¡<s:property value="#a.camDescuento"/>% de Descuento!</span><span class="validez_Txt">Hasta el <s:date name="#a.camFin" format="dd/MM/yyyy"/></span></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <s:if test="#a.camFoto != ''">
                                                <img style="height: 250px; width: 350px;" id="prueba" onmouseover="this.style.cssText = 'opacity: 0.5; box-shadow: 5px 5px 5px black; -webkit-transition: 0.5s;'" onmouseout="this.style.cssText = 'opacity: 1; -webkit-transform: scale(1); -webkit-transition: 0.5s; box-shadow: 0px 0px 0px white;'" src="../Imagenes/Campanias/<s:property value="#a.camFoto"/>" alt="<s:property value="#a.camNombre"/>"/>
                                            </s:if>
                                        </td>
                                    </tr>                        
                                </table>
                                <s:param name="campania" value="#a.camId"/>
                            </s:a>
                        </s:iterator>
                    </div>
                    <div class="linea" style="padding-top: 50px; background-color: white;"></div>
                    <div class="linea" style="height: 2px;"></div>
                </s:if>
                <div id="marcas_Titulo">
                    MARCAS
                </div>
                <div id="marcas">
                    <s:iterator var="m" value="lista_marcasTienda">
                        <table  class="img_Marcas">                        
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <s:a action="TiendaMenu">
                                        <s:if test="#m.marcaFoto != ''">
                                            <img src="../Imagenes/Marcas/<s:property value="#m.marcaFoto"/>" alt="<s:property value="#m.marcaNombre"/>"/>
                                        </s:if>
                                        <s:param name="marca" value="#m.marcaId"/>
                                    </s:a>
                                </td>                            
                            </tr>                        
                        </table>
                    </s:iterator>
                </div>
            </div>
        </div>
        <s:include value="tiendaFooter.jsp" />
    </body>
</html>
