/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Usuarios;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Formación
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
            System.out.println("Hubo un intento de conexión fallido el " + d + " con user: " + usuario + " pass: " + password);
            return ERROR;
        }else{
            Usuarios usuario = (Usuarios) l.get(0);
            if(usuario.isUsuActivo()){
                if(sesion==null){
                    sesion=ActionContext.getContext().getSession();
                }
                sesion.put("usuarioLogueado", (Usuarios) l.get(0));
                return SUCCESS;
            }else{
                mensajeError="Usuario inactivo";
                Date d = new Date();
                System.out.println("El usuario inactivo " + usuario.getUsuEmail() + " intentó loguearse el " + d );
                return ERROR;
            }
        }
    }
    
    @SkipValidation
    public String CerrarSesion() throws Exception {
        if(sesion==null){
                sesion=ActionContext.getContext().getSession();
            }
            sesion.put("usuarioLogueado", "");
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
