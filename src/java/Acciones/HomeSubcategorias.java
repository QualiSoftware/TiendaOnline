package Acciones;

import Modelos.Categoria;
import Modelos.Ropa;
import Modelos.Subcategoria;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class HomeSubcategorias extends ActionSupport {

    //variables fijas para todos los controladores
    private String filtro;
    private int clave;
    private String accion;
    private String titulo;
    private String boton;
    private Map sesion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;

    //variables específicas a cada controlador
    private List<Subcategoria> lista_subcategorias;
    private Integer subId;
    private String subDescripcion;
    private Subcategoria p;
    private List<Categoria> lista_categoria;
    private String catId2;

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
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

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getBoton() {
        return boton;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public List<Subcategoria> getLista_subcategorias() {
        return lista_subcategorias;
    }

    public void setLista_subcategorias(List<Subcategoria> lista_subcategorias) {
        this.lista_subcategorias = lista_subcategorias;
    }

    public Subcategoria getP() {
        return p;
    }

    public void setP(Subcategoria p) {
        this.p = p;
    }

    public Integer getSubId() {
        return subId;
    }

    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public String getSubDescripcion() {
        return subDescripcion;
    }

    public void setSubDescripcion(String subDescripcion) {
        this.subDescripcion = subDescripcion;
    }

    public List<Categoria> getLista_categoria() {
        return lista_categoria;
    }

    public void setLista_categoria(List<Categoria> lista_categoria) {
        this.lista_categoria = lista_categoria;
    }

    public String getCatId2() {
        return catId2;
    }

    public void setCatId2(String catId2) {
        this.catId2 = catId2;
    }

    @SkipValidation
    public String SubcategoriasFiltro() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
        try{
            Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
        }catch(Exception e){
            return INPUT;
        }
         */
        if (filtro == null) {
            filtro = "";
        }
        lista_subcategorias = ControladoresDAO.cSubcategorias.RecuperaTodos(filtro);
        return SUCCESS;
    }

    @SkipValidation
    public String SubcategoriasForm() throws Exception {
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

        lista_categoria = ControladoresDAO.cCategorias.RecuperaTodos("");
        if (accion.equals("a")) {
            subId = 0;
            subDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        } else {
            p = ControladoresDAO.cSubcategorias.RecuperaPorId(clave);
            subId = p.getSubId();
            subDescripcion = p.getSubDescripcion();

            if (accion.equals("m")) {
                accionocul = "m";
                cabeceraocul = "Modificación";
                botonocul = "Modificar";
            } else {
                accionocul = "e";
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
        }
        return SUCCESS;
    }

    public String CrudActionSubcategorias() throws Exception {
        boolean modificoCategoria = false;
        int categoriaReemplazada = 0;
        p = ControladoresDAO.cSubcategorias.RecuperaPorId(clave);
        if (clave != Integer.parseInt(catId2)) {
            modificoCategoria = true;
            categoriaReemplazada = clave;
        }
        Categoria c = ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(catId2));
        if (accionocul.equals("a")) {
            p = new Subcategoria(c, subDescripcion);
            ControladoresDAO.cSubcategorias.Inserta(p);
        }
        if (accionocul.equals("m")) {
            p = new Subcategoria(c, subDescripcion);
            p.setSubId(subId);
            ControladoresDAO.cSubcategorias.Modifica(p);
            /*Ahora hago la modificación del campo ro_cat_id dentro de los objetos Ropa*/
            if (modificoCategoria) {
                ArrayList<Ropa> lista_ropa = ControladoresDAO.cRopa.RecuperaTodoPorSubcategoria(subId);
                for (Ropa l : lista_ropa) {
                    l.setCategoria(c);
                    ControladoresDAO.cRopa.Modifica(l);
                }
            }
        }
        if (accionocul.equals("e")) {
            p = new Subcategoria(c, subDescripcion);
            p.setSubId(subId);
            ControladoresDAO.cSubcategorias.Elimina(p);
        }
        return SUCCESS;
    }
}