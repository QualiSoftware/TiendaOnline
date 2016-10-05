<%-- 
    Document   : pruebaCRUDformulario
    Created on : 01-oct-2016, 9:36:47
    Author     : LaPlaga
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <h1> <s:label name="cabeceraocul"></s:label> </h1>
        <s:form action="CrudActionRopa" theme="simple">
            <s:textfield type="hidden" name="accionocul"/>
            <table>
                <tr>
                    <td>
                        <s:label for="roId2">Codigo</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roId2" readonly="true"></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:label for="clientela2">Clientela</s:label>  
                        </td>
                        <td>
                        <s:select name="clientela2" list="lista_clientela" listValue="clientelaDescripcion" listKey="clientelaId" value="t.clientela.clientelaId"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="coleccion2">Coleccion</s:label>  
                        </td>
                        <td>
                        <s:select name="coleccion2" list="lista_colecciones" listValue="coleccionDescripcion" listKey="coleccionId" value="t.coleccion.coleccionId"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="color2">Color</s:label>  
                        </td>

                        <td>
                        <s:select name="color2" list="lista_colores" listValue="colorDescripcion" listKey="colorId" value="t.color.colorId"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="look2">Look</s:label>  
                        </td>

                        <td>
                        <s:select name="look2" list="lista_look" listValue="lookDescripcion" listKey="lookId" value="t.look.lookId"/>

                    </td>
                </tr>
                <tr>

                    <td>
                        <s:label for="marcas2">Marcas</s:label>  
                        </td>
                        <td>
                        <s:select name="marcas2" list="lista_marca" listValue="marcaNombre" listKey="marcaId" value="t.marcas.marcaId"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="tallas2">Tallas</s:label>  
                        </td>

                        <td>
                        <s:select name="tallas2" list="lista_tallas" listValue="tallaDescripcion" listKey="tallaId" value="t.tallas.tallaId"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescripcion2">Descripcion</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roDescripcion2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roPrecio2">Precio</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roPrecio2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roDescuento2">Descuento</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roDescuento2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roCaracteristicas2">Caracteristicas</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roCaracteristicas2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roVisible2">Visible</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roVisible2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roUnidades2">Unidades</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roUnidades2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="roFecha2">Fecha</s:label>  
                        </td>
                        <td>
                        <s:textfield name="roFecha2"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="Categorias">Categorias</s:label>  
                        </td>
                        <td>
                        <s:select list="lista_combo_categorias" label="lista_combo_categorias"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="Material">Material</s:label>  
                        </td>
                        <td>
                        <s:select list="lista_combo_material" label="lista_combo_material"/>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="<s:property value="botonocul" />"/>
                        <a href="volverRopa">
                            volver
                        </a>
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
