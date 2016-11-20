package Acciones;

import Modelos.Campania;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/*  Document   : HomeCampanias.java
*   Created on : 20-nov-2016
*   Author     : QualiSoftware
*/
public class HomeCampanias extends ActionSupport {
    
    private Map sesion;
    private String filtro;
    private String fechaCampania;
    private String orden;
    private  List<Campania> lista_campanias;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int camId;
    private String camMarca;
    private String camNombre;
    private String camInicio;
    private String camFin;
    private String camFoto;
    private String ruta;
    private File archivo = null;
    private String archivoFileName;

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

    public String getFechaCampania() {
        return fechaCampania;
    }

    public void setFechaCampania(String fechaCampania) {
        this.fechaCampania = fechaCampania;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public List<Campania> getLista_campanias() {
        return lista_campanias;
    }

    public void setLista_campanias(List<Campania> lista_campanias) {
        this.lista_campanias = lista_campanias;
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

    public int getCamId() {
        return camId;
    }

    public void setCamId(int camId) {
        this.camId = camId;
    }

    public String getCamMarca() {
        return camMarca;
    }

    public void setCamMarca(String camMarca) {
        this.camMarca = camMarca;
    }

    public String getCamNombre() {
        return camNombre;
    }

    public void setCamNombre(String camNombre) {
        this.camNombre = camNombre;
    }

    public String getCamInicio() {
        return camInicio;
    }

    public void setCamInicio(String camInicio) {
        this.camInicio = camInicio;
    }

    public String getCamFin() {
        return camFin;
    }

    public void setCamFin(String camFin) {
        this.camFin = camFin;
    }

    public String getCamFoto() {
        return camFoto;
    }

    public void setCamFoto(String camFoto) {
        this.camFoto = camFoto;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public File getArchivo() {
        return archivo;
    }

    public void setArchivo(File archivo) {
        this.archivo = archivo;
    }

    public String getArchivoFileName() {
        return archivoFileName;
    }

    public void setArchivoFileName(String archivoFileName) {
        this.archivoFileName = archivoFileName;
    }
    
    

    public String CampaniasFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }      
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        if(orden == null || orden.equals("null") || orden.equals("")){
            orden = "camInicio DESC";
        }
        if((fechaCampania == null) || fechaCampania.equals("null")){
            fechaCampania = "";
        }
        lista_campanias = ControladoresDAO.cCampanias.RecuperaTodos(filtro,fechaCampania,orden);
        return SUCCESS;
    }
    
    public String CampaniasForm() throws Exception {
        if(accion.equals("a")){
            camId = 0;
            camMarca = "";
            camNombre = "";
            camInicio = null;
            camFin = null;
            camFoto = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Campania c = ControladoresDAO.cCampanias.RecuperaPorId(clave);
            int year;
            int month;
            String monthString;
            int day;
            String dayString;
            year = c.getCamInicio().getYear() + 1900;
            month = c.getCamInicio().getMonth()+1;
            day = c.getCamInicio().getDate();
            if(month < 10){
                monthString = "0"+month;
            }else{
                monthString = ""+month;
            }
            if(day < 10){
                dayString = "0"+day;
            }else{
                dayString = ""+day;
            }
            camInicio = dayString+"-"+monthString+"-"+year;
            year = c.getCamFin().getYear() + 1900;
            month = c.getCamFin().getMonth()+1;
            day = c.getCamFin().getDate();
            if(month < 10){
                monthString = "0"+month;
            }else{
                monthString = ""+month;
            }
            if(day < 10){
                dayString = "0"+day;
            }else{
                dayString = ""+day;
            }
            camFin = dayString+"-"+monthString+"-"+year;            
            camId = c.getCamId();
            camMarca = c.getCamMarca();
            camNombre = c.getCamNombre();
            camFoto = c.getCamFoto();

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
    
    public String CrudActionCampanias() throws Exception {
        Ruta();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String year;
        String month;
        String day;
        year = camInicio.substring(6, 10);
        month = camInicio.substring(3, 5);
        day = camInicio.substring(0, 2);
        camInicio = year+"-"+month+"-"+day;
        year = camFin.substring(6, 10);
        month = camFin.substring(3, 5);
        day = camFin.substring(0, 2);
        camFin = year+"-"+month+"-"+day;
        try{
            Date i = sdf.parse(camInicio);
            Date f = sdf.parse(camFin);
            if (accion.equals("a")) {
                if(archivo != null){
                    File destFile  = new File(ruta, archivoFileName);
                    FileUtils.copyFile(archivo, destFile);
                }else{
                    archivoFileName = "";
                }
                Campania c = new Campania(camMarca, camNombre, i, f, archivoFileName);
                ControladoresDAO.cCampanias.Inserta(c);
            }
            if (accion.equals("m")) {
                if(archivo != null){
                    EliminaArchivo();
                    File destFile  = new File(ruta, archivoFileName);
                    FileUtils.copyFile(archivo, destFile);
                }else{
                    archivoFileName = camFoto;
                }
                Campania c = new Campania(camMarca, camNombre, i, f, archivoFileName);
                c.setCamId(camId);
                ControladoresDAO.cCampanias.Modifica(c);
            }
            if (accion.equals("e")) {
                EliminaArchivo();
                Campania c = ControladoresDAO.cCampanias.RecuperaPorId(camId);
                ControladoresDAO.cCampanias.Elimina(c);
            }        
            return SUCCESS;
        }catch(Exception e){
            System.out.println("No se pudo grabar el archivo. Error: "+e.getMessage());
            return INPUT;            
        }
    }
    
   private void Ruta(){
        ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build\\";
        ruta = ruta.replace(eliminar, "");
        ruta += "Imagenes\\Campanias\\";       
   }
   
   public void EliminaArchivo() throws Exception{
        File fichero = new File(ruta+camFoto);
        if (fichero.delete()){
            System.out.println("Archivo " + ruta + camFoto + " borrado.");
        }else{
            System.out.println("El archivo" + ruta + camFoto + " no puede ser borrado");
        }
   }
}