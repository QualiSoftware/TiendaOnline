
package Acciones;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.Cookie;

/*  
*   Author     : QualiSoftware
*/
public class HomeCookies extends ActionSupport {
    
    public static String insertarCookie() throws Exception {
        
        Cookie galleta = new Cookie("nombre","valor");
        galleta.setMaxAge(365*24*60*60);
        return SUCCESS;
    }
    
}
