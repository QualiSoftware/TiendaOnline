/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import ControladoresDAO.cUsuarios;
import Modelos.Cesta;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author javiermartinroncero
 */

public class HomeCesta extends ActionSupport {
    
    private Integer roId2;
    private Integer cantidad;
    private Cesta c;
    private Cesta ce;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private ArrayList<String> lista_precio_descuento;
    private String filtro;
    private Map sesion;
    private Double precio = 0.0;
    private int clave;
    private Cesta t;
    private Usuarios u;
    private String cabeceraocul;
    private String botonocul;
    private String accionocul;
    private String clientela;
    private Double precioEliminar = 0.0;

    public Cesta getCe() {
        return ce;
    }

    public void setCe(Cesta ce) {
        this.ce = ce;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }
    
    



    
    

    public ArrayList<String> getLista_precio_descuento() {
        return lista_precio_descuento;
    }

    public void setLista_precio_descuento(ArrayList<String> lista_precio_descuento) {
        this.lista_precio_descuento = lista_precio_descuento;
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
        int respuesta;
            ce = new Cesta();
            c = new Cesta();
            c.setCestaId(clave);
            c.setCestaUnidades(cantidad);
            c.setRopa(ControladoresDAO.cRopa.RecuperaPorId(roId2));
            c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(1));
            ce = ControladoresDAO.cCesta.RecuperaPorId(clave);
            System.out.println(accionocul);
            if (accionocul.equals("e")) {
                System.out.println("unidades tiene "+ce.getCestaUnidades());
                System.out.println("unidades tiene que tener "+cantidad);
                if(cantidad == ce.getCestaUnidades()){
                    respuesta = ControladoresDAO.cCesta.Elimina(c);
                }else{  
                    respuesta = ControladoresDAO.cCesta.Modifica(c);
                }
//                if(cantidad > 0){
//                    respuesta = ControladoresDAO.cCesta.Modifica(c);
//                }else{
//                    respuesta = ControladoresDAO.cCesta.Elimina(c);
//                }
                
            }else{
                respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);  
            }
            lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos("");

                for(Cesta aux : lista_ropa_Cestas){
                     precio +=  aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento()); 
                }
        return SUCCESS;
    }
    public String CrudActionUsuariosCesta() throws Exception {
        int respuesta;
            c = new Cesta();
            c.setCestaId(clave);
            c.setCestaUnidades(cantidad);
            c.setRopa(ControladoresDAO.cRopa.RecuperaPorId(clave));
            c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(1));
            System.out.println(accionocul);
            if (accionocul.equals("e")) {
                if(cantidad > 0){
                    respuesta = ControladoresDAO.cCesta.Modifica(c);
                }else{
                    respuesta = ControladoresDAO.cCesta.Elimina(c);
                }
                
            }else{
                respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);  
            }
            lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos("");

                for(Cesta aux : lista_ropa_Cestas){
                     precio +=  aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento()); 
                }
               
        return SUCCESS;
    }
    
    
     public String CestaFiltro() throws Exception {
        
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
         try{
         Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
         }catch(Exception e){
         return INPUT;
         }
         */
        if (filtro == null) {
            filtro = "";
        }
        
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(filtro);
        lista_precio_descuento = new ArrayList<String>();
        for(Cesta aux:lista_ropa_Cestas){
           precio +=  aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento());
           lista_precio_descuento.add(""+aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento()));
        }
      
        return SUCCESS;
    }
     public String CargaEliminaCesta() throws Exception {
     
        t = ControladoresDAO.cCesta.RecuperaPorId(clave);
            clientela = t.getRopa().getClientela().getClientelaDescripcion();
            clave = t.getCestaId();
            roId2 = t.getRopa().getRoId();
            precioEliminar = t.getCestaUnidades()* (t.getRopa().getRoPrecio()- t.getRopa().getRoDescuento());
            cantidad = t.getCestaUnidades();
            accionocul = "e";
            cabeceraocul = "Eliminar";
            botonocul = "Eliminar";
        
        return SUCCESS;
     }
     public String FormalizaFactura() throws Exception {
         u = new Usuarios();
         u = cUsuarios.RecuperaPorId(1);
         lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos("1");
         lista_precio_descuento = new ArrayList<String>();
        for(Cesta aux:lista_ropa_Cestas){
           precio +=  aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento());
           lista_precio_descuento.add(""+aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento()));
        }
         
        return SUCCESS;
     }
     
     
    
}
