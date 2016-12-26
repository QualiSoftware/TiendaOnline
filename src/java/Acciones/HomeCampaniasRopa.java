package Acciones;

import Modelos.Campania;
import Modelos.CampaniaRopa;
import Modelos.CampaniaRopaId;
import Modelos.Ropa;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*  Document   : HomeCampaniasRopa.java
*   Created on : 22-dic-2016
*   Author     : QualiSoftware
*/
public class HomeCampaniasRopa {
    private Map sesion;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    private Campania campania;
    private Ropa ropa;
    private int camId;
    private int roId;
    private int clave;
    private ArrayList<Ropa> lista_ropa;
    private String checkboxNombre;
    private List<Integer> lista_ropaEnCampania;

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
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

    public Campania getCampania() {
        return campania;
    }

    public void setCampania(Campania campania) {
        this.campania = campania;
    }

    public Ropa getRopa() {
        return ropa;
    }

    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }

    public int getCamId() {
        return camId;
    }

    public void setCamId(int camId) {
        this.camId = camId;
    }

    public int getRoId() {
        return roId;
    }

    public void setRoId(int roId) {
        this.roId = roId;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public ArrayList<Ropa> getLista_ropa() {
        return lista_ropa;
    }

    public void setLista_ropa(ArrayList<Ropa> lista_ropa) {
        this.lista_ropa = lista_ropa;
    }

    public String getCheckboxNombre() {
        return checkboxNombre;
    }

    public void setCheckboxNombre(String checkboxNombre) {
        this.checkboxNombre = checkboxNombre;
    }

    public List<Integer> getLista_ropaEnCampania() {
        return lista_ropaEnCampania;
    }

    public void setLista_ropaEnCampania(List<Integer> lista_ropaEnCampania) {
        this.lista_ropaEnCampania = lista_ropaEnCampania;
    }
          
    public String CampaniasRopaFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(accion.equals("a")){
            camId = ControladoresDAO.cCampanias.UltimaCampania();
            cabeceraocul = "Alta";
        }else{
            cabeceraocul = "Modificación";            
        }
        botonocul = "Guardar";
        campania = ControladoresDAO.cCampanias.RecuperaPorId(camId);
        lista_ropa = ControladoresDAO.cRopa.RecuperaPorMarca(campania.getMarcas().getMarcaId()+"","");        
        if(accion.equals("m")){
            lista_ropaEnCampania = ControladoresDAO.cCampaniasRopa.RecuperaRopaPorCampania(camId);
        }
        return SUCCESS;
    }
    
    public String CrudActionCampaniasRopa() throws Exception {
        campania = ControladoresDAO.cCampanias.RecuperaPorId(camId);
        String checkboxArray[] = checkboxNombre.split(", ");
        if (accion.equals("m")) {
                ControladoresDAO.cCampaniasRopa.Elimina(camId);            
        }
        for(String ca:checkboxArray){
            ropa = ControladoresDAO.cRopa.RecuperaPorId(Integer.parseInt(ca));
            CampaniaRopaId crid = new CampaniaRopaId(camId, Integer.parseInt(ca));
            CampaniaRopa cr = new CampaniaRopa(crid,campania,ropa);
            ControladoresDAO.cCampaniasRopa.Inserta(cr);
        }
        return SUCCESS;
    }
}
