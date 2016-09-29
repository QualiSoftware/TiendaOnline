<%@taglib prefix="s" uri="/struts-tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/IndexEstilo.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../Estilos/DanielThomson/JQuery29_menus.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/jquery_3.js"></script>
        <script src="../Estilos/DanielThomson/nav_2.js"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function () {
                $("#JqueryMenu").navPlugin();
                $("#JqueryMenu2").navPlugin({
                    'itemWidth': 500,
                    'itemHeight': 30,
                    'navEffect': 'fade',
                    'speed': 500
                });
            });
        </script>
        <title>Index Tienda</title>
    </head>
    <body>
        <div id="header">
            <div id="cookies">Política de cookies</div>
            <div id="sesion">
                <s:form action="Login" theme="simple">
                    <table>
                        <tr>
                            <td>
                                Nombre
                            </td>
                            <td>
                                <s:textfield name="usuario"/>
                            </td>
                            <td>
                                <s:fielderror fieldName="usuario"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password
                            </td>
                            <td>
                                <s:textfield name="pass"/>
                            </td>
                            <td>
                                <s:fielderror fieldName="pass"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <s:submit value="Entrar"/>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                <s:property value="mensajeError"/>
                            </td> 
                        </tr>
                    </table>
                </s:form>
            </div>            
            <div id="cesta">Cesta de la compra</div>                   
        </div>
        <div id="menu">
            <div id="dropdown">
                <ul id="JqueryMenu">
                    <li><a href="#">Hombre</a>
                        <ul>
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
                            <li><a href="#">Otros</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Mujer</a>
                        <ul>
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
                            <li><a href="#">Otros</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Marcas</a>
                        <ul>
                            <li><a href="#">Pepe Jeans</a></li>
                            <li><a href="#">Levis</a></li>
                            <li><a href="#">Nike</a></li>
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
                    <li><a href="#">Outlet</a>
                        <ul>
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
                            <li><a href="#">Otros</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            
        </div>

        <div id="contenido">
            <h1>Contenido</h1>
            
        </div>


        <div id="footer">
            Footer
        </div>         
    </body>
</html>