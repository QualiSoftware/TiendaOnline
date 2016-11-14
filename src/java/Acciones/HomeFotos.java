package Acciones;

import Modelos.Fotos;
import Modelos.Ropa;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;


public class HomeFotos extends ActionSupport {
    
    private Ropa t;
    private Integer roId2;
    private List<File> archivo = new LinkedList<File>();
    private List<String> archivoContentType = new LinkedList<String>();
    private List<String> archivoFileName = new LinkedList<String>();
    private String accionocul;
    private String filtro;
    private String fechaI;
    private String fechaF;
    private String eliminadas;
    private String orden;
    
    public Ropa getT() {
        return t;
    }

    public void setT(Ropa t) {
        this.t = t;
    }

    public Integer getRoId2() {
        return roId2;
    }

    public void setRoId2(Integer roId2) {
        this.roId2 = roId2;
    }

    public List<File> getArchivo() {
        return archivo;
    }

    public void setArchivo(List<File> archivo) {
        this.archivo = archivo;
    }

    public List<String> getArchivoContentType() {
        return archivoContentType;
    }

    public void setArchivoContentType(List<String> archivoContentType) {
        this.archivoContentType = archivoContentType;
    }

    public List<String> getArchivoFileName() {
        return archivoFileName;
    }

    public void setArchivoFileName(List<String> archivoFileName) {
        this.archivoFileName = archivoFileName;
    }

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public String getFechaI() {
        return fechaI;
    }

    public void setFechaI(String fechaI) {
        this.fechaI = fechaI;
    }

    public String getFechaF() {
        return fechaF;
    }

    public void setFechaF(String fechaF) {
        this.fechaF = fechaF;
    }

    public String getEliminadas() {
        return eliminadas;
    }

    public void setEliminadas(String eliminadas) {
        this.eliminadas = eliminadas;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    
    public String CargaArchivo() {
      Fotos f;
      int respuesta;
      try{
        t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        String rutaParaGuardarFoto = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build\\";
        rutaParaGuardarFoto = rutaParaGuardarFoto.replace(eliminar, "");
        rutaParaGuardarFoto += "Imagenes\\"+t.getCategoria().getCatDescripcion()+"\\"+t.getSubcategoria().getSubDescripcion()+"\\";
        //System.out.println("Ruta: "+rutaParaGuardarFoto);
        if(archivo.get(0) != null){
            File destFile  = new File(rutaParaGuardarFoto, archivoFileName.get(0));
            FileUtils.copyFile(archivo.get(0), destFile);
            f = new Fotos(t,archivoFileName.get(0));
            respuesta = ControladoresDAO.cFotos.Inserta(f);
        }
        if(archivo.get(1) != null){
            File destFile  = new File(rutaParaGuardarFoto, archivoFileName.get(1));
            FileUtils.copyFile(archivo.get(1), destFile);
            f = new Fotos(t,archivoFileName.get(1));
            respuesta = ControladoresDAO.cFotos.Inserta(f);
        }
        if(archivo.get(2) != null){
            File destFile  = new File(rutaParaGuardarFoto, archivoFileName.get(2));
            FileUtils.copyFile(archivo.get(2), destFile);
            f = new Fotos(t,archivoFileName.get(2));
            respuesta = ControladoresDAO.cFotos.Inserta(f);
        }
      }catch(Exception e){
            System.out.println("Error al copiar archivos: " + e.getMessage());
      }
      return SUCCESS;
  } 
    
   public String FotosForm() throws Exception{
       return SUCCESS;
   }
}