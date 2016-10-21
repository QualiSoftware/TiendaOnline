/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Cesta;
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
    private ArrayList<Cesta> lista_ropa_Cestas;
    private String filtro;
    private Map sesion;
    private Double precio = 0.0;
    private int clave;
    private Cesta t;
    private String cabeceraocul;
    private String botonocul;
    private String accionocul;
    private String clientela;

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
            c = new Cesta();

            c.setCestaUnidades(cantidad);
            c.setRopa(ControladoresDAO.cRopa.RecuperaPorId(roId2));
            c.setUsuarios(ControladoresDAO.cUsuarios.RecuperaPorId(1));
            respuesta = ControladoresDAO.cCesta.InsertaRopaCestaUsuario(c);
            
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
        for(Cesta aux:lista_ropa_Cestas){
           precio +=  aux.getCestaUnidades()*(aux.getRopa().getRoPrecio()-aux.getRopa().getRoDescuento());
            System.out.println(precio);
        }
         System.out.println(precio);
        return SUCCESS;
    }
     public String CargaEliminaCesta() throws Exception {
     
        t = ControladoresDAO.cCesta.RecuperaPorId(clave);
            clientela = t.getRopa().getClientela().getClientelaDescripcion();
            cantidad = t.getCestaUnidades();
            accionocul = "e";
            cabeceraocul = "Eliminar";
            botonocul = "Eliminar";
        
        return SUCCESS;
     }
    
}
