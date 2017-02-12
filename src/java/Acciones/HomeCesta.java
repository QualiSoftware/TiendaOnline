/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import ControladoresDAO.cCategorias;
import ControladoresDAO.cCesta;
import ControladoresDAO.cClientela;
import ControladoresDAO.cColor;
import ControladoresDAO.cMarcas;
import ControladoresDAO.cRopa;
import ControladoresDAO.cSubcategorias;
import ControladoresDAO.cTallas;
import ControladoresDAO.cUsuarios;
import Modelos.Categoria;
import Modelos.Cesta;
import Modelos.Clientela;
import Modelos.Color;
import Modelos.FacturaDetalle;
import Modelos.Facturas;
import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Subcategoria;
import Modelos.Tallas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.hibernate.Hibernate;
import org.hibernate.Session;



/**
 *
 * @author javiermartinroncero
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
    private String clientela;
    private Double precioEliminar = 0.0;
    private boolean aceptarpago;
    private Usuarios u;
    private String obs;
    private String prov;
    private String pais;
    private int facUsuId;
    private String clientela2;
    private String categoria2;
    private String marcas2;
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

    public String getClientela() {
        return clientela;
    }

    public void setClientela(String clientela) {
        this.clientela = clientela;
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

    public String getClientela2() {
        return clientela2;
    }

    public void setClientela2(String clientela2) {
        this.clientela2 = clientela2;
    }

    public String getCategoria2() {
        return categoria2;
    }

    public void setCategoria2(String categoria2) {
        this.categoria2 = categoria2;
    }

    public String getMarcas2() {
        return marcas2;
    }

    public void setMarcas2(String marcas2) {
        this.marcas2 = marcas2;
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

    public String CrudActionCesta() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
         try{
         u = (Usuarios) sesion.get("usuarioLogueado");
         }catch(Exception e){
         return INPUT;
         }
        int respuesta;
        ce = new Cesta();
        c = new Cesta();
        c.setCestaId(clave);
        c.setCestaUnidades(cantidad);
        //c.setRopa(ControladoresDAO.cRopa.RecuperaPorId(roId2));
        c.setRopaStock(ControladoresDAO.cRopaStock.RecuperaPorId(rostockId));
        c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(u.getUsuId()));
        ce = ControladoresDAO.cCesta.RecuperaPorId(clave);
        System.out.println(accionocul);
        if (accionocul.equals("e")) {
            System.out.println("unidades tiene " + ce.getCestaUnidades());
            System.out.println("unidades tiene que tener " + cantidad);
            if (cantidad == ce.getCestaUnidades()) {
                respuesta = ControladoresDAO.cCesta.Elimina(c);
            } else {
                c.setCestaUnidades(ce.getCestaUnidades() - cantidad);
                respuesta = ControladoresDAO.cCesta.Modifica(c);
            }
//                if(cantidad > 0){
//                    respuesta = ControladoresDAO.cCesta.Modifica(c);
//                }else{
//                    respuesta = ControladoresDAO.cCesta.Elimina(c);
//                }

        } else {
            respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);
        }
        
        
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());

        for (Cesta aux : lista_ropa_Cestas) {
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
        }
        return SUCCESS;
    }

    public String CrudActionUsuariosCesta() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
         try{
            u = (Usuarios) sesion.get("usuarioLogueado");
            if(u.getUsuAdministrador() == 1){
                return INPUT;                
            }
         }catch(Exception e){
             //si no hay usuario logueado por ahora entra acá
            return INPUT;
         }
        int respuesta;
        c = new Cesta();
        c.setCestaId(clave);
        c.setCestaUnidades(cantidad);
        c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(u.getUsuId()));
        ropaStock = ControladoresDAO.cRopaStock.RecuperaPorRopaColorTalla(ropa, color, talla);
        c.setRopaStock(ropaStock);
        if (accionocul.equals("e")) {
            if (cantidad > 0) {
                respuesta = ControladoresDAO.cCesta.Modifica(c);
            } else {
                respuesta = ControladoresDAO.cCesta.Elimina(c);
            }

        } else {
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
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
        for (Cesta aux : lista_ropa_Cestas) {
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
        }
        return SUCCESS;
    }

    public String CestaFiltro() throws Exception {

        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
         try{
         Usuarios user = (Usuarios) sesion.get("usuarioLogueado");
         u = ControladoresDAO.cUsuarios.RecuperaPorIdSinModificarSesion(user.getUsuId());
         u.getProvincias().getPaises().getPaisNombre(); //esta línea sólo sirve para que se cargue provincia y país
         }catch(Exception e){
            return INPUT;
         }
       
        if (filtro == null) {
            filtro = "";
        }
        //System.out.println("usuario cesta "+u.getUsuId());
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(""+u.getUsuId());
        
        cantidad = 0;
        for (Cesta aux : lista_ropa_Cestas) {
            cantidad = cantidad + aux.getCestaUnidades();
            precio += aux.getCestaUnidades() * (aux.getRopaStock().getRopa().getRoPrecio() - (aux.getRopaStock().getRopa().getRoPrecio() * aux.getRopaStock().getRopa().getRoDescuento() / 100));
            
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
        lista_ropa.clear();

        return SUCCESS;
    }

    public String CargaEliminaCesta() throws Exception {

        t = ControladoresDAO.cCesta.RecuperaPorId(clave);
        clientela = t.getRopaStock().getRopa().getClientela().getClientelaDescripcion();
        clave = t.getCestaId();
        roId2 = t.getRopaStock().getRopa().getRoId();
        precioEliminar = t.getCestaUnidades() * (t.getRopaStock().getRopa().getRoPrecio() - (t.getRopaStock().getRopa().getRoPrecio() * t.getRopaStock().getRopa().getRoDescuento() / 100));
        cantidad = t.getCestaUnidades();
        accionocul = "e";
        cabeceraocul = "Eliminar";
        botonocul = "Eliminar";

        return SUCCESS;
    }

    public String FormalizaFactura() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
         try{
         u = (Usuarios) sesion.get("usuarioLogueado");
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
    }
    
     public String Pagar() throws Exception {
       if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        // para cuando tengamos sesión de usuario
        try{
           Usuarios user = (Usuarios) sesion.get("usuarioLogueado");
           u = ControladoresDAO.cUsuarios.RecuperaPorId(user.getUsuId());
        }catch(Exception e){
            System.out.println("e: " + e);
           return INPUT;
        }
        boolean respuestaPago = true;
        //En este punto, el boolean respuestaPago se crearía como false y a continuación se redirigiría a la página
        //donde se genera el cobro. Y la respuesta de esa página es la que le dará el nuevo valor a respuestaPago
        try{
            if(respuestaPago){
                String numFac = ControladoresDAO.cFacturas.SiguienteFactura();
                Date dateFechaHoy = new Date();            
                Facturas f = new Facturas(u.getUsuId(), numFac, u.getUsuNombre()+" "+u.getUsuApellidos(), u.getUsuDireccion(), 
                        u.getUsuLocalidad(), u.getProvincias().getProNombre(), u.getUsuCp(), 
                        u.getProvincias().getPaises().getPaisNombre(), u.getUsuDni(), (int)u.getUsuDescuento(), 
                        dateFechaHoy, 21, obs);
                clave = ControladoresDAO.cFacturas.Inserta(f);
                lista_ropa_Cestas = cCesta.RecuperaTodos(""+u.getUsuId());
                int nada;
                for (Cesta c : lista_ropa_Cestas) {
                    HomeRopa hr = new HomeRopa();
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
                            c.getRopaStock().getColor().getColorDescripcion());
                    //al hacer el siguiente paso me modifica el descuento de la ropa en la BBDD
                    nada = ControladoresDAO.cFacturaDetalle.Inserta(fd); //
                    if(nada == 1){
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
}