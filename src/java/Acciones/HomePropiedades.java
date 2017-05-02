package Acciones;

import Modelos.Propiedades;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;

/*  Document   : HomePropiedades.java
*   Created on : 01-may-2017
*   Author     : QualiSoftware
*/
public class HomePropiedades {
    
    public static String muestraValor(String key){
        return ControladoresDAO.cPropiedades.recuperaValorPorLlave(key);
    }
    
    public static String CrudActionMarcas(String key, String value) throws Exception {
        
        Propiedades p = ControladoresDAO.cPropiedades.recuperaPorLlave(key);
        p.setProValue(value);
        int respuesta = ControladoresDAO.cPropiedades.Modifica(p);
        if(respuesta == 1){
            return SUCCESS;
        } else {
            return INPUT;
        }
        
    }
}
