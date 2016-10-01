/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;


import Modelos.Clientela;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeClientela extends ActionSupport {
    
     //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Clientela> Lista_Clientela;
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

    public List<Clientela> getLista_Clientela() {
        return Lista_Clientela;
    }
    public void setLista_Clientela(List<Clientela> Lista_Categorias) {
        this.Lista_Clientela = Lista_Clientela;
    }

    public String ClientelaFiltro() throws Exception {
         System.out.println("este es el filtro clientela  "+filtro);
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
       
        Lista_Clientela = ControladoresDAO.cClientela.RecuperaTodos(filtro);
        return SUCCESS;
    }
    public String ClientelaForm() throws Exception {
        System.out.println(clave);
        System.out.println(accion);
        if(accion.equals("a")){
            codigo2 = 0;
            nombre2 = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Clientela p = ControladoresDAO.cClientela.RecuperaPorId(clave);           
            codigo2 = p.getClientelaId();
            nombre2 = p.getClientelaDescripcion();

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
    public String CrudActionClientela() throws Exception {
          
        if (accionocul.equals("a")) {
            
           Clientela p = new Clientela(codigo2,nombre2);
            ControladoresDAO.cClientela.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Clientela p = new Clientela(codigo2, nombre2);  
            ControladoresDAO.cClientela.Modifica(p);
        }
        if (accionocul.equals("e")) {
            ControladoresDAO.cClientela.Elimina(codigo2);
        }
        
        return SUCCESS;
    }
    
}
