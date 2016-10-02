/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;


import Modelos.Coleccion;
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
    private int codigo2;
    private  String nombre2;
    
    
    
    
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

    public int getCodigo2() {
        return codigo2;
    }

    public void setCodigo2(int codigo2) {
        this.codigo2 = codigo2;
    }

    public String getNombre2() {
        return nombre2;
    }

    
    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
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
            codigo2 = 0;
            nombre2 = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Coleccion p = ControladoresDAO.cColeccion.RecuperaPorId(clave);           
            codigo2 = p.getColeccionId();
            nombre2 = p.getColeccionDescripcion();

            if(accion.equals("m")){
                accionocul = "m";
                cabeceraocul = "Modificar";
                botonocul = "Modificar";  
            }else{
                accionocul = "e";
                cabeceraocul = "Eliminar";
                botonocul = "Eliminar";
            }
            
        }
        return SUCCESS;
    }
    public String CrudActionColeccion() throws Exception {
          
        if (accionocul.equals("a")) {
            
           Coleccion p = new Coleccion(nombre2);
           p.setColeccionId(codigo2);
            ControladoresDAO.cColeccion.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Coleccion p = new Coleccion(nombre2); 
            p.setColeccionId(codigo2);
            ControladoresDAO.cColeccion.Modifica(p);
        }
        if (accionocul.equals("e")) {
            ControladoresDAO.cColeccion.Elimina(codigo2);
        }
        
        return SUCCESS;
    }
    
}
