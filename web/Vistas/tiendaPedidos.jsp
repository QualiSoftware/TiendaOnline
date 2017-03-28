<%-- 
    Document   : tiendaPedidos.jsp
    Created on : 23-feb-2017
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <!--Calendario-->
        <link rel="stylesheet" type="text/css" href="../Calendar/1-simple-calendar/tcal.css" />
        <script type="text/javascript" src="../Calendar/1-simple-calendar/tcal.js"></script>
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
        <script>
            window.onload = muestra_Cantidad;
        </script>
        <title>Pedidos</title>
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
                        <% 
                          response.sendRedirect("Vistas/Tienda.action");
                        %>
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
                <div id="menu_Tabla" style="z-index:2;">
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
                                    <a href="#">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> Pedidos
                                    </a>
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
                                            <s:param name="clientela" value="#a.clientela.clientelaId"/>
                                            <s:param name="categoria" value="#a.categoria.catId"/>
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
                                        <s:param name="clientela" value="#a.clientela.clientelaId"/>
                                        <s:param name="categoria" value="#a.categoria.catId"/>
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
            
            
            <table border="1">
            <tr>
                <th>Descargar</th>
                <th>Código</th>
                <th>Nombre / Razón Social</th>
                <th>Fecha</th>
                <th>Importe</th>
                <th>Observaciones</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_facturas">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="FacturaPDF" target="_blank">
                            <s:param name="clave" value="#a.facId"/>
                            <s:param name="facUsuId" value="#a.facUsuId"/>
                            <i style="font-size: 20px; z-index: 1;" class="glyphicon glyphicon-print"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.facCodigo"/>
                    </td>
                    <td>
                        <s:property value="#a.facRazonsocial"/>
                    </td>
                    <td>
                        <s:date name="#a.facFecha" format="dd/MM/yyyy hh:mm" />
                    </td>
                    <td>
                        <s:set var="total" value="0"/>
                        <s:iterator  var="f" value="#a.facturaDetalles">
                            <s:set var="total" value="%{#total + (#f.facdCantidad * (#f.facdPrecio - (#f.facdPrecio * #f.facdDescuento / 100)))}"/>
                        </s:iterator>
                        <s:property value="getText('{0,number,##0.00}',{#total})"/>
                    </td>
                    <td>
                        <s:property value="#a.facObservaciones"/>
                    </td>
                </tr>
                <%
                    if(fondo.equals("fondoOscuro")){
                        fondo="fondoClaro";
                    }else{
                        fondo="fondoOscuro";
                    }
                %>
            </s:iterator>
        </table>
            
            
        </div>
        <s:include value="tiendaFooter.jsp" />
        <div id="cookies">
            <div id="cookies">
                <p>Esta web utiliza cookies para obtener datos estadísticos de la navegación de sus usuarios. Si continúas navegando consideramos que aceptas su uso.
                    <a href="http://luislo.esy.es/politica-privacidad.php">Más información</a>
                    <a onclick="aceptar_cookies();" style="cursor:pointer;">X Cerrar</a></p>
            </div>
        </div>
    </body>
</html>