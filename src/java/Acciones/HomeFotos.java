package Acciones;

import Modelos.Fotos;
import Modelos.Ropa;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;


public class HomeFotos extends ActionSupport {
    
    private Ropa t;
    private Integer roId2;
    private File archivo1 = null;
    private String archivo1FileName;
    private File archivo2 = null;
    private String archivo2FileName;
    private File archivo3 = null;
    private String archivo3FileName;
    private String accionocul;
    private String filtro;
    private String fechaI;
    private String fechaF;
    private String eliminadas;
    private String orden;
    private String ruta;
    private String elimino1 = "";
    private String elimino2 = "";    
    private String elimino3 = "";
    private String[] aux = new String[2];
    private String borra1 = "";
    private String borra2 = "";
    private String borra3 = "";
    
    
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
    
    public File getArchivo1() {
        return archivo1;
    }

    public void setArchivo1(File archivo1) {
        this.archivo1 = archivo1;
    }

    public String getArchivo1FileName() {
        return archivo1FileName;
    }

    public void setArchivo1FileName(String archivo1FileName) {
        this.archivo1FileName = archivo1FileName;
    }

    public File getArchivo2() {
        return archivo2;
    }

    public void setArchivo2(File archivo2) {
        this.archivo2 = archivo2;
    }

    public String getArchivo2FileName() {
        return archivo2FileName;
    }

    public void setArchivo2FileName(String archivo2FileName) {
        this.archivo2FileName = archivo2FileName;
    }

    public File getArchivo3() {
        return archivo3;
    }

    public void setArchivo3(File archivo3) {
        this.archivo3 = archivo3;
    }

    public String getArchivo3FileName() {
        return archivo3FileName;
    }

    public void setArchivo3FileName(String archivo3FileName) {
        this.archivo3FileName = archivo3FileName;
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

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getElimino1() {
        return elimino1;
    }

    public void setElimino1(String elimino1) {
        this.elimino1 = elimino1;
    }

    public String getElimino2() {
        return elimino2;
    }

    public void setElimino2(String elimino2) {
        this.elimino2 = elimino2;
    }

    public String getElimino3() {
        return elimino3;
    }

    public void setElimino3(String elimino3) {
        this.elimino3 = elimino3;
    }

    public String getBorra1() {
        return borra1;
    }

    public void setBorra1(String borra1) {
        this.borra1 = borra1;
    }

    public String getBorra2() {
        return borra2;
    }

    public void setBorra2(String borra2) {
        this.borra2 = borra2;
    }

    public String getBorra3() {
        return borra3;
    }

    public void setBorra3(String borra3) {
        this.borra3 = borra3;
    }
  
    public String CargaArchivo() {
      Fotos f;
      int respuesta;
      try{
        t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        Ruta();
        System.out.println("Ruta: "+ruta);
        if(archivo1 != null){
            File destFile  = new File(ruta, archivo1FileName);
            FileUtils.copyFile(archivo1, destFile);
            f = new Fotos(t,archivo1FileName);
            respuesta = ControladoresDAO.cFotos.Inserta(f);
            if(accionocul.equals("m") && borra1.equals("")){
                if(!elimino2.equals("")){
                    aux[0] = elimino2;
                    elimino2 = "";
                }
                if(!elimino3.equals("")){
                    aux[1] = elimino3;
                    elimino3 = "";
                }
                EliminaArchivo();
            }
        }
        if(archivo2 != null){
            File destFile  = new File(ruta, archivo2FileName);
            FileUtils.copyFile(archivo2, destFile);
            f = new Fotos(t,archivo2FileName);
            respuesta = ControladoresDAO.cFotos.Inserta(f);
            if(accionocul.equals("m") && borra2.equals("")){
                if(elimino2.equals("")){
                    elimino2 = aux[0];
                }
                elimino1 = "";
                if(!elimino3.equals("")){
                    aux[1] = elimino3;
                    elimino3 = "";
                }
                EliminaArchivo();
            }
        }
        if(archivo3 != null){
            File destFile  = new File(ruta, archivo3FileName);
            FileUtils.copyFile(archivo3, destFile);
            f = new Fotos(t,archivo3FileName);
            respuesta = ControladoresDAO.cFotos.Inserta(f);
            if(accionocul.equals("m") && borra3.equals("")){
                elimino2="";
                elimino1 = "";
                if(elimino3.equals("")){
                    elimino3 = aux[1];
                }
                EliminaArchivo();
            }
        }
      }catch(Exception e){
            System.out.println("Error al copiar archivos: " + e.getMessage());
      }
      return SUCCESS;
  } 
    
   public String FotosForm() throws Exception{
        t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        //Ruta();
       return SUCCESS;
   }
   
   public String EliminaArchivo() throws Exception{
        t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        int resultado;
        Ruta();
        if(!elimino1.equals("")){
            File fichero = new File(ruta + elimino1);
            if (fichero.delete()){
                System.out.println("Archivo " + ruta + elimino1 + " borrado.");
            }else{
                System.out.println("El archivo" + ruta + elimino1 + " no puede ser borrado");
            }
            resultado = ControladoresDAO.cFotos.Elimina(ControladoresDAO.cFotos.RecuperaFotoABorrar(roId2, elimino1));
        }
        if(!elimino2.equals("")){
            File fichero = new File(ruta + elimino2);
            if (fichero.delete()){
                System.out.println("Archivo " + ruta + elimino2 + " borrado.");
            }else{
                System.out.println("El archivo" + ruta + elimino2 + " no puede ser borrado");
            }
            resultado = ControladoresDAO.cFotos.Elimina(ControladoresDAO.cFotos.RecuperaFotoABorrar(roId2, elimino2));
        }
        if(!elimino3.equals("")){
            File fichero = new File(ruta + elimino3);
            if (fichero.delete()){
                System.out.println("Archivo " + ruta + elimino3 + " borrado.");
            }else{
                System.out.println("El archivo" + ruta + elimino3 + " no puede ser borrado");
            }
            resultado = ControladoresDAO.cFotos.Elimina(ControladoresDAO.cFotos.RecuperaFotoABorrar(roId2, elimino3));
        }
       //System.out.println("elimino1: "+ruta+elimino1);
       //System.out.println("elimino2: "+ruta+elimino2);
       //System.out.println("elimino3: "+ruta+elimino3);
       
       return SUCCESS;
   }
   
   private void Ruta(){
        ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build"+System.getProperty("file.separator");
        ruta = ruta.replace(eliminar, "");
        ruta += "Imagenes"+System.getProperty("file.separator")+t.getCategoria().getCatDescripcion()+System.getProperty("file.separator")+t.getSubcategoria().getSubDescripcion()+System.getProperty("file.separator");       
   }
}
