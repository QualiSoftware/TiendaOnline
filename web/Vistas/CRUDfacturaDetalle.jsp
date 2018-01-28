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
        <title>Detalle de factura <s:property value="facturas.facCodigo" /></title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="logo superlook" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">
                Detalle de factura <s:property value="facturas.facCodigo" /><br/>
                Cliente <s:property value="facturas.facRazonsocial" />&nbsp;&nbsp;&nbsp;&nbsp;
                Fecha <s:date name="facturas.facFecha" format="dd/MM/yyyy"/>
            </div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <!--
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las tallas.</div>
        <div  class="linea"></div>-->
        <s:form action="FacturaDetalleFiltro" theme="simple">   
        <table border="1">
            <tr>
                <th>Código Ropa</th>
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
                        <s:property value="#a.facdRoId"/>
                    </td>
                    <td>
                        <s:property value="#a.facdCategoria"/>
                    </td>
                    <td>
                        <s:property value="#a.facdSubcategoria"/>
                    </td>
                    <td>
                        <s:property value="#a.facdClientela"/>
                    </td>
                    <td>
                        <s:property value="#a.facdMarca"/>
                    </td>
                    <td>
                        <s:property value="#a.facdColor"/>
                    </td>
                    <td>
                        <s:property value="#a.facdTalla"/>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{#a.facdPrecio})"/>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.0}',{#a.facdDescuento})"/>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{#a.facdPrecio - (#a.facdPrecio * #a.facdDescuento / 100)})"/>
                    </td>
                    <td>
                        <s:property value="#a.facdCantidad"/>
                    </td>
                    <td>
                        <s:property value="getText('{0,number,##0.00}',{(#a.facdPrecio - (#a.facdPrecio * #a.facdDescuento / 100)) * #a.facdCantidad})"/>
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
                    <td colspan="11" style="text-align: right">Total Factura</td>
                    <td><s:property value="getText('{0,number,##0.00}',{total})"/></td>
                </tr>
        </table>
        <center><a href="/Vistas/FacturasFiltro.action" class="cambioFondo">Volver a Facturas</a></center>
        </s:form>
    </body>
</html>