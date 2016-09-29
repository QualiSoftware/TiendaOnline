package Acciones;

import ControladoresDAO.cUsuarios;
import Modelos.Usuarios;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class UsuariosController extends ActionSupport {
    //sesion
    private Map sesion;
    
    //Formularios
    private String usuario;
    private String pass;
    private String mensajeError;

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public String getUsuario() {
        return usuario;
    }
    @RequiredStringValidator(message="Obligatorio")
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }
    @RequiredStringValidator(message="Obligatorio")
    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }

    
    
    public String Login() throws Exception {
       List<Usuarios> l=cUsuarios.Login(usuario, pass);
       
       if (l.size()==0) {
           mensajeError="Acceso no permitido";
           return ERROR;
       } else {
           if (sesion==null) {
               sesion=ActionContext.getContext().getSession();
           }
           sesion.put("usuariologueado", (Usuarios) l.get(0));
           return SUCCESS; 
       }
    }
    @SkipValidation
    public String cerrar_sesion() throws Exception {
    if (sesion!=null) {
           sesion.clear();
       }

    return SUCCESS;
    }
}