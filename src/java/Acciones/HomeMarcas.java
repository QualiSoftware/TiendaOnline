package Acciones;

import Modelos.Marcas;
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
public class HomeMarcas extends ActionSupport {
    
    
          //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Marcas> Lista_Marcas;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int marcaId;
    private  String marcaNombre;
    
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

    public int getMarcaId() {
        return marcaId;
    }

    public void setMarcaId(int marcaId) {
        this.marcaId = marcaId;
    }

    public String getMarcaNombre() {
        return marcaNombre;
    }

    public void setMarcaNombre(String marcaNombre) {
        this.marcaNombre = marcaNombre;
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

    public List<Marcas> getLista_Marcas() {
        return Lista_Marcas;
    }

    public void setLista_Marcas(List<Marcas> Lista_Marcas) {
        this.Lista_Marcas = Lista_Marcas;
    }

    public String MarcasFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Marcas = ControladoresDAO.cMarcas.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String MarcasForm() throws Exception {
        if(accion.equals("a")){
            marcaId = 0;
            marcaNombre = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Marcas p = ControladoresDAO.cMarcas.RecuperaPorId(clave);           
            marcaId = p.getMarcaId();
            marcaNombre = p.getMarcaNombre();

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
    
    public String CrudActionMarcas() throws Exception {         
        if (accionocul.equals("a")) {            
           Marcas p = new Marcas(marcaNombre);
           p.setMarcaId(marcaId);
            ControladoresDAO.cMarcas.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Marcas p = new Marcas(marcaNombre); 
             p.setMarcaId(marcaId);
            ControladoresDAO.cMarcas.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Marcas p = new Marcas(marcaNombre); 
             p.setMarcaId(marcaId);
            ControladoresDAO.cMarcas.Elimina(p);
        }        
        return SUCCESS;
    }  
}