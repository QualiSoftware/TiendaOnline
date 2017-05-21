package Acciones;

import Modelos.Favoritos;
import Modelos.FavoritosId;
import Modelos.NoLogFavoritos;
import Modelos.NoLogUsuarios;
import Modelos.Usuarios;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;

/*  
*   Author     : QualiSoftware
*/
public class HomeUsuariosValidaciones extends ActionSupport{

    private String filtro;
    private ArrayList<Usuarios> lista_usuarios;
    private String usuario;
    private String password;
    private String mensajeError;
    private Map sesion;
    private int respuesta;
    private String usuEmail2 = "";
    private String usuPassword2 = "";
    private String actionName;
    private String cliCodigo;
    private String catCodigo;
    private String marca;
    private String campania;
    private int roId;
    private String ruta;
    private String userCookieSL;

    public int getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(int respuesta) {
        this.respuesta = respuesta;
    }

    public String getUsuEmail2() {
        return usuEmail2;
    }

    public void setUsuEmail2(String usuEmail2) {
        this.usuEmail2 = usuEmail2;
    }

    public String getUsuPassword2() {
        return usuPassword2;
    }

    public void setUsuPassword2(String usuPassword2) {
        this.usuPassword2 = usuPassword2;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String getCliCodigo() {
        return cliCodigo;
    }

    public void setCliCodigo(String cliCodigo) {
        this.cliCodigo = cliCodigo;
    }

    public String getCatCodigo() {
        return catCodigo;
    }

    public void setCatCodigo(String catCodigo) {
        this.catCodigo = catCodigo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCampania() {
        return campania;
    }

    public void setCampania(String campania) {
        this.campania = campania;
    }

    public int getRoId() {
        return roId;
    }

    public void setRoId(int roId) {
        this.roId = roId;
    }

    public String getUserCookieSL() {
        return userCookieSL;
    }

    public void setUserCookieSL(String userCookieSL) {
        this.userCookieSL = userCookieSL;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public String getUsuario() {
        return usuario;
    }

    @RequiredStringValidator(message = "Usuario incompleto o erróneo")
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    @RequiredStringValidator(message = "Password incompleto o erróneo")
    public void setPassword(String password) {
        this.password = password;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }
    
    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public ArrayList<Usuarios> getLista_usuarios() {
        return lista_usuarios;
    }

    public void setLista_usuarios(ArrayList<Usuarios> lista_usuarios) {
        this.lista_usuarios = lista_usuarios;
    }
    
    public String Login() throws Exception {
        List<Usuarios> l = ControladoresDAO.cUsuarios.Login(usuario,encriptar(password));
        if(l.size()==0){
            mensajeError="Usuario y/o contraseña erróneos";
            Date d = new Date();
            escribirEnArchivoLog("Hubo un intento de conexión fallido el " + d + " con user: " + usuario + " pass: " + password);
            return ERROR;
        }else{
            Usuarios usuario = (Usuarios) l.get(0);
            if(usuario.isUsuActivo()){
                if(sesion==null){
                    sesion=ActionContext.getContext().getSession();
                }
                sesion.put("usuarioLogueado", l.get(0).getUsuEmail());
                sesion.put("usuId", l.get(0).getUsuId());
                sesion.put("usuNombre", l.get(0).getUsuNombre());
                sesion.put("usuAdministrador", l.get(0).getUsuAdministrador());
                if(sesion.get("cookieLogueado") != null && usuario.getUsuAdministrador() != 1){
                    NoLogUsuarios nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
                    //Traslado Favoritos desde acá
                    List<NoLogFavoritos> lista_nlu = ControladoresDAO.cFavoritosNoLog.recuperaPorUsuario(nlu);
                    List<Favoritos> lista_u = ControladoresDAO.cFavoritos.recuperaPorUsuario(usuario);
                    for(NoLogFavoritos favoritosNLU:lista_nlu){
                        boolean noEstaba = true;
                        for(Favoritos favoritosU:lista_u){
                            if(favoritosNLU.getRopa().getRoId() == favoritosU.getRopa().getRoId()){
                                noEstaba = false;
                            }
                        }
                        if(noEstaba){
                            FavoritosId favId = new FavoritosId(favoritosNLU.getRopa().getRoId(), usuario.getUsuId());
                            Favoritos fav = new Favoritos(favId, favoritosNLU.getRopa(), usuario);
                            ControladoresDAO.cFavoritos.Inserta(fav);
                        }
                        ControladoresDAO.cFavoritosNoLog.Elimina(favoritosNLU);
                    }
                    //Traslado Favoritos hasta acá
                }
                return SUCCESS;
            }else{
                mensajeError="Usuario inactivo";
                Date d = new Date();
                escribirEnArchivoLog("El usuario inactivo " + usuario.getUsuEmail() + " intentó loguearse el " + d );
                return ERROR;
            }
        }
    }
    
    public void escribirEnArchivoLog (String mensaje) {
        Ruta();
        File archivo = null;
        FileWriter fr = null;
        try{
            archivo  = new File(ruta, "log.txt");
            fr = new FileWriter(archivo, true);
            fr.write(mensaje);
            fr.write("\r\n");
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if (null != fr)
                   fr.close();
                } catch (Exception e2) {
                   e2.printStackTrace();
                }
        }
    }
    
   private void Ruta(){
        ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build"+System.getProperty("file.separator");
        ruta = ruta.replace(eliminar, "");
        ruta += "Archivos"+System.getProperty("file.separator");       
   }
    
    @SkipValidation
    public String CerrarSesion() throws Exception {
        if(sesion==null){
                sesion=ActionContext.getContext().getSession();
            }
            sesion.put("usuarioLogueado", "");
            sesion.put("usuId", "");
            sesion.put("usuNombre", "");
            sesion.put("usuAdministrador", "");
            return SUCCESS;
    }
    
    public String encriptar(String pass){
        
        char[] array = pass.toCharArray();
        char[] array2 = new char[array.length];
        for(int i=0; i<array.length; i++){
            array[i] = (char) (array[i] + (char) 3);
            array2[i] = (char) (array[i] + (char) 7);
        }
        char[] arrayFinal = new char[array.length * 3];
        for(int j=0; j<array.length; j++){
            arrayFinal[3*j] = array[j];
            arrayFinal[(3*j)+1] = array2[j];
            arrayFinal[(3*j)+2] = (char) (array[j] + (char) 9);
        }
        //System.out.println("pass: "+pass);
        //System.out.println("arrayFinal: "+String.valueOf(arrayFinal));
        String salida = org.apache.commons.lang3.StringEscapeUtils.unescapeJava(String.valueOf(arrayFinal));
        return salida;
    }
}
