<%-- 
    Document   : CRUDfacturaDetalle.jsp
    Created on : 27-oct-2016
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Detalle de factura <s:property value="facCodigo" /></title>
    </head>
    <body>
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="login">
                <s:a action="Usuario/RopaFiltro" cssStyle="padding: 5px 13px;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Volver a Tienda</s:a>
                </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">
                Detalle de factura <s:property value="facCodigo" /><br/>
                Cliente <s:property value="facturas.facRazonsocial" />&nbsp;&nbsp;&nbsp;&nbsp;
                Fecha <s:date name="facturas.facFecha" format="dd/MM/yyyy"/>
            </div>
            <s:include value="menuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <!--
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las tallas.</div>
        <div  class="linea"></div>-->
        <s:form action="FacturaDetalleFiltro" theme="simple">   
        <table border="1">
            <tr>
                <th>Categoría</th>
                <th>Subcategoría</th>
                <th>Clientela</th>
                <th>Marca</th>
                <th>Color</th>
                <th>Talla</th>
                <th>Precio</th>
                <th>Descuento (%)</th>
                <th>Precio con Descuento</th>
                <th>Cantidad</th>
                <th>Total</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_facturaDetalle">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:property value="#a.facdCategoria"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdSubcategoria"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdClientela"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdMarca"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdColor"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdTalla"/><br>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{#a.facdPrecio})"/><br>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.0}',{#a.facdDescuento})"/><br>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{#a.facdPrecio - (#a.facdPrecio * #a.facdDescuento / 100)})"/><br>
                    </td>
                    <td>
                        <s:property value="#a.facdCantidad"/><br>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{(#a.facdPrecio - (#a.facdPrecio * #a.facdDescuento / 100)) * #a.facdCantidad})"/><br>
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
                <tr>
                    <td colspan="10" style="text-align: right">Total Factura</td>
                    <td><s:property value="getText('{0,number,##0.00}',{total})"/><br></td>
                </tr>
        </table>
        <center><a href="/TiendaOnline/Vistas/FacturasFiltro.action" class="cambioFondo">Volver a Facturas</a></center>
        </s:form>
    </body>
</html>