<%-- 
    Document   : Prueba
    Author     : Laplaga
--%>
<%@page import="java.util.Date"%>
<%@page import="Modelos.Ropa"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>PruebaCRUD</title>
        <script>
            function metefavoritos(nombre,valor){ 
                alert(document.cookie);
                var valorleido = leerCookie(nombre);
                alert(valorleido);
                var valortotal = parseInt(valor) + parseInt(valorleido);
                alert(valortotal);
                document.cookie = nombre+"="+valortotal;
                alert(document.cookie);
                document.getElementById("favoritostexto").value = leerCookie(nombre);
            }
            function leerCookie(nombre) {
                var lista = document.cookie.split(";");
                for (i in lista) {
                    var busca = lista[i].search(nombre);
                    if (busca > -1) {micookie=lista[i]}
                    }
                var igual = micookie.indexOf("=");
                var valor = micookie.substring(igual+1);
                return valor;
            }
            
        </script>
    </head>
    <body>
        <%
//            Cookie[] todosLosCookies = request.getCookies();
//            /* El siguiente paso es crear un bucle que vaya leyendo
//            todos los cookies. */
//            Cookie unCookie=null;
//            for (int i = 0; i < todosLosCookies.length; i++) {
//                unCookie = todosLosCookies[i];
//            /* A continuación se compara los nombres de cada uno de
//            los cookies con el que se está buscando. Si se encuentra un
//            cookie con ese nombre se ha dado con el que se está
//            buscando, de forma que se sale del bucle mediante break. */
//                if (unCookie.getName().equals("prenda")) {
//                    break;
//                }
//               Cookie miCookie = null;
//                //Date fecha = new Date();
//                String texto = "0";           
//                //Se le asigna el nombre de la cookie y su valor
//                miCookie = new Cookie("prenda", texto);
//                //Tiempo de Vida
//                //miCookie.setMaxAge(60);
//                //Indicar quien podra usar el cockies  si solo va "/" es toda la apliacacion
//                //miCookie.setPath("/");
//                //Para crear el fichero cookie real
//                response.addCookie(miCookie);
//            }
//            out.println("valor " + unCookie.getValue());
//           
        %>
        <p>Cookie Creada</p>
        <a href="LlamarCookies.jsp">Llamar Cookies</a>
        <table border="1">
            <tr>
                <td colspan="13">
                    <s:form action="RopaFiltroU" theme="simple">
                        Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>                    
                    </s:form>
                </td>
                <td>
                    <s:if test="usi==''">
                        <h1>Login</h1>
                        <s:form action="Login" theme="simple">
                            <table>
                                <tr>
                                    <td>
                                        Email
                                    </td>
                                    <td>
                                        <s:textfield name="usuario" />
                                    </td>
                                    <td>
                                        <s:fielderror fieldName="usuario" theme="simple"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contraseña
                                    </td>
                                    <td>
                                        <s:password name="password" />
                                    </td>
                                    <td>
                                        <s:fielderror fieldName="password" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2">
                                        <s:submit  value="login"/>                    
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <s:a action="UsuAlta" >
                                            <s:param name="accion" value="'a'"/>
                                            Crear Usuario
                                        </s:a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <s:form action="Favoritos" theme="simple">
                                            
                                            <input type="text" id="favoritostexto" name="favoritostexto" readonly="true" value="<%
                                                Cookie[] todosLosCookies = request.getCookies();
                                                /* El siguiente paso es crear un bucle que vaya leyendo
                                                todos los cookies. */
                                                Cookie unCookie=null;
                                                for (int i = 0; i < todosLosCookies.length; i++) {
                                                    unCookie = todosLosCookies[i];
                                                /* A continuación se compara los nombres de cada uno de
                                                los cookies con el que se está buscando. Si se encuentra un
                                                cookie con ese nombre se ha dado con el que se está
                                                buscando, de forma que se sale del bucle mediante break. */
                                                    if (unCookie.getName().equals("prenda")) {
                                                        break;
                                                    }
                                                   Cookie miCookie = null;
                                                    //Date fecha = new Date();
                                                    String texto = "0";           
                                                    //Se le asigna el nombre de la cookie y su valor
                                                    miCookie = new Cookie("prenda", texto);
                                                    //Tiempo de Vida
                                                    //miCookie.setMaxAge(60);
                                                    //Indicar quien podra usar el cockies  si solo va "/" es toda la apliacacion
                                                    //miCookie.setPath("/");
                                                    //Para crear el fichero cookie real
                                                    response.addCookie(miCookie);
                                                }
                                                out.println(unCookie.getValue());

                                            %>">
                                            <s:submit value="Favoritos"></s:submit>                    
                                        </s:form>
                                    </td>
                                </tr>
                            </table>
                        </s:form>
                    </s:if>
                    <s:if test="sesion.usuarioLogueado.usuId!=''">
                        Bienvenido : <s:property value="sesion.usuarioLogueado.usuNombre"/>
                        <s:a action="CerrarSesion" >Cerrar</s:a>
                        <s:a action="UsuAlta" >
                            <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                            <s:param name="accion" value="'m'"/>
                            Modificar Usuario
                        </s:a>
                        <s:a action="UsuAlta" >
                            <s:param name="clave" value="sesion.usuarioLogueado.usuId"/>
                            <s:param name="accion" value="'e'"/>
                            Eliminar usuario
                        </s:a>
                    </s:if>
                    <s:if test="sesion.usuarioLogueado.usuAdministrador!=1">
                        <s:property value="mensajeError" />
                        <s:form action="CestaFiltro" theme="simple">
                            <s:textfield type="hidden" value="1" name="filtro" /> <s:property value="totalcestaUsuario"/> <s:submit value="cesta"></s:submit>                    
                        </s:form>
                    </s:if>
                </td>
                <s:if test="sesion.usuarioLogueado.usuAdministrador==1">
                    <td>
                        <s:form action="RopaAdminFiltro" theme="simple">
                            <s:submit value="Admin"></s:submit>                    
                        </s:form>
                    </td>
                </s:if>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>clientela</th>
                <th>coleccion</th>
                <th>color</th>
                <th>look</th>
                <th>marcas</th>
                <th>tallas</th>
                <th>roDescripcion</th>
                <th>roPrecio</th>
                <th>roDescuento</th>
                <th>roCaracteristicas</th>
                <th>Categoría</th>
                <th>Subcategoría</th>
                <th>Fotos</th>
            </tr>
            <s:iterator var="a" value="lista_ropa">
                <tr>
                    <td>
                        <s:a action="RopaFormU">
                            <s:param name="accion" value="'c'"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-euro"></i>
                        </s:a>
                        <s:if test="sesion.usuarioLogueado.usuAdministrador!=1">
                            <s:a action="AñadeFavoritos">
                                <i style="font-size: 20px" class="glyphicon glyphicon-plus-sign"></i>
                            </s:a>
                        </s:if>
                                <i style="font-size: 20px" class="glyphicon glyphicon-plus-sign" onclick="metefavoritos('prenda',1)"></i>                         
                        <s:a action="CrudActionUsuariosCesta">
                            <s:param name="accion" value="'c'"/>
                            <s:param name="accionocul" value="'c'"/>
                            <s:param name="cantidad" value="1"/>
                            <s:param name="clave" value="#a.roId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-shopping-cart"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.clientela.clientelaDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.coleccion.coleccionDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.color.colorDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.look.lookDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.marcas.marcaNombre"/><br>
                    </td>
                    <td>
                        <s:property value="#a.tallas.tallaDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roDescripcion"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roPrecio"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roDescuento"/><br>
                    </td>
                    <td>
                        <s:property value="#a.roCaracteristicas"/><br>
                    </td>
                    <td>
                        <s:property value="#a.categoria.catDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.subcategoria.subDescripcion"/>                        
                    </td>
                    <td>
                        <s:iterator var="f" value="fotoses">
                            <s:property value="fotosRuta"/>
                        </s:iterator>
                    </td>
                </tr>
            </s:iterator>      
            <tr>
                <s:iterator var="a" value="lista_campanias">
                <td>          
                    <s:a action="campanassmuestra">
                        <s:param name="clave" value="#a.camId"/>
                         <img src="../Imagenes/Campanias/<s:property value="#a.camFoto"/>" height="200" alt="<s:property value="#a.camFoto"/>"/>               
                    </s:a>
                </td>
                </s:iterator>
            </tr>
            <tr>
                <s:iterator var="a" value="lista_marcas">
                <td>
                    <img src="../Imagenes/Marcas/<s:property value="#a.marcaFoto"/>" height="70" alt="<s:property value="#a.marcaFoto"/>"/>
                </td>
                </s:iterator>
            </tr>               
        </table>
    </body>
</html>
