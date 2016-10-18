/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Fotos;
import Modelos.Ropa;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeFotos extends ActionSupport {
    
          //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Fotos> Lista_Fotos;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int codigo2;
    private  String nombre2;
    private Ropa Rropa ;
    private  List Lista_Ropa;
    private  int idRopa;
    private List<String> lista;
    private  List SeletRopa;

    
    



    //getters and setters
    
    public List getSeletRopa() {
        return SeletRopa;
    }
    public void setSeletRopa(List SeletRopa) {
        this.SeletRopa = SeletRopa;
    }

    public List<String> getLista() {
        return lista;
    }
    public void setLista(List<String> lista) {
        this.lista = lista;
    }

    public List getLista_Ropa() {
        return Lista_Ropa;
    }

    public void setLista_Ropa(List Lista_Ropa) {
        this.Lista_Ropa = Lista_Ropa;
    }

    public int getIdRopa() {
        return idRopa;
    }
    public void setIdRopa(int idRopa) {
        this.idRopa = idRopa;
    }

    public Ropa getRropa() {
        return Rropa;
    }

    public void setRropa(Ropa Rropa) {
        this.Rropa = Rropa;
    }
    
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

    public List<Fotos> getLista_Fotos() {
        return Lista_Fotos;
    }

 



 

    public String FotosFiltro() throws Exception {

        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        if (filtro == null) {
            filtro = "";
        }

        Lista_Fotos = ControladoresDAO.cFotos.RecuperaTodos(filtro);
        return SUCCESS;
    }
    public String FotosForm() throws Exception {
        if (accion.equals("a")) {
            codigo2 = 0;
            nombre2 = "";
            if (filtro == null) {
                filtro = "";
            }
            Lista_Fotos = ControladoresDAO.cFotos.RecuperaTodos(filtro);
            lista = new ArrayList<String>();
            for (Fotos Lf : Lista_Fotos) {
                lista.add(Integer.toString(Lf.getRopa().getRoId()));
            }
           
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        } else {
            Fotos p = ControladoresDAO.cFotos.RecuperaPorId(clave);
            codigo2 = p.getFotosId();
            nombre2 = p.getFotosRuta();
            lista = new ArrayList<String>(); 
             Lista_Fotos = ControladoresDAO.cFotos.RecuperaTodos(filtro);
            lista = new ArrayList<String>();
            for (Fotos Lf : Lista_Fotos) {
                lista.add(Integer.toString(Lf.getRopa().getRoId()));
            }
            idRopa = p.getRopa().getRoId();

            if (accion.equals("m")) {
                accionocul = "m";
                cabeceraocul = "Modificar";
                botonocul = "Modificar";
            } else {
                accionocul = "e";
                cabeceraocul = "Eliminar";
                botonocul = "Eliminar";
            }

        }
        return SUCCESS;
    }

    public String CrudActionFotos() throws Exception {         
        if (accionocul.equals("a")) {            
           Fotos p = new Fotos(Rropa,nombre2);
           p.setFotosId(codigo2);
           System.out.println(p.getRopa().getRoId());
            ControladoresDAO.cFotos.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Fotos p = new Fotos(Rropa,nombre2); 
            p.setFotosId(codigo2);
            ControladoresDAO.cFotos.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Fotos p = new Fotos(Rropa,nombre2); 
            p.setFotosId(codigo2);
            ControladoresDAO.cFotos.Elimina(p);
        }        
        return SUCCESS;
    }    
    
}
