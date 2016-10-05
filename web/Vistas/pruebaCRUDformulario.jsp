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
                        <s:select list="lista_combo_clientela" label="lista_combo_clientela"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="coleccion2">Coleccion</s:label>  
                        </td>
                        <td>
                        <s:select list="lista_combo_coleccion" label="lista_combo_coleccion"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="color2">Color</s:label>  
                        </td>
                        
                        <td>
                        <s:select list="lista_combo_color" label="lista_combo_color"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="look2">Look</s:label>  
                        </td>
                        
                        <td>
                        <s:select list="lista_combo_look" label="lista_combo_look"/>

                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <s:label for="marcas2">Marcas</s:label>  
                        </td>
                        <td>
                        <s:select list="lista_combo_marcas" label="lista_combo_marcas"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <s:label for="tallas2">Tallas</s:label>  
                        </td>
                        
                        <td>
                        <s:select list="lista_combo_tallas" label="lista_combo_tallas"/>

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
