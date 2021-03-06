package Acciones;

import ControladoresDAO.cCesta;
import ControladoresDAO.cCestaNoLog;
import ControladoresDAO.cUsuarios;
import Modelos.Campania;
import Modelos.Cesta;
import Modelos.FacturaDetalle;
import Modelos.Facturas;
import Modelos.Fotos;
import Modelos.Marcas;
import Modelos.NoLogCesta;
import Modelos.NoLogUsuarios;
import Modelos.Paises;
import Modelos.Provincias;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/*  
*   Author     : QualiSoftware
*/
public class HomeCesta extends ActionSupport {

    private Integer roId2;
    private int rostockId;
    private Integer cantidad;
    private Cesta c;
    private Cesta ce;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Marcas>lista_marcas;
    private String filtro;
    private Map sesion;
    private Double precio = 0.0;
    private int clave;
    private Cesta t;
    private Usuarios us;
    private String cabeceraocul;
    private String botonocul;
    private String accionocul;
    private String cliCodigo;
    private String catCodigo;
    private String clientelaNombre;
    private Double precioEliminar = 0.0;
    private boolean aceptarpago;
    private Usuarios u;
    private String obs;
    private String prov;
    private String pais;
    private int facUsuId;
    private String marca;
    private String campania;
    private int ropa,color,talla;
    private RopaStock ropaStock;
    private NoLogUsuarios nlu;
    private NoLogCesta nlc;
    private ArrayList<NoLogCesta> lista_ropa_Cesta_NoLog;
    private String emailUNL;
    private List<Paises> listaPaises;
    private List<Provincias> listaProvincias;
    private String direccion,ciudad,cp,nombre;
    private String usuId,cantidadUnidades,cestaId;
    private String stotal,scantidad,sunifact,sprefactura,strockExcedido;

    public boolean isAceptarpago() {
        return aceptarpago;
    }

    public void setAceptarpago(boolean aceptarpago) {
        this.aceptarpago = aceptarpago;
    }
   
    public Cesta getCe() {
        return ce;
    }

    public void setCe(Cesta ce) {
        this.ce = ce;
    }

    public Usuarios getUs() {
        return us;
    }

    public void setUs(Usuarios us) {
        this.us = us;
    }

    public Double getPrecioEliminar() {
        return precioEliminar;
    }

    public void setPrecioEliminar(Double precioEliminar) {
        this.precioEliminar = precioEliminar;
    }

    public Cesta getT() {
        return t;
    }

    public void setT(Cesta t) {
        this.t = t;
    }

    public String getCliCodigo() {
        return cliCodigo;
    }

    public void setCliCodigo(String cliCodigo) {
        this.cliCodigo = cliCodigo;
    }

    public String getCatCodigo() {
        return catCodigo;
    }

    public void setCatCodigo(String catCodigo) {
        this.catCodigo = catCodigo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getClientelaNombre() {
        return clientelaNombre;
    }

    public void setClientelaNombre(String clientelaNombre) {
        this.clientelaNombre = clientelaNombre;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public Cesta getR() {
        return t;
    }

    public void setR(Cesta t) {
        this.t = t;
    }

    public String getCabeceraocul() {
        return cabeceraocul;
    }

    public void setCabeceraocul(String cabeceraocul) {
        this.cabeceraocul = cabeceraocul;
    }

    public String getBotonocul() {
        return botonocul;
    }

    public void setBotonocul(String botonocul) {
        this.botonocul = botonocul;
    }

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
    }

    public ArrayList<Ropa> getLista_menu_ropa() {
        return lista_menu_ropa;
    }

    public void setLista_menu_ropa(ArrayList<Ropa> lista_menu_ropa) {
        this.lista_menu_ropa = lista_menu_ropa;
    }

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public Integer getRoId2() {
        return roId2;
    }

    public void setRoId2(Integer roId2) {
        this.roId2 = roId2;
    }

    public int getRostockId() {
        return rostockId;
    }

    public void setRostockId(int rostockId) {
        this.rostockId = rostockId;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getProv() {
        return prov;
    }

    public void setProv(String prov) {
        this.prov = prov;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getFacUsuId() {
        return facUsuId;
    }

    public void setFacUsuId(int facUsuId) {
        this.facUsuId = facUsuId;
    }

    public String getCampania() {
        return campania;
    }

    public void setCampania(String campania) {
        this.campania = campania;
    }

    public int getRopa() {
        return ropa;
    }

    public void setRopa(int ropa) {
        this.ropa = ropa;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public int getTalla() {
        return talla;
    }

    public void setTalla(int talla) {
        this.talla = talla;
    }

    public ArrayList<NoLogCesta> getLista_ropa_Cesta_NoLog() {
        return lista_ropa_Cesta_NoLog;
    }

    public void setLista_ropa_Cesta_NoLog(ArrayList<NoLogCesta> lista_ropa_Cesta_NoLog) {
        this.lista_ropa_Cesta_NoLog = lista_ropa_Cesta_NoLog;
    }

    public String getEmailUNL() {
        return emailUNL;
    }

    public void setEmailUNL(String emailUNL) {
        this.emailUNL = emailUNL;
    }

    public List<Paises> getListaPaises() {
        return listaPaises;
    }

    public void setListaPaises(List<Paises> listaPaises) {
        this.listaPaises = listaPaises;
    }

    public List<Provincias> getListaProvincias() {
        return listaProvincias;
    }

    public void setListaProvincias(List<Provincias> listaProvincias) {
        this.listaProvincias = listaProvincias;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getCantidadUnidades() {
        return cantidadUnidades;
    }

    public void setCantidadUnidades(String cantidadUnidades) {
        this.cantidadUnidades = cantidadUnidades;
    }

    public String getCestaId() {
        return cestaId;
    }

    public void setCestaId(String cestaId) {
        this.cestaId = cestaId;
    }

    public String getStotal() {
        return stotal;
    }

    public void setStotal(String stotal) {
        this.stotal = stotal;
    }

    public String getScantidad() {
        return scantidad;
    }

    public void setScantidad(String scantidad) {
        this.scantidad = scantidad;
    }

    public String getSunifact() {
        return sunifact;
    }

    public void setSunifact(String sunifact) {
        this.sunifact = sunifact;
    }

    public String getSprefactura() {
        return sprefactura;
    }

    public void setSprefactura(String sprefactura) {
        this.sprefactura = sprefactura;
    }

    public String getStrockExcedido() {
        return strockExcedido;
    }

    public void setStrockExcedido(String strockExcedido) {
        this.strockExcedido = strockExcedido;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Cesta getC() {
        return c;
    }

    public void setC(Cesta c) {
        this.c = c;
    }

    public String CrudActionUsuariosCesta() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }        
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                            + " con usuID "+sesion.get("usuId")+" el día "+new Date());
                }
            }
        }
        cargarUsuarioNoLogueado(sesion);
        int respuesta;
        if(!(sesion.get("usuId")+"").equals("")){
            c = new Cesta();
            if (accionocul.equals("e")) {
                c = ControladoresDAO.cCesta.RecuperaPorId(clave);
                if (cantidad > 0) {
                    c.setCestaUnidades(cantidad);
                    respuesta = ControladoresDAO.cCesta.Modifica(c);
                } else {
                    respuesta = ControladoresDAO.cCesta.Elimina(c);
                }
            } else {
                c.setCestaId(clave);
                c.setCestaUnidades(cantidad);
                c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(u.getUsuId()));
                ropaStock = ControladoresDAO.cRopaStock.RecuperaPorRopaColorTalla(ropa, color, talla);
                c.setRopaStock(ropaStock);
                lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
                boolean aumentaCantidad = false;
                int cestaIdAux = 0;
                for(Cesta c:lista_ropa_Cestas){
                    if(c.getRopaStock().getRostockId() == ropaStock.getRostockId()){
                        aumentaCantidad = true;
                        cestaIdAux = c.getCestaId();
                    }
                }
                if(aumentaCantidad){
                    c = new Cesta();
                    c = ControladoresDAO.cCesta.RecuperaPorId(cestaIdAux);
                    cestaIdAux = c.getCestaUnidades();
                    int total = cantidad + cestaIdAux;
                    c.setCestaUnidades(total);
                    respuesta = ControladoresDAO.cCesta.Modifica(c);
                }else{
                    respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);
                }
            }
        } else {
            nlc = new NoLogCesta();
            if (accionocul.equals("e")) {
                nlc = ControladoresDAO.cCestaNoLog.RecuperaPorId(clave);
                if (cantidad > 0) {
                    nlc.setNlcUnidades(cantidad);
                    respuesta = ControladoresDAO.cCestaNoLog.Modifica(nlc);
                } else {
                    respuesta = ControladoresDAO.cCestaNoLog.Elimina(nlc);
                }

            } else {
                nlc.setNlcId(clave);
                nlc.setNlcUnidades(cantidad);
                nlc.setNoLogUsuarios(ControladoresDAO.cUsuariosNoLog.RecuperaPorIdSinModificarSesion(nlu.getNluUsuId()));
                ropaStock = ControladoresDAO.cRopaStock.RecuperaPorRopaColorTalla(ropa, color, talla);
                nlc.setRopaStock(ropaStock);
                lista_ropa_Cesta_NoLog = ControladoresDAO.cCestaNoLog.RecuperaTodos(""+nlu.getNluUsuId());
                boolean aumentaCantidad = false;
                int nlcestaIdAux = 0;
                for(NoLogCesta c:lista_ropa_Cesta_NoLog){
                    if(c.getRopaStock().getRostockId() == ropaStock.getRostockId()){
                        aumentaCantidad = true;
                        nlcestaIdAux = c.getNlcId();
                    }
                }
                if(aumentaCantidad){
                    nlc = new NoLogCesta();
                    nlc = ControladoresDAO.cCestaNoLog.RecuperaPorId(nlcestaIdAux);
                    nlcestaIdAux = nlc.getNlcUnidades();
                    int total = cantidad + nlcestaIdAux;
                    nlc.setNlcUnidades(total);
                    respuesta = ControladoresDAO.cCestaNoLog.Modifica(nlc);
                }else{
                    respuesta = ControladoresDAO.cCestaNoLog.InsertaRopaCestaUsuario(nlc);
                }
            }            
        }
        return SUCCESS;
    }

    public String CestaFiltro() throws Exception {

        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }       
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                    u.getProvincias().getPaises().getPaisNombre(); //esta línea sólo sirve para que se cargue provincia y país
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                            + " con usuID "+sesion.get("usuId")+" el día "+new Date());
                }
            }
        }
       
        if (filtro == null) {
            filtro = "";
        }
        try{
            int respuesta;

            c = new Cesta();
            nlc = new NoLogCesta();
            if (accionocul.equals("e")) {
                if(u != null){
                    c = ControladoresDAO.cCesta.RecuperaPorId(clave);
                    if (cantidad > 0) {
                        c.setCestaUnidades(cantidad);
                        respuesta = ControladoresDAO.cCesta.Modifica(c);
                    } else {
                        respuesta = ControladoresDAO.cCesta.Elimina(c);
                    }
                } else {
                    nlc = ControladoresDAO.cCestaNoLog.RecuperaPorId(clave);
                    if (cantidad > 0) {
                        nlc.setNlcUnidades(cantidad);
                        respuesta = ControladoresDAO.cCestaNoLog.Modifica(nlc);
                    } else {
                        respuesta = ControladoresDAO.cCestaNoLog.Elimina(nlc);
                    }
                }
            }
        }catch(Exception e){
            //no necesito que haga nada acá. Es sólo por si accionocul no existe.
        }
        lista_menu_ropa = new ArrayList<Ropa>();
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos("","categoria.catDescripcion","","","2");
        for(Ropa lr: lista_ropa){
            String auxClientela = lr.getClientela().getClientelaDescripcion();
            String auxCategoria = lr.getCategoria().getCatDescripcion();
            boolean noEsta = true;
            for(Ropa lrm: lista_menu_ropa){
                if(auxClientela.equals(lrm.getClientela().getClientelaDescripcion()) && auxCategoria.equals(lrm.getCategoria().getCatDescripcion())){
                    noEsta = false;
                }
            }
            if(noEsta){
                lista_menu_ropa.add(lr);
            }
        }
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_ropa = poneDescuentosBien(lista_ropa);
        cargaCesta();
        if(u == null) {
            listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
            listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos("");
        }
        return SUCCESS;
    }
    
    public String CargaEliminaCesta() throws Exception {
        t = ControladoresDAO.cCesta.RecuperaPorId(clave);
        clientelaNombre = t.getRopaStock().getRopa().getClientela().getClientelaDescripcion();
        clave = t.getCestaId();
        roId2 = t.getRopaStock().getRopa().getRoId();
        precioEliminar = t.getCestaUnidades() * (t.getRopaStock().getRopa().getRoPrecio() - (t.getRopaStock().getRopa().getRoPrecio() * t.getRopaStock().getRopa().getRoDescuento() / 100));
        cantidad = t.getCestaUnidades();
        accionocul = "e";
        cabeceraocul = "Eliminar";
        botonocul = "Eliminar";
        return SUCCESS;
    }
    
     public String Pagar() throws Exception {
       if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        try{
            if(sesion.get("usuId") != ""){
                Usuarios user = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                u = ControladoresDAO.cUsuarios.RecuperaPorId(user.getUsuId());
                facUsuId = u.getUsuId(); //Esta variable la usaré para el envío del email
                lista_ropa_Cestas = cCesta.RecuperaTodos(""+u.getUsuId());
            } else {
                if(sesion.get("cookieLogueado") != null){
                    nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
                    nlu.setNluEmail(emailUNL);
                    ControladoresDAO.cUsuariosNoLog.Modifica(nlu);
                }
                lista_ropa_Cesta_NoLog = ControladoresDAO.cCestaNoLog.RecuperaTodos(""+nlu.getNluUsuId());
            }
        }catch(Exception e){
            HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
            huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                    + " el día "+new Date());
            return ERROR;
        }
        boolean hayStock = false;
        if(u == null) {
            hayStock = verificoQueHayStockUNL(lista_ropa_Cesta_NoLog);
        } else {
            hayStock = verificoQueHayStock(lista_ropa_Cestas);
        }
        boolean respuestaPago = false;
        if(hayStock){
            //En este punto se redirigiría a la página donde se genera el cobro.
            //Y la respuesta de esa página es la que le dará el nuevo valor a respuestaPago.
            respuestaPago = true;
        }
        try{
            if(respuestaPago){
                String numFac = ControladoresDAO.cFacturas.SiguienteFactura();
                Date dateFechaHoy = new Date();
                Facturas f;
                if(u == null) {
                    Provincias provincia = ControladoresDAO.cProvincias.RecuperaPorId(Integer.parseInt(prov));
                    Paises paises = ControladoresDAO.cPaises.RecuperaPorId(Integer.parseInt(pais));
                    f = new Facturas(0,numFac,nombre,direccion,ciudad,provincia.getProNombre(),cp,
                    paises.getPaisNombre(),"",0,dateFechaHoy,21, obs);
                    clave = ControladoresDAO.cFacturas.Inserta(f);
                    int nada;
                    for (NoLogCesta c : lista_ropa_Cesta_NoLog) {
                        HomeRopa hr = new HomeRopa();
                        int auxDescuento = c.getRopaStock().getRopa().getRoDescuento();
                        c.getRopaStock().setRopa(hr.descuentoEnRopa(c.getRopaStock().getRopa()));
                        FacturaDetalle fd = new FacturaDetalle(f, 
                                c.getRopaStock().getRopa().getRoDescuento(), 
                                c.getRopaStock().getRopa().getRoPrecio(), 
                                c.getRopaStock().getTallas().getTallaDescripcion(), 
                                c.getNlcUnidades(), 
                                c.getRopaStock().getRopa().getMarcas().getMarcaNombre(), 
                                c.getRopaStock().getRopa().getClientela().getClientelaDescripcion(), 
                                c.getRopaStock().getRopa().getCategoria().getCatDescripcion(), 
                                c.getRopaStock().getRopa().getSubcategoria().getSubDescripcion(), 
                                c.getRopaStock().getColor().getColorDescripcion(),
                                c.getRopaStock().getRopa().getRoId());
                        //al hacer el siguiente paso me modifica el descuento de la ropa en la BBDD
                        c.getRopaStock().getRopa().setRoDescuento(auxDescuento);
                        nada = ControladoresDAO.cFacturaDetalle.Inserta(fd);
                        if(nada == 1){
                            //Reduzco el stock de la ropa
                            ropaStock = ControladoresDAO.cRopaStock.RecuperaPorId(c.getRopaStock().getRostockId());
                            int unidadesActuales = ropaStock.getRostockUnidades();
                            ropaStock.setRostockUnidades(unidadesActuales - c.getNlcUnidades());
                            ControladoresDAO.cRopaStock.Modifica(ropaStock);
                            //Vacío la cesta
                            NoLogCesta cesta = cCestaNoLog.RecuperaPorId(c.getNlcId());
                            nada = ControladoresDAO.cCestaNoLog.Elimina(cesta);
                            cesta = null;
                        }
                        fd = null;
                    }
                } else {
                    f = new Facturas(u.getUsuId(), numFac, u.getUsuNombre()+" "+u.getUsuApellidos(), u.getUsuDireccion(), 
                            u.getUsuLocalidad(), u.getProvincias().getProNombre(), u.getUsuCp(), 
                            u.getProvincias().getPaises().getPaisNombre(), u.getUsuDni(), (int)u.getUsuDescuento(), 
                            dateFechaHoy, 21, obs);
                    clave = ControladoresDAO.cFacturas.Inserta(f);
                    int nada;
                    for (Cesta c : lista_ropa_Cestas) {
                        HomeRopa hr = new HomeRopa();
                        int auxDescuento = c.getRopaStock().getRopa().getRoDescuento();
                        c.getRopaStock().setRopa(hr.descuentoEnRopa(c.getRopaStock().getRopa()));
                        FacturaDetalle fd = new FacturaDetalle(f, 
                                c.getRopaStock().getRopa().getRoDescuento(), 
                                c.getRopaStock().getRopa().getRoPrecio(), 
                                c.getRopaStock().getTallas().getTallaDescripcion(), 
                                c.getCestaUnidades(), 
                                c.getRopaStock().getRopa().getMarcas().getMarcaNombre(), 
                                c.getRopaStock().getRopa().getClientela().getClientelaDescripcion(), 
                                c.getRopaStock().getRopa().getCategoria().getCatDescripcion(), 
                                c.getRopaStock().getRopa().getSubcategoria().getSubDescripcion(), 
                                c.getRopaStock().getColor().getColorDescripcion(),
                                c.getRopaStock().getRopa().getRoId());
                        //al hacer el siguiente paso me modifica el descuento de la ropa en la BBDD
                        c.getRopaStock().getRopa().setRoDescuento(auxDescuento);
                        nada = ControladoresDAO.cFacturaDetalle.Inserta(fd);
                        if(nada == 1){
                            //Reduzco el stock de la ropa
                            ropaStock = ControladoresDAO.cRopaStock.RecuperaPorId(c.getRopaStock().getRostockId());
                            int unidadesActuales = ropaStock.getRostockUnidades();
                            ropaStock.setRostockUnidades(unidadesActuales - c.getCestaUnidades());
                            ControladoresDAO.cRopaStock.Modifica(ropaStock);
                            //Vacío la cesta
                            Cesta cesta = cCesta.RecuperaPorId(c.getCestaId());
                            nada = ControladoresDAO.cCesta.Elimina(cesta);
                            cesta = null;
                        }
                        fd = null;
                    }
                }
                numFac = null;
                dateFechaHoy = null;
                f = null;
                lista_ropa_Cestas = null;
                return SUCCESS;
            }else{
                return INPUT;
            }
        } catch(Exception e){
            HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
            huv.escribirEnArchivoLog("Error al intentar realizar una compra en método " + e.getStackTrace()[0].getMethodName()
                    + " el día "+new Date());
            return INPUT;
        }
    }

    private boolean verificoQueHayStock(ArrayList<Cesta> lista_ropa_Cestas) {
        boolean resp = true;
        for(Cesta c:lista_ropa_Cestas){
            if(c.getCestaUnidades() > c.getRopaStock().getRostockUnidades()){
                resp = false;
            }
        }
        return resp;
    }

    private boolean verificoQueHayStockUNL(ArrayList<NoLogCesta> lista_ropa_Cesta_NoLog) {
        boolean resp = true;
        for(NoLogCesta c:lista_ropa_Cesta_NoLog){
            if(c.getNlcUnidades() > c.getRopaStock().getRostockUnidades()){
                resp = false;
            }
        }
        return resp;        
    }
    
    public ArrayList<Ropa> poneDescuentosBien (ArrayList<Ropa> lista){
        ArrayList<Ropa> listaConDescuentosBien = new ArrayList<>();
        for(Ropa lr: lista){
            listaConDescuentosBien.add(descuentoEnRopa(lr));
        }
        return listaConDescuentosBien;
    }
    
    public Ropa descuentoEnRopa(Ropa r){
            List<Integer> listaCampaniasDeEstaRopa = ControladoresDAO.cCampaniasRopa.RecuperaCampaniasPorRopa(r.getRoId());
            if(!listaCampaniasDeEstaRopa.isEmpty()){
                Date hoy = new Date();
                for(Integer camId:listaCampaniasDeEstaRopa){
                    Campania cam = ControladoresDAO.cCampanias.RecuperaPorId(camId);
                    if(hoy.after(cam.getCamInicio()) && hoy.before(cam.getCamFin())){
                        r.setRoDescuento(cam.getCamDescuento());
                    }
                }
            }
        return r;
    }

    public void cargarUsuarioNoLogueado(Map sesion) {
        if(sesion.get("cookieLogueado") != null){
            nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
        }
    }

    private void cargaCesta() {        
        if(sesion.get("usuId") == null){
                sesion.put("usuId", "");            
        }
        if(sesion.get("cookieLogueado") != null){
            nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
        }
        cantidad = 0;
        if(u != null) {
            lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
            for (Cesta aux : lista_ropa_Cestas) {
                cantidad = cantidad + aux.getCestaUnidades();
                precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
                for(Fotos f:aux.getRopaStock().getRopa().getFotoses()){
                    f.getFotosRuta(); //esto sólo sirve para cargar las fotos en memoria y que no de error de sesion
                }
                //System.out.println("aux.getRopaStock().getRopa().getRoPrecio(): "+aux.getRopaStock().getRopa().getRoPrecio()+" - aux.getCestaUnidades(): "+aux.getCestaUnidades()+" - aux.getRopaStock().getRopa().getRoDescuento(): "+aux.getRopaStock().getRopa().getRoDescuento());
            }
            
        } else {
            lista_ropa_Cesta_NoLog = ControladoresDAO.cCestaNoLog.RecuperaTodos(""+nlu.getNluUsuId());
            for(NoLogCesta caux:lista_ropa_Cesta_NoLog){
                cantidad = cantidad + caux.getNlcUnidades();
                precio += caux.getNlcUnidades() * (caux.getRopaStock().getRopa().getRoPrecio() - (caux.getRopaStock().getRopa().getRoPrecio() * caux.getRopaStock().getRopa().getRoDescuento() / 100));
                for(Fotos f:caux.getRopaStock().getRopa().getFotoses()){
                    f.getFotosRuta(); //esto sólo sirve para cargar las fotos en memoria y que no de error de sesion
                }
            }
            
        }
    }
    
    public String ajaxSumaRestaRopa() throws Exception {
        cantidad = 0;
        Ropa ro = new Ropa();
        int iunifact = 0;
        Double iprefactfinal = 0d;
        strockExcedido = "";
        if(usuId.length() < 17){
            c = ControladoresDAO.cCesta.RecuperaPorId(Integer.parseInt(cestaId));
            if(marca.equals("+")) {
                cantidad = c.getCestaUnidades() + 1;
            } else {
                cantidad = c.getCestaUnidades() - 1;
            }
            if(0 < cantidad && cantidad <= c.getRopaStock().getRostockUnidades()){
                c.setCestaUnidades(cantidad);
                ControladoresDAO.cCesta.Modifica(c);
            } else {
                if(marca.equals("+")) {
                    cantidad--;
                    strockExcedido = "En este momento tenemos " + c.getRopaStock().getRostockUnidades() + " prendas en stock.<br>Disculpe las molestias.";
                } else {
                    cantidad++;
                }
                ro = c.getRopaStock().getRopa();
            }
            ro = c.getRopaStock().getRopa();
            u = c.getUsuarios();
            List<Cesta> listaCesta = ControladoresDAO.cCesta.recuperaPorUsuario(u);
            for(Cesta cesta:listaCesta){
                iunifact += cesta.getCestaUnidades();
                iprefactfinal += cesta.getCestaUnidades() * (cesta.getRopaStock().getRopa().getRoPrecio() - (cesta.getRopaStock().getRopa().getRoPrecio() * cesta.getRopaStock().getRopa().getRoDescuento() / 100));
            }
            listaCesta = null;            
        } else {
            nlc = ControladoresDAO.cCestaNoLog.RecuperaPorId(Integer.parseInt(cestaId));
            if(marca.equals("+")) {
                cantidad = nlc.getNlcUnidades() + 1;
            } else {
                cantidad = nlc.getNlcUnidades() - 1;
            }
            if(0 < cantidad && cantidad <= nlc.getRopaStock().getRostockUnidades()){
                nlc.setNlcUnidades(cantidad);
                ControladoresDAO.cCestaNoLog.Modifica(nlc);
            } else {
                if(marca.equals("+")) {
                    cantidad--;
                    strockExcedido = "En este momento tenemos " + nlc.getRopaStock().getRostockUnidades() + " prendas en stock.<br>Disculpe las molestias.";
                } else {
                    cantidad++;
                }
            }
            ro = nlc.getRopaStock().getRopa();            
            nlu = nlc.getNoLogUsuarios();            
            List<NoLogCesta> listaNoLogCesta = ControladoresDAO.cCestaNoLog.recuperaPorUsuario(nlu);            
            for(NoLogCesta noLogCesta:listaNoLogCesta){
                iunifact += noLogCesta.getNlcUnidades();
                iprefactfinal += noLogCesta.getNlcUnidades() * (noLogCesta.getRopaStock().getRopa().getRoPrecio() - (noLogCesta.getRopaStock().getRopa().getRoPrecio() * noLogCesta.getRopaStock().getRopa().getRoDescuento() / 100));
            }
            listaNoLogCesta = null;
        }
        double total = cantidad * (ro.getRoPrecio() -(ro.getRoPrecio() * ro.getRoDescuento() / 100));
        stotal = (String.format("%.2f", total));
        scantidad = String.valueOf(cantidad);
        sunifact = ""+iunifact;
        sprefactura = (String.format("%.2f", iprefactfinal));
        //Libero memoria
        ro = null;
        c = null;
        u = null;
        nlc = null;
        nlu = null;
        return SUCCESS;
    }
    
    public String recargaCesta() throws Exception {        
        if(usuId.length() < 17){
            c = ControladoresDAO.cCesta.RecuperaPorId(Integer.parseInt(cestaId));
            if(marca.equals("+")) {
                cantidad = c.getCestaUnidades() + 1;
            } else {
                cantidad = c.getCestaUnidades() - 1;
            }
            if(0 < cantidad && cantidad <= c.getRopaStock().getRostockUnidades()){
                c.setCestaUnidades(cantidad);
                ControladoresDAO.cCesta.Modifica(c);
            }           
        } else {
            nlc = ControladoresDAO.cCestaNoLog.RecuperaPorId(Integer.parseInt(cestaId));
            if(marca.equals("+")) {
                cantidad = nlc.getNlcUnidades() + 1;
            } else {
                cantidad = nlc.getNlcUnidades() - 1;
            }
            if(0 < cantidad && cantidad <= nlc.getRopaStock().getRostockUnidades()){
                nlc.setNlcUnidades(cantidad);
                ControladoresDAO.cCestaNoLog.Modifica(nlc);
            }
        }
        return SUCCESS;
    }
}