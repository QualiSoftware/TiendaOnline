package Acciones;

import ControladoresDAO.cCesta;
import ControladoresDAO.cUsuarios;
import Modelos.Campania;
import Modelos.Cesta;
import Modelos.FacturaDetalle;
import Modelos.Facturas;
import Modelos.Fotos;
import Modelos.Marcas;
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

/*    public String CrudActionCesta() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
         try{
         u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
         }catch(Exception e){
         return INPUT;
         }
        int respuesta;
        ce = new Cesta();
        c = new Cesta();
        c.setCestaId(clave);
        c.setCestaUnidades(cantidad);
        c.setRopaStock(ControladoresDAO.cRopaStock.RecuperaPorId(rostockId));
        c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(u.getUsuId()));
        ce = ControladoresDAO.cCesta.RecuperaPorId(clave);
        if (accionocul.equals("e")) {
            if (cantidad == ce.getCestaUnidades()) {
                respuesta = ControladoresDAO.cCesta.Elimina(c);
            } else {
                c.setCestaUnidades(ce.getCestaUnidades() - cantidad);
                respuesta = ControladoresDAO.cCesta.Modifica(c);
            }
        } else {
            respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);
        }   
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
        for (Cesta aux : lista_ropa_Cestas) {
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
        }
        return SUCCESS;
    }*/

    public String CrudActionUsuariosCesta() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
         try{
            Usuarios user = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
            u = ControladoresDAO.cUsuarios.RecuperaPorIdSinModificarSesion(user.getUsuId());
            if(u.getUsuAdministrador() == 1){
                return INPUT;                
            }
         }catch(Exception e){
             //si no hay usuario logueado por ahora entra acá
            return INPUT;
         }
        int respuesta;
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
        return SUCCESS;
    }

    public String CestaFiltro() throws Exception {

        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
         try{
            Usuarios user = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
            u = ControladoresDAO.cUsuarios.RecuperaPorIdSinModificarSesion(user.getUsuId());
            u.getProvincias().getPaises().getPaisNombre(); //esta línea sólo sirve para que se cargue provincia y país
         }catch(Exception e){
            return INPUT;
         }
       
        if (filtro == null) {
            filtro = "";
        }
        try{
            int respuesta;

            c = new Cesta();
            if (accionocul.equals("e")) {
                c = ControladoresDAO.cCesta.RecuperaPorId(clave);
                if (cantidad > 0) {
                    c.setCestaUnidades(cantidad);
                    respuesta = ControladoresDAO.cCesta.Modifica(c);
                } else {
                    respuesta = ControladoresDAO.cCesta.Elimina(c);
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
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
        cantidad = 0;
        for (Cesta aux : lista_ropa_Cestas) {
            cantidad = cantidad + aux.getCestaUnidades();
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
            for(Fotos f:aux.getRopaStock().getRopa().getFotoses()){
                f.getFotosRuta(); //esto sólo sirve para cargar las fotos en memoria y que no de error de sesion
            }
            //System.out.println("aux.getRopaStock().getRopa().getRoPrecio(): "+aux.getRopaStock().getRopa().getRoPrecio()+" - aux.getCestaUnidades(): "+aux.getCestaUnidades()+" - aux.getRopaStock().getRopa().getRoDescuento(): "+aux.getRopaStock().getRopa().getRoDescuento());
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

/*    public String FormalizaFactura() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
         try{
         u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
         }catch(Exception e){
         return INPUT;
         }
        us = new Usuarios();
        us = cUsuarios.RecuperaPorId(u.getUsuId());
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
        for (Cesta aux : lista_ropa_Cestas) {
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
        }
        return SUCCESS;
    }*/
    
     public String Pagar() throws Exception {
       if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        try{
            Usuarios user = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
            u = ControladoresDAO.cUsuarios.RecuperaPorId(user.getUsuId());
            facUsuId = u.getUsuId(); //Esta variable la usaré para el envío del email
            lista_ropa_Cestas = cCesta.RecuperaTodos(""+u.getUsuId());
        }catch(Exception e){
            System.out.println("e: " + e);
           return ERROR;
        }
        boolean hayStock = verificoQueHayStock(lista_ropa_Cestas);
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
                Facturas f = new Facturas(u.getUsuId(), numFac, u.getUsuNombre()+" "+u.getUsuApellidos(), u.getUsuDireccion(), 
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
                numFac = null;
                dateFechaHoy = null;
                f = null;
                lista_ropa_Cestas = null;
                return SUCCESS;
            }else{
                return INPUT;
            }
        } catch(Exception e){
            System.out.println("e: " + e);
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
}