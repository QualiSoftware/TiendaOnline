<%-- 
    Document   : tiendaMenu.jsp
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
        <script>
            var ventana;
            function abrir(rostockId){
                ventana = window.open("tiendaCestaPopUp.jsp?clave="+rostockId,"TallaYColor","width=300,height=300, resizable=no, scrollbars=no, menubar=no");
                /*ventana.document.write(document.getElementById('color')+'<br>');*/
            }
        </script>
        <!-- Estilos Footer -->
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        
        <!-- Scripts Propios-->
        <script src="../Scripts/Tienda_Scripts.js" type="text/javascript"></script>              
        <script>
            window.onload = muestra_Cantidad;            
        </script>
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
                        <s:a action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" theme="simple"/>
                            <img src="../Imagenes/Administracion/Shopping-Cart-10.png" alt="" id="imgcesta"/>
                            <div id="cantidad_Cesta"><s:property value="totalcestaUsuario"/></div>
                            <table id="cesta_Hover">
                                <tr>
                                    <th>Descripcion</th>
                                    <th>Color</th>
                                    <th>Tallas</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                    <th>Foto</th>                                   
                                </tr>
                                <s:iterator var="c" value="lista_ropa_Cestas">
                                    <tr>
                                        <td>
                                            <s:property value="#c.ropaStock.ropa.roDescripcion"/>
                                        </td>
                                        <td>
                                            <s:property value="#c.ropaStock.color.colorDescripcion"/>
                                        </td>
                                        <td>
                                            <center>
                                            <s:property value="#c.ropaStock.tallas.tallaDescripcion"/>
                                            </center>
                                        </td>
                                        <td>
                                        <center>
                                            <s:property value="getText('{0,number,##0.00}',{#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)})"/>
                                        </center>
                                        </td>
                                        <td>
                                        <center>
                                            <s:property value="#c.cestaUnidades"/>
                                        </center>
                                        </td>
                                        <td>
                                        <center>
                                            <s:property value="getText('{0,number,##0.00}',{(#c.ropaStock.ropa.roPrecio - (#c.ropaStock.ropa.roPrecio * #c.ropaStock.ropa.roDescuento / 100)) * #c.cestaUnidades})"/>
                                        </center>
                                        </td>
                                        <td><% int cero=0; %>
                                            <s:iterator var="f" value="#c.ropaStock.ropa.fotoses">
                                                <% if(cero<1){%>
                                                <img src="<s:url value='../Imagenes/%{#c.ropaStock.ropa.categoria.catDescripcion}/%{#c.ropaStock.ropa.subcategoria.subDescripcion}/%{#f.fotosRuta}'/>" alt="<s:property value="fotosRuta" />" width="20" />
                                                <% cero++;}%>
                                            </s:iterator>
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>
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
                    <input type="hidden" name="clientela" value="<s:property value="clientela"/>"/>
                    <input type="hidden" name="categoria" value="<s:property value="categoria"/>"/>
                    <input type="hidden" name="clientela2" value="<s:property value="clientela2"/>"/>
                    <input type="hidden" name="categoria2" value="<s:property value="categoria2"/>"/>
                    <input type="hidden" name="marcas2" value="<s:property value="marcas2"/>"/>
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
            <div id="contenido">
                <div id="ruta_Navegacion">
                    <s:a action="Tienda">Inicio</s:a> > 
                    <s:if test="(marcas2==null && clientela2!=null) || (marcas2=='' && clientela2!='')"><s:property value="categoria"/> <s:property value="clientela"/></s:if>
                    <s:elseif test="(marcas2==null && clientela2==null && campania==null) || (marcas2=='' && clientela2=='' && campania=='')">Todas las ventas</s:elseif>
                    <s:elseif test="(marcas2==null && campania!=null) || (marcas2=='' && campania!='')"><s:property value="campaniaNombre"/></s:elseif>
                    <s:else><s:property value="marca"/></s:else>
                </div>
                <div id="nombre_Categoria">
                    <s:if test="(marcas2==null && clientela2!=null) || (marcas2=='' && clientela2!='')"><s:property value="categoria"/> <s:property value="clientela"/></s:if>
                    <s:elseif test="(marcas2==null && clientela2==null && campania==null) || (marcas2=='' && clientela2=='' && campania=='')">Todos nuestros productos</s:elseif>
                    <s:elseif test="(marcas2==null && campania!=null) || (marcas2=='' && campania!='')">Las campañas más exclusivas</s:elseif>
                    <s:else>Las marcas que están de moda</s:else>
                </div>
                <div id="productos" style="margin-top: 50px;">
                    <s:iterator var="m" value="lista_ropa">
                        <s:if test="#m.ropaStocks.size != 0">
                        <table  class="imgproducto">                                                    
                            <tr class="botones_prueba">
                                <td>
                                    <s:a action="RopaPopUp">
                                        <s:param name="clientela2" value="%{clientela2}"/>
                                        <s:param name="categoria2" value="%{categoria2}"/>
                                        <s:param name="marcas2" value="%{marcas2}"/>
                                        <s:param name="campania" value="campania"/>
                                        <s:param name="roId" value="#m.roId"/>
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
                                    </s:a>
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
                                                            <td>
                                                                <script>
                                                                    var arrayColoresNombre = new Array();
                                                                    var arrayColoresFoto = new Array();
                                                                    var i;
                                                                    var bool = true;
                                                                    <s:iterator var="c" value="ropaStocks">
                                                                        bool = true;
                                                                        for(i = 0; i < arrayColoresNombre.length;i++){
                                                                            if(arrayColoresNombre[i] == '<s:property value="#c.color.colorDescripcion"/>'){
                                                                                bool = false;
                                                                            }
                                                                        }
                                                                        if(bool){
                                                                            arrayColoresFoto.push('<s:property value="#c.color.colorFoto"/>');
                                                                            arrayColoresNombre.push('<s:property value="#c.color.colorDescripcion"/>');
                                                                        }
                                                                    </s:iterator>
                                                                    for (i = 0; i < arrayColoresNombre.length; i++) {
                                                                        document.write("<img src='../Imagenes/Colores/" + arrayColoresFoto[i] + "' width='10' alt='" + arrayColoresNombre[i] + "'/>");
                                                                    }
                                                                </script>
                                                                <!--<span style="width: 200px; height: 20px; background-color: red; color: red">....</span>-->
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Talla</td>
                                                            <td>
                                                                <script>
                                                                    var arrayTallasDescripcion = new Array();
                                                                    var i;
                                                                    var bool = true;
                                                                    <s:iterator var="t" value="ropaStocks">
                                                                        bool = true;
                                                                        for(i = 0; i < arrayTallasDescripcion.length;i++){
                                                                            if(arrayTallasDescripcion[i] == '<s:property value="#t.tallas.tallaDescripcion"/>'){
                                                                                bool = false;
                                                                            }
                                                                        }
                                                                        if(bool){
                                                                            arrayTallasDescripcion.push('<s:property value="#t.tallas.tallaDescripcion"/>');
                                                                        }
                                                                    </s:iterator>
                                                                    <s:iterator var="l" value="lista_tallas">
                                                                        bool = false;
                                                                        for (i = 0; i < arrayTallasDescripcion.length; i++) {
                                                                            if(arrayTallasDescripcion[i] == '<s:property value="#l.tallaDescripcion"/>'){
                                                                                bool = true;
                                                                                break;
                                                                            }
                                                                        }
                                                                        if(bool){
                                                                            document.write(arrayTallasDescripcion[i] + "<br>");
                                                                        }else{
                                                                            document.write("<span style='text-decoration:line-through;'>" + '<s:property value="#l.tallaDescripcion"/>' + "</span><br>");
                                                                        }
                                                                    </s:iterator>
                                                                </script>
                                                                <br>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="../Imagenes/Administracion/bRTdpoqi9.png" title="Аñadir a Favoritos" style="box-shadow:  0px 0px 0px;"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <s:a action="RopaPopUp">
                                            <s:param name="clientela2" value="%{clientela2}"/>
                                            <s:param name="categoria2" value="%{categoria2}"/>
                                            <s:param name="marcas2" value="%{marcas2}"/>
                                            <s:param name="campania" value="campania"/>
                                            <s:param name="roId" value="#m.roId"/>
                                            <img src="../Imagenes/Administracion/shopping-basket-xxl.png" title="Añadir a la Cesta" style="box-shadow: 0px 0px 0px;">
                                        </s:a>
                                            <br>
                                        <span style="color: white">Vista &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favoritos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cesta</span>
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
                                    <span style="font-size: 15px; text-align: left"> <s:property value="#m.marcas.marcaNombre"/></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <span style="text-decoration: line-through; font-size: 20px; color: #999999; font-weight: bold" ><s:property value="getText('{0,number,##0.00}',{#m.roPrecio})"/> €</span>
                                    <span style="padding-left: 10px; font-size: 20px; font-weight: bold;">
                                        <s:property value="getText('{0,number,##0.00}',{#m.roPrecio - (#m.roPrecio * #m.roDescuento / 100)})"/> €
                                    </span>
                                </td>
                            </tr>
                        </table>
                        </s:if>
                    </s:iterator>
                </div>
            </div>
        </div>
        <s:include value="tiendaFooter.jsp" />
    </body>
</html>