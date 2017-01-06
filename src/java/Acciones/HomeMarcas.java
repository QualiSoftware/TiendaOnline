package Acciones;

import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.Usuarios;
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

/*  Document   : HomeMarcas.java
*   Created on : 20-nov-2016
*   Author     : QualiSoftware
*/
public class HomeMarcas extends ActionSupport {
    
    
          //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private List<Marcas> Lista_Marcas;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int marcaId;
    private String marcaNombre;
    private String marcaFoto;
    private String ruta;
    private File archivoMarca;
    private String archivoMarcaFileName;
    private List<Ropa> lista_ropa;
    private String usi;
    private Usuarios u;
    private String mensajeNoBorrar;
    
    //getters and setters

    public String getUsi() {
        return usi;
    }

    public void setUsi(String usi) {
        this.usi = usi;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public String getMensajeNoBorrar() {
        return mensajeNoBorrar;
    }

    public void setMensajeNoBorrar(String mensajeNoBorrar) {
        this.mensajeNoBorrar = mensajeNoBorrar;
    }

    public List<Ropa> getLista_ropa() {
        return lista_ropa;
    }

    public void setLista_ropa(List<Ropa> lista_ropa) {
        this.lista_ropa = lista_ropa;
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

    public String getMarcaFoto() {
        return marcaFoto;
    }

    public void setMarcaFoto(String marcaFoto) {
        this.marcaFoto = marcaFoto;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public File getArchivoMarca() {
        return archivoMarca;
    }

    public void setArchivoMarca(File archivoMarca) {
        this.archivoMarca = archivoMarca;
    }

    public String getArchivoMarcaFileName() {
        return archivoMarcaFileName;
    }

    public void setArchivoMarcaFileName(String archivoMarcaFileName) {
        this.archivoMarcaFileName = archivoMarcaFileName;
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
    public String marcasmuestra() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        usi = "";
        // para cuando tengamos sesión de usuario
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    int aux;
                    u = (Usuarios) sesion.get("usuarioLogueado");
                    aux = u.getUsuId();
                    u = ControladoresDAO.cUsuarios.RecuperaPorId(aux);
                    sesion.clear();
                    sesion.put("usuarioLogueado", (Usuarios) u);
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            }
        }
        Marcas marselec = ControladoresDAO.cMarcas.RecuperaPorId(clave);
        lista_ropa = ControladoresDAO.cRopa.RecuperaPorCampaña(""+marselec.getMarcaId());
        return SUCCESS;
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
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
        try{
            Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
            if(u.getUsuAdministrador()!=1){
                return INPUT;
            }
        }catch(Exception e){
            return INPUT;
        }
         */
        if(accion.equals("a")){
            marcaId = 0;
            marcaNombre = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Marcas p = ControladoresDAO.cMarcas.RecuperaPorId(clave);           
            marcaId = p.getMarcaId();
            marcaNombre = p.getMarcaNombre();
            marcaFoto = p.getMarcaFoto();

            if(accion.equals("m")){
                cabeceraocul = "Modificar";
                botonocul = "Modificar";  
            }else{
                cabeceraocul = "Eliminar";
                botonocul = "Eliminar";
            }
        }
        return SUCCESS;
    }
    
    public String CrudActionMarcas() throws Exception {
        Ruta();
        try{
            Marcas p;
            if (accion.equals("a")) {
                if(archivoMarca != null){
                    File destFile  = new File(ruta, archivoMarcaFileName);
                    FileUtils.copyFile(archivoMarca, destFile);
                }else{
                    archivoMarcaFileName = "";
                }            
                p = new Marcas(marcaNombre,archivoMarcaFileName);
                ControladoresDAO.cMarcas.Inserta(p);
            }
            if (accion.equals("m")) {
                if(archivoMarca != null){
                    EliminaArchivo();
                    File destFile  = new File(ruta, archivoMarcaFileName);
                    FileUtils.copyFile(archivoMarca, destFile);
                }else{
                    archivoMarcaFileName = marcaFoto;
                }
                p = new Marcas(marcaNombre,archivoMarcaFileName); 
                p.setMarcaId(marcaId);
                ControladoresDAO.cMarcas.Modifica(p);
            }
            if (accion.equals("e")) {
                p = ControladoresDAO.cMarcas.RecuperaPorId(marcaId);
                ArrayList listaInactivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("marcas.marcaId",marcaId,0);
                ArrayList listaActivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("marcas.marcaId",marcaId,1);
                int cantidad = listaActivas.size() + listaInactivas.size();
                if(cantidad > 0){
                    mensajeNoBorrar = "Hay "+listaActivas.size()+" ropa visible y "+listaInactivas.size()+" ropa no visible \r\nque utilizan esta Marca.";
                    return INPUT;
                }else{
                    EliminaArchivo();
                    ControladoresDAO.cMarcas.Elimina(p);
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
        ruta += "Imagenes"+System.getProperty("file.separator")+"Marcas"+System.getProperty("file.separator");       
   }
   
   public void EliminaArchivo() throws Exception{
        File fichero = new File(ruta+marcaFoto);
        Date ahora = new Date();
        if (fichero.delete()){
            System.out.println("Archivo " + ruta + marcaFoto + " borrado " + ahora);
        }else{
            System.out.println("El archivo" + ruta + marcaFoto + " no puede ser borrado " + ahora);
        }
   }
}