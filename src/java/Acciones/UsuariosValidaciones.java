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
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Formación
 */
public class UsuariosValidaciones extends ActionSupport{

    private String filtro;
    private ArrayList<Usuarios> lista_usuarios;
    private String usuario;
    private String password;
    private String mensajeError;
    private Map sesion;

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
    
    public String LoginPrueba() throws Exception {
        List<Usuarios> l = ControladoresDAO.cUsuarios.Login(usuario,password);
        if(l.size()==0){
            mensajeError="Acceso no permitido";
            return ERROR;
        }else{
            if(sesion==null){
                sesion=ActionContext.getContext().getSession();
            }
            sesion.put("usuarioLogueado", (Usuarios) l.get(0));
            return SUCCESS;
        }
    }
    
    @SkipValidation
    public String AbroSesion() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        return SUCCESS;
    }
    
    @SkipValidation
    public String CerrarSesion() throws Exception {
        if(sesion==null){
                sesion=ActionContext.getContext().getSession();
            }
            sesion.put("usuarioLogueado", "");
            return SUCCESS;
    }
}
