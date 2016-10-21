/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Categoria;
import Modelos.Usuarios;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeCategorias extends ActionSupport {
    //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Categoria> Lista_Categorias;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int catId;
    private  String catDescripcion;
    
    
    
    
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

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatDescripcion() {
        return catDescripcion;
    }

    
    public void setCatDescripcion(String catDescripcion) {
        this.catDescripcion = catDescripcion;
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

    public List<Categoria> getLista_Categorias() {
        return Lista_Categorias;
    }
    public void setLista_Categorias(List<Categoria> Lista_Categorias) {
        this.Lista_Categorias = Lista_Categorias;
    }

    public String CategoriaFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Categorias = ControladoresDAO.cCategorias.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String CategoriasForm() throws Exception {
        if(accion.equals("a")){
            catId = 0;
            catDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Categoria p = ControladoresDAO.cCategorias.RecuperaPorId(clave);           
            catId = p.getCatId();
            catDescripcion = p.getCatDescripcion();
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

    public String CrudActionCategorias() throws Exception {
        if (accionocul.equals("a")) {
           Categoria p = new Categoria(catDescripcion);
           p.setCatId(catId);
            ControladoresDAO.cCategorias.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Categoria p = new Categoria(catDescripcion);
            p.setCatId(catId);
            ControladoresDAO.cCategorias.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Categoria p = new Categoria(catDescripcion);
            p.setCatId(catId);
            ControladoresDAO.cCategorias.Elimina(p);
        }
        return SUCCESS;
    }
}