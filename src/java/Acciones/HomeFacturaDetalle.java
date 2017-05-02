package Acciones;

import Modelos.FacturaDetalle;
import Modelos.Facturas;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

/*  
*   Author     : QualiSoftware
*/
public class HomeFacturaDetalle extends ActionSupport {
    
    private Map sesion;
    private List<FacturaDetalle> lista_facturaDetalle;
    private Integer facdId;
    private Facturas facturas;
    private Double total;

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public List<FacturaDetalle> getLista_facturaDetalle() {
        return lista_facturaDetalle;
    }

    public void setLista_facturaDetalle(List<FacturaDetalle> lista_facturaDetalle) {
        this.lista_facturaDetalle = lista_facturaDetalle;
    }

    public Integer getFacdId() {
        return facdId;
    }

    public void setFacdId(Integer facdId) {
        this.facdId = facdId;
    }

    public Facturas getFacturas() {
        return facturas;
    }

    public void setFacturas(Facturas facturas) {
        this.facturas = facturas;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
    @SkipValidation
    public String FacturaDetalleFiltro() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        facturas = ControladoresDAO.cFacturas.RecuperaPorId(facdId);
        total = 0.0;
        lista_facturaDetalle = ControladoresDAO.cFacturaDetalle.RecuperaTodos(""+facdId);
        for(FacturaDetalle fd:lista_facturaDetalle){
            total += (fd.getFacdPrecio() - (fd.getFacdPrecio() * fd.getFacdDescuento() / 100)) * fd.getFacdCantidad();
        }
        
        return SUCCESS;
    }
}
