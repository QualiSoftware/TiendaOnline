<%-- 
    Document   : formularioCRUDcampanias
    Created on : 20-nov-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <script src="../Scripts/utilidades.js" type="text/javascript"></script>
        <link href="../Estilos/estilosBorrado.css" rel="stylesheet" type="text/css"/>
        <title><s:property value="cabeceraocul" /> de ropa en campaña</title>
        <script>
            function Verificar() {
                if (document.getElementById('accion').value === 'e') {
                    document.getElementById('botonera').style.display = 'none';
                    document.getElementById('confirmacionEliminacion').style.display = 'block';
                } else {
                    document.getElementById('frm').submit();
                }
            }
        </script>
    </head>
       <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Ropa de campaña</div>
                <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina"><h3 class="bold"><s:property value="cabeceraocul" /> de ropa en Campaña <s:property value="campania.camNombre" /></h3></div>
        <div  class="linea"></div>   
        <% 
            String nombreCheck = "check";
            int i = 0;
        %>
        <s:form id="frm" action="CrudActionCampaniasRopa" theme="simple" method="post" enctype="multipart/form-data">
            <input type="hidden" name="accion" id="accion" value="<s:property value="accion" />" />
            <input type="hidden" name="camId" value="<s:property value="camId" />" />
            <table>
                <tr>
                    <td colspan="7" style="text-align:left;">
                        <input type="checkbox" onclick="marcarDesmarcarCheckbox(this);" /> Marcar/Desmarcar Todos
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <th>Categoría</th>
                    <th>Subcategoría</th>
                    <th>Clientela</th>
                    <th>Descripción</th>
                    <th>Look</th>
                    <th>Precio</th>
                </tr>
                <s:iterator var="a" value="lista_ropa">
                <tr>
                    <% i++; %>
                    <td>
                        <% boolean auxBoolean=false; %>
                        <s:iterator var="b" value="lista_ropaEnCampania">
                            <s:if test="#a.roId == #b">
                                <% auxBoolean = true; %>
                            </s:if>
                        </s:iterator>
                        <input type="checkbox" name="checkboxNombre" id="checkboxNombre-<%=i%>" 
                               value="<s:property value="#a.roId"/>" <% if(auxBoolean){out.print("checked");};%>/>
                    </td>
                    <td>
                        <s:property value="#a.categoria.catDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.subcategoria.subDescripcion"/>                        
                    </td>
                    <td>
                        <s:property value="#a.clientela.clientelaDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.roDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.look.lookDescripcion"/>
                    </td>
                    <td>
                        <s:property value="#a.roPrecio"/>
                    </td>
                </tr>
                </s:iterator>
                <tr>
                    <td colspan="7" id="botonera">
                        <input type="button" onclick="Verificar();" value=<s:property value="botonocul" /> />                     
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="volverCampanias">
                            <i style="font-size: 20px;">No hacer cambios en ropa de campaña</i>
                        </s:a>     
                    </td>
                </tr>
            </table>
            <input type="hidden" id="__multiselect_CrudActionCampaniasRopa_checkboxNombre" name="__multiselect_checkboxNombre" value="" />
        </s:form>
        <s:include value="formularioConfirmacionEliminacion.jsp" />
    </body>
</html>
