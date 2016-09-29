package Acciones;

import ControladoresDAO.cProductos;
import Modelos.Productos;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;


public class ProductosController extends ActionSupport {
    private List<Productos> lista_productos;
     private  List<Productos> Lista_Productos_oferta;

    public List<Productos> getLista_productos() {
        return lista_productos;
    }

    public void setLista_productos(List<Productos> lista_productos) {
        this.lista_productos = lista_productos;
    }
      

    public List<Productos> getLista_Productos_oferta() {
        return Lista_Productos_oferta;
    }

    public void setLista_Productos_oferta(List<Productos> Lista_Productos_oferta) {
        this.Lista_Productos_oferta = Lista_Productos_oferta;
    }

    
    public String prod_rel() throws Exception {
        Lista_Productos_oferta = ControladoresDAO.cProductos.CargaProOferta();
        lista_productos = cProductos.Recupera_todos();
        
        return SUCCESS;
        
    }
    
}
