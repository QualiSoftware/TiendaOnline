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
                                                <li><a href="#"><s:a action="listaDeseos"><i class="fa fa-heart-o"></i>Lista de deseos</s:a></li>
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
								<strong class="text-uppercase" onclick="fijarLogin();">Mi cuenta <i class="fa fa-caret-down"></i></strong>
							</div>
							<a href="#" class="text-uppercase">
                                                            Entrar
                                                        </a> / 
                                                        <a href="#" class="text-uppercase">
                                                            Unirse
                                                        </a>
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
                                                                                                            <h3 class="product-price">
                                                                                                                <s:property value="getText('{0,number,##0.00}',{#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)})"/>
                                                                                                                <s:set var="importeTotal" value="%{#importeTotal + (#c.cestaUnidades * (#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)))}"/>
                                                                                                                <span class="qty"><s:property value="#c.cestaUnidades"/></span>
                                                                                                            </h3>
                                                                                                            <h2 class="product-name"><a href="#"><s:property value="#c.ropaStock.ropa.roDescripcion"/></a></h2>
                                                                                                    </div>
                                                                                                    <button class="cancel-btn"><i class="fa fa-trash"></i></button>

                                                                                            </div>
                                                                                        </s:iterator>
                                                                                    </s:if>
                                                                                    <s:else>
                                                                                    <s:iterator var="c" value="lista_ropa_Cesta_NoLog">
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
                                                                                                    <h3 class="product-price">
                                                                                                        <s:property value="getText('{0,number,##0.00}',{#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)})"/>
                                                                                                        <s:set var="importeTotal" value="%{#importeTotal + (#c.nlcUnidades * (#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)))}"/>
                                                                                                        <span class="qty"><s:property value="#c.nlcUnidades"/></span></h3>
                                                                                                    <h2 class="product-name">
                                                                                                        <a href="#">
                                                                                                            <s:property value="#c.ropaStock.ropa.roDescripcion"/>
                                                                                                        </a>
                                                                                                    </h2>
                                                                                            </div>
                                                                                            <button class="cancel-btn"><i class="fa fa-trash"></i></button>
                                                                                    </div>
                                                                                    </s:iterator>
                                                                                    </s:else>
                                                                            </div>
                                                                            <div class="shopping-cart-btns">
                                                                                    <button class="main-btn">View Cart</button>
                                                                                    <button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
                                                                            </div>
                                                                        </s:if>
                                                                    </div>
                                                            </div>
                                                        </s:a>
                                                    </s:if>  
                                                    <s:if test="sesion.usuAdministrador==1">
                                                        <s:form action="RopaAdminFiltro" theme="simple">
                                                            <s:submit value="Admin"></s:submit>                    
                                                        </s:form>
                                                    </s:if>
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
        
        <!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">Categorias <i class="fa fa-list"></i></span>
					<ul class="category-list">
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Women’s Clothing <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
								</div>
								<div class="row hidden-sm hidden-xs">
									<div class="col-md-12">
										<hr>
										<a class="banner banner-1" href="#">
											<img src="../theme/img/banner05.jpg" alt="">
											<div class="banner-caption text-center">
												<h2 class="white-color">NEW COLLECTION</h2>
												<h3 class="white-color font-weak">HOT DEAL</h3>
											</div>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li><a href="#">Men’s Clothing</a></li>
						<li class="dropdown side-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Phones & Accessories <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
									<div class="col-md-4 hidden-sm hidden-xs">
										<a class="banner banner-2" href="#">
											<img src="../theme/img/banner04.jpg" alt="">
											<div class="banner-caption">
												<h3 class="white-color">NEW<br>COLLECTION</h3>
											</div>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li><a href="#">Computer & Office</a></li>
						<li><a href="#">Consumer Electronics</a></li>
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Jewelry & Watches <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li><a href="#">Bags & Shoes</a></li>
						<li><a href="#">View All</a></li>
					</ul>
				</div>
				<!-- /category nav -->

				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="#">Home</a></li>
						<li><s:a action="TiendaMenu"  class="dropdown-toggle" style="font-weight: normal;">Novedades</s:a></li>
						<!--
                                                <li class="dropdown mega-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Women <i class="fa fa-caret-down"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
								</div>
								<div class="row hidden-sm hidden-xs">
									<div class="col-md-12">
										<hr>
										<a class="banner banner-1" href="#">
											<img src="./img/banner05.jpg" alt="">
											<div class="banner-caption text-center">
												<h2 class="white-color">NEW COLLECTION</h2>
												<h3 class="white-color font-weak">HOT DEAL</h3>
											</div>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown mega-dropdown full-width"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Men <i class="fa fa-caret-down"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1" href="#">
												<img src="./img/banner06.jpg" alt="">
												<div class="banner-caption text-center">
													<h3 class="white-color text-uppercase">Women’s</h3>
												</div>
											</a>
											<hr>
										</div>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1" href="#">
												<img src="./img/banner07.jpg" alt="">
												<div class="banner-caption text-center">
													<h3 class="white-color text-uppercase">Men’s</h3>
												</div>
											</a>
										</div>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1" href="#">
												<img src="./img/banner08.jpg" alt="">
												<div class="banner-caption text-center">
													<h3 class="white-color text-uppercase">Accessories</h3>
												</div>
											</a>
										</div>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1" href="#">
												<img src="./img/banner09.jpg" alt="">
												<div class="banner-caption text-center">
													<h3 class="white-color text-uppercase">Bags</h3>
												</div>
											</a>
										</div>
										<hr>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
											<li><a href="#">Women’s Clothing</a></li>
											<li><a href="#">Men’s Clothing</a></li>
											<li><a href="#">Phones & Accessories</a></li>
											<li><a href="#">Jewelry & Watches</a></li>
											<li><a href="#">Bags & Shoes</a></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li><a href="#">Sales</a></li>
						<li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Pages <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="index.html">Home</a></li>
								<li><a href="products.html">Products</a></li>
								<li><a href="product-page.html">Product Details</a></li>
								<li><a href="checkout.html">Checkout</a></li>
							</ul>
						</li>
                                                -->
                                                <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Mujer <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
                                                          <s:iterator var="a" value= "lista_menu_ropa">
                                                            <s:if test="#a.clientela.clientelaDescripcion=='Mujer'">
								<li>
                                                                    <s:a action="TiendaMenu">
                                                                        <s:property value="#a.categoria.catDescripcion"/>
                                                                        <s:param name="cliCodigo" value="#a.clientela.clientelaId"/>
                                                                        <s:param name="catCodigo" value="#a.categoria.catId"/>
                                                                    </s:a>
                                                                </li>
                                                            </s:if>
                                                          </s:iterator>
							</ul>
						</li>
                                                <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Hombre <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
                                                           <s:iterator var="a" value= "lista_menu_ropa">
                                                            <s:if test="#a.clientela.clientelaDescripcion=='Hombre'">
                                                                <li>
                                                                    <s:a action="TiendaMenu">
                                                                        <s:property value="#a.categoria.catDescripcion"/>
                                                                        <s:param name="cliCodigo" value="#a.clientela.clientelaId"/>
                                                                        <s:param name="catCodigo" value="#a.categoria.catId"/>
                                                                    </s:a>
                                                                </li>                                    
                                                             </s:if>
                                                           </s:iterator>
							</ul>
						</li>
						<li><s:a action="TiendaMenu"  class="dropdown-toggle" style="font-weight: normal;">Ofertas
                                                        <s:param name="campania" value="11"/>
                                                    </s:a>
                                                </li>
                                                <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Marcas Temporada <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
                                                           <s:iterator var="a" value= "lista_marcas">
                                                            <li>
                                                                <s:a action="TiendaMenu">
                                                                    <s:property value="#a.marcaNombre"/>
                                                                    <s:param name="marca" value="#a.marcaId"/>
                                                                </s:a>
                                                            </li>
                                                            </s:iterator> 
							</ul>
						</li>
                                                
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->
        
        <!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">
					<!-- banner -->
					<div class="banner banner-1">
						<img src="../theme/img/banner01.jpg" alt="">
						<div class="banner-caption text-center">
							<h1>Bolsos</h1>
							<h3 class="white-color font-weak">50% Descuento</h3>
							<button class="primary-btn">Comprar!</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="../theme/img/banner02.jpg" alt="">
						<div class="banner-caption">
							<h1 class="primary-color">OFERTA<br><span class="white-color font-weak">Hasta 50% Descuento</span></h1>
							<button class="primary-btn">Comprar!</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="../theme/img/banner03.jpg" alt="">
						<div class="banner-caption">
							<h1 class="white-color">Nuevo Producto <span>Colección</span></h1>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->
				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->
        
        <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#">
						<img src="../theme/img/banner10.jpg" alt="">
						<div class="banner-caption text-center">
                                                    <h2 class="white-color">NUEVA COLECCIÓN</h2>
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#">
						<img src="../theme/img/banner11.jpg" alt="">
						<div class="banner-caption text-center">
                                                    <h2 class="white-color">NUEVA COLECCIÓN</h2>
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
					<a class="banner banner-1" href="#">
						<img src="../theme/img/banner12.jpg" alt="">
						<div class="banner-caption text-center">
							<h2 class="white-color">NUEVA COLECCIÓN</h2>s
						</div>
					</a>
				</div>
				<!-- /banner -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

        <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">Ofertas del día</h2>
						<div class="pull-right">
							<div class="product-slick-dots-2 custom-dots">
							</div>
						</div>
					</div>
				</div>
				<!-- section title -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single product-hot">
						<div class="product-thumb">
							<div class="product-label">
								<span class="sale">-20%</span>
							</div>
							<ul class="product-countdown">
								<li><span>00 H</span></li>
								<li><span>00 M</span></li>
								<li><span>00 S</span></li>
							</ul>
							<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Ver</button>
							<img src="../theme/img/product01.jpg" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<!-- Product Slick -->
				<div class="col-md-9 col-sm-6 col-xs-6">
					<div class="row">
						<div id="product-slick-2" class="product-slick">
							<!-- Product Single -->
							<div class="product product-single">
								<div class="product-thumb">
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Ver</button>
									<img src="../theme/img/product06.jpg" alt="">
								</div>
								<div class="product-body">
									<h3 class="product-price">$32.50</h3>
									<div class="product-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o empty"></i>
									</div>
									<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>
							<!-- /Product Single -->

							<!-- Product Single -->
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span class="sale">-20%</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Ver</button>
									<img src="../theme/img/product05.jpg" alt="">
								</div>
								<div class="product-body">
									<h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
									<div class="product-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o empty"></i>
									</div>
									<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>
							<!-- /Product Single -->

							<!-- Product Single -->
							<div class="product product-single">
								<div class="product-thumb">
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Ver </button>
									<img src="../theme/img/product04.jpg" alt="">
								</div>
								<div class="product-body">
									<h3 class="product-price">$32.50</h3>
									<div class="product-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o empty"></i>
									</div>
									<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>
							<!-- /Product Single -->

							<!-- Product Single -->
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span>New</span>
										<span class="sale">-20%</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Ver</button>
									<img src="../theme/img/product03.jpg" alt="">
								</div>
								<div class="product-body">
									<h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
									<div class="product-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o empty"></i>
									</div>
									<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>
							<!-- /Product Single -->

						</div>
					</div>
				</div>
				<!-- /Product Slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
        
        <!-- VIEJO -->
        <div id="todo">
            <%--
            <div id="header">
                
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
            
            </div>
            <div class="linea" style="height: 2px;"></div>
            --%>
            
            <%--
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
            --%>
            
            
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
