/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Look;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeLook extends ActionSupport {
    
          //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Look> Lista_Look;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int lookId;
    private  String lookDescripcion;
    
    
    
    
    //getters and setters
    public int getClave() {    
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
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

    public int getLookId() {
        return lookId;
    }

    public void setLookId(int lookId) {
        this.lookId = lookId;
    }

    public String getLookDescripcion() {
        return lookDescripcion;
    }

    public void setLookDescripcion(String lookDescripcion) {
        this.lookDescripcion = lookDescripcion;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public List<Look> getLista_Look() {
        return Lista_Look;
    }

    public void setLista_Look(List<Look> Lista_Look) {
        this.Lista_Look = Lista_Look;
    }



 

    public String LookFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Look = ControladoresDAO.cLook.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String LookForm() throws Exception {
        if(accion.equals("a")){
            lookId = 0;
            lookDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Look p = ControladoresDAO.cLook.RecuperaPorId(clave);           
            lookId = p.getLookId();
            lookDescripcion = p.getLookDescripcion();
            if(accion.equals("m")){
                accionocul = "m";
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                accionocul = "e";
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
        }
        return SUCCESS;
    }
    
    public String CrudActionLook() throws Exception {         
        if (accionocul.equals("a")) {            
           Look p = new Look(lookDescripcion);
           p.setLookId(lookId);
            ControladoresDAO.cLook.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Look p = new Look(lookDescripcion); 
            p.setLookId(lookId);
            ControladoresDAO.cLook.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Look p = new Look(lookDescripcion); 
            p.setLookId(lookId);
            ControladoresDAO.cLook.Elimina(p);
        }        
        return SUCCESS;
    }  
}
