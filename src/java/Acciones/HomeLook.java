package Acciones;

import Modelos.Look;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*  
*   Author     : QualiSoftware
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
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int lookId;
    private String lookDescripcion;
    private String mensajeNoBorrar;
    
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

    public String getMensajeNoBorrar() {
        return mensajeNoBorrar;
    }

    public void setMensajeNoBorrar(String mensajeNoBorrar) {
        this.mensajeNoBorrar = mensajeNoBorrar;
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
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Look p = ControladoresDAO.cLook.RecuperaPorId(clave);           
            lookId = p.getLookId();
            lookDescripcion = p.getLookDescripcion();
            if(accion.equals("m")){
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
        }
        return SUCCESS;
    }
    
    public String CrudActionLook() throws Exception {         
        if (accion.equals("a")) {            
           Look p = new Look(lookDescripcion);
            ControladoresDAO.cLook.Inserta(p);
        }
        if (accion.equals("m")) {
            Look p = new Look(lookDescripcion); 
            p.setLookId(lookId);
            ControladoresDAO.cLook.Modifica(p);
        }
        if (accion.equals("e")) {
            Look p = ControladoresDAO.cLook.RecuperaPorId(lookId);
            ArrayList listaInactivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("look.lookId",lookId,0);
            ArrayList listaActivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("look.lookId",lookId,1);
            int cantidad = listaActivas.size() + listaInactivas.size();
            if(cantidad > 0){
                mensajeNoBorrar = "Hay "+listaActivas.size()+" ropa visible y "+listaInactivas.size()+" ropa no visible \r\nque utilizan este Look.";
                return INPUT;
            }else{
                ControladoresDAO.cLook.Elimina(p);
            }
        }        
        return SUCCESS;
    }
}
