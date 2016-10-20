/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Cesta;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;

/**
 *
 * @author javiermartinroncero
 */





public class HomeCesta extends ActionSupport {
    
    private Integer roId2;
    private Integer cantidad;
    private Cesta c;

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

        return SUCCESS;
    }
    
}
