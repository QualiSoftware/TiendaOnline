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
                System.out.println(aux.getCestaUnidades()); 
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

        return SUCCESS;
    }
    
    
    
}
