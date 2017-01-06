package Acciones;

import Modelos.Color;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class HomeColor extends ActionSupport {
    
         //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Color> Lista_Color;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int colorId;
    private String colorDescripcion;
    private String colorFoto;
    private String ruta;
    private File archivoColor;
    private String archivoColorFileName;
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

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getColorDescripcion() {
        return colorDescripcion;
    }

    public void setColorDescripcion(String colorDescripcion) {
        this.colorDescripcion = colorDescripcion;
    }

    public String getColorFoto() {
        return colorFoto;
    }

    public void setColorFoto(String colorFoto) {
        this.colorFoto = colorFoto;
    }

    public File getArchivoColor() {
        return archivoColor;
    }

    public void setArchivoColor(File archivoColor) {
        this.archivoColor = archivoColor;
    }

    public String getArchivoColorFileName() {
        return archivoColorFileName;
    }

    public void setArchivoColorFileName(String archivoColorFileName) {
        this.archivoColorFileName = archivoColorFileName;
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

    public List<Color> getLista_Color() {
        return Lista_Color;
    }

    public void setLista_Color(List<Color> Lista_Color) {
        this.Lista_Color = Lista_Color;
    }

    public String ColorFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Color = ControladoresDAO.cColor.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String ColorForm() throws Exception {
        if(accion.equals("a")){
            colorId = 0;
            colorDescripcion = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Color p = ControladoresDAO.cColor.RecuperaPorId(clave);           
            colorId = p.getColorId();
            colorDescripcion = p.getColorDescripcion();
            colorFoto = p.getColorFoto();
            if(accion.equals("m")){
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                cabeceraocul = "Eliminación";
                botonocul = "Eliminación";
            }
        }
        return SUCCESS;
    }
    
    public String CrudActionColor() throws Exception {
        Ruta();
        try{
            Color p;
            if (accion.equals("a")) {
                if(archivoColor != null){
                    File destFile  = new File(ruta, archivoColorFileName);
                    FileUtils.copyFile(archivoColor, destFile);
                }else{
                    archivoColorFileName = "";
                }                     
                p = new Color(colorDescripcion,archivoColorFileName);
                ControladoresDAO.cColor.Inserta(p);
            }
            if (accion.equals("m")) {
                if(archivoColor != null){
                    EliminaArchivo();
                    File destFile  = new File(ruta, archivoColorFileName);
                    FileUtils.copyFile(archivoColor, destFile);
                }else{
                    archivoColorFileName = colorFoto;
                }
                p = new Color(colorDescripcion,archivoColorFileName); 
                p.setColorId(colorId);
                ControladoresDAO.cColor.Modifica(p);
            }
            if (accion.equals("e")) {
                p = ControladoresDAO.cColor.RecuperaPorId(colorId);
                ArrayList listaInactivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("color.colorId",colorId,0);
                ArrayList listaActivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("color.colorId",colorId,1);
                int cantidad = listaActivas.size() + listaInactivas.size();
                if(cantidad > 0){
                    mensajeNoBorrar = "Hay "+listaActivas.size()+" ropa visible y "+listaInactivas.size()+" ropa no visible \r\nque utilizan este Color.";
                    return INPUT;
                }else{
                    EliminaArchivo();
                    ControladoresDAO.cColor.Elimina(p);
                }
            }        
            return SUCCESS;
        }catch(Exception e){
            System.out.println("No se pudo grabar el archivo. Error: "+e.getMessage());
            return INPUT;            
        }
    }    
    
    private void Ruta(){
        ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build"+System.getProperty("file.separator");
        ruta = ruta.replace(eliminar, "");
        ruta += "Imagenes"+System.getProperty("file.separator")+"Colores"+System.getProperty("file.separator");       
    }

    public void EliminaArchivo() throws Exception{
        File fichero = new File(ruta+colorFoto);
        Date ahora = new Date();
        if (fichero.delete()){
            System.out.println("Archivo " + ruta + colorFoto + " borrado " + ahora);
        }else{
            System.out.println("El archivo" + ruta + colorFoto + " no puede ser borrado " + ahora);
        }
    }
}