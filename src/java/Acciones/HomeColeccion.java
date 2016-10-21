/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;


import Modelos.Coleccion;
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
public class HomeColeccion extends ActionSupport {
    
         //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Coleccion> Lista_Coleccion;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int coleccionId;
    private  String coleccionDescripcion;
    
    
    
    
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

    public int getColeccionId() {
        return coleccionId;
    }

    public void setColeccionId(int coleccionId) {
        this.coleccionId = coleccionId;
    }

    public String getColeccionDescripcion() {
        return coleccionDescripcion;
    }

    
    public void setColeccionDescripcion(String coleccionDescripcion) {
        this.coleccionDescripcion = coleccionDescripcion;
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

    public List<Coleccion> getLista_Coleccion() {
        return Lista_Coleccion;
    }
    public void setLista_Coleccion(List<Coleccion> Lista_Categorias) {
        this.Lista_Coleccion = Lista_Coleccion;
    }

    public String ColeccionFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Coleccion = ControladoresDAO.cColeccion.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String ColeccionForm() throws Exception {
        if(accion.equals("a")){
            coleccionId = 0;
            coleccionDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Coleccion p = ControladoresDAO.cColeccion.RecuperaPorId(clave);           
            coleccionId = p.getColeccionId();
            coleccionDescripcion = p.getColeccionDescripcion();

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

    public String CrudActionColeccion() throws Exception {
        if (accionocul.equals("a")) {
           Coleccion p = new Coleccion(coleccionDescripcion);
           p.setColeccionId(coleccionId);
            ControladoresDAO.cColeccion.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Coleccion p = new Coleccion(coleccionDescripcion); 
            p.setColeccionId(coleccionId);
            ControladoresDAO.cColeccion.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Coleccion p = new Coleccion(coleccionDescripcion); 
            p.setColeccionId(coleccionId);
            ControladoresDAO.cColeccion.Elimina(p);
        }
        return SUCCESS;
    }
}