package Acciones;

import Modelos.Campania;
import Modelos.CampaniaRopa;
import Modelos.Cesta;
import Modelos.Favoritos;
import Modelos.FavoritosId;
import Modelos.Fotos;
import Modelos.Marcas;
import Modelos.NoLogFavoritos;
import Modelos.NoLogFavoritosId;
import Modelos.NoLogUsuarios;
import Modelos.Ropa;
import Modelos.Usuarios;
import com.itextpdf.text.log.SysoLogger;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

/*  
*   Author     : QualiSoftware
*/
public class HomeFavoritos extends ActionSupport {
    
    private Map sesion;
    private String usi;
    private Usuarios u;
    private NoLogUsuarios nlu;
    private String filtro;
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Campania> lista_campanias;
    private List<Marcas>lista_marcas;
    private List<Campania> lista_campaniasTienda;
    private List<Marcas> lista_marcasTienda;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private String roId;
    private List<Favoritos> lista_favoritos;
    private List<NoLogFavoritos> lista_favoritosNoLog;
    private String userCookieSL, userCookieSLlista;
    //necesarios para cargar tiendaMenu.jsp
    private String cliCodigo;
    private String catCodigo;
    private String marcaFavoritos;
    private String marca;
    private String campania;
    private int ropa;
    private String userCookie;
    

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

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

    public NoLogUsuarios getNlu() {
        return nlu;
    }

    public void setNlu(NoLogUsuarios nlu) {
        this.nlu = nlu;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public ArrayList<Ropa> getLista_ropa() {
        return lista_ropa;
    }

    public void setLista_ropa(ArrayList<Ropa> lista_ropa) {
        this.lista_ropa = lista_ropa;
    }

    public ArrayList<Ropa> getLista_menu_ropa() {
        return lista_menu_ropa;
    }

    public void setLista_menu_ropa(ArrayList<Ropa> lista_menu_ropa) {
        this.lista_menu_ropa = lista_menu_ropa;
    }

    public List<Campania> getLista_campanias() {
        return lista_campanias;
    }

    public void setLista_campanias(List<Campania> lista_campanias) {
        this.lista_campanias = lista_campanias;
    }

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
    }

    public List<Campania> getLista_campaniasTienda() {
        return lista_campaniasTienda;
    }

    public void setLista_campaniasTienda(List<Campania> lista_campaniasTienda) {
        this.lista_campaniasTienda = lista_campaniasTienda;
    }

    public List<Marcas> getLista_marcasTienda() {
        return lista_marcasTienda;
    }

    public void setLista_marcasTienda(List<Marcas> lista_marcasTienda) {
        this.lista_marcasTienda = lista_marcasTienda;
    }

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
    }

    public int getTotalcestaUsuario() {
        return totalcestaUsuario;
    }

    public void setTotalcestaUsuario(int totalcestaUsuario) {
        this.totalcestaUsuario = totalcestaUsuario;
    }

    public String getRoId() {
        return roId;
    }

    public void setRoId(String roId) {
        this.roId = roId;
    }

    public List<Favoritos> getLista_favoritos() {
        return lista_favoritos;
    }

    public void setLista_favoritos(List<Favoritos> lista_favoritos) {
        this.lista_favoritos = lista_favoritos;
    }

    public List<NoLogFavoritos> getLista_favoritosNoLog() {
        return lista_favoritosNoLog;
    }

    public void setLista_favoritosNoLog(List<NoLogFavoritos> lista_favoritosNoLog) {
        this.lista_favoritosNoLog = lista_favoritosNoLog;
    }

    public String getUserCookieSL() {
        return userCookieSL;
    }

    public void setUserCookieSL(String userCookieSL) {
        this.userCookieSL = userCookieSL;
    }

    public String getUserCookieSLlista() {
        return userCookieSLlista;
    }

    public void setUserCookieSLlista(String userCookieSLlista) {
        this.userCookieSLlista = userCookieSLlista;
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

    public String getMarcaFavoritos() {
        return marcaFavoritos;
    }

    public void setMarcaFavoritos(String marcaFavoritos) {
        this.marcaFavoritos = marcaFavoritos;
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

    public int getRopa() {
        return ropa;
    }

    public void setRopa(int ropa) {
        this.ropa = ropa;
    }

    public String getUserCookie() {
        return userCookie;
    }

    public void setUserCookie(String userCookie) {
        this.userCookie = userCookie;
    }
    
    public String listaDeseos() throws Exception{
        cargarDatos();
        if(!usi.equals("")){
            lista_favoritos = ControladoresDAO.cFavoritos.recuperaPorUsuario(u);
        } else {
            cargarUsuarioNoLogueado(sesion,"");
            lista_favoritosNoLog = ControladoresDAO.cFavoritosNoLog.recuperaPorUsuario(nlu);
        }
        return SUCCESS;
    }
    
    public String insertarFavoritos() throws Exception {        
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        usi = "";
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al cargar un usuario el "+new Date());
                }
            }
        }
        cargarUsuarioNoLogueado(sesion,"");
        boolean noLoTenia = true;
        if(ropa != 0){
            roId = ropa + "";
        }
        if(!usi.equals("")){
            lista_favoritos = ControladoresDAO.cFavoritos.recuperaPorUsuario(u);
            for(Favoritos favoritosList:lista_favoritos){
                if(favoritosList.getRopa().getRoId() == Integer.parseInt(roId)){
                    noLoTenia = false;
                }
            }
            if(noLoTenia){
                Ropa ropa = ControladoresDAO.cRopa.RecuperaPorId(Integer.parseInt(roId));
                FavoritosId favoritosId = new FavoritosId(ropa.getRoId(), u.getUsuId());
                Favoritos favoritos = new Favoritos(favoritosId,ropa, u);
                ControladoresDAO.cFavoritos.Inserta(favoritos);
            }
        } else {            
            List<NoLogFavoritos> lista_nlu = ControladoresDAO.cFavoritosNoLog.recuperaPorUsuario(nlu);
            for(NoLogFavoritos favoritosList:lista_nlu){
                if(favoritosList.getRopa().getRoId() == Integer.parseInt(roId)){
                    noLoTenia = false;
                }
            }
            if(noLoTenia){
                Ropa ropa = ControladoresDAO.cRopa.RecuperaPorId(Integer.parseInt(roId));
                NoLogFavoritosId favoritosId = new NoLogFavoritosId(ropa.getRoId(), nlu.getNluUsuId());
                NoLogFavoritos favoritos = new NoLogFavoritos(favoritosId,nlu,ropa);
                ControladoresDAO.cFavoritosNoLog.Inserta(favoritos);
            }
        }
        if(marcaFavoritos != null){
            marca = marcaFavoritos;
        }
        return SUCCESS;
    }
    
    public void cargarDatos() throws Exception {        
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        usi = "";
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al cargar un usuario el "+new Date());
                }
            }
        }
        
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos("","categoria.catDescripcion","","","2");
        lista_campanias = ControladoresDAO.cCampanias.RecuperaCampaniasActivas("");
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_campaniasTienda = ControladoresDAO.cCampanias.RecuperaCampaniasActivas(filtro);
        lista_marcasTienda =  ControladoresDAO.cMarcas.RecuperaTodos(filtro);
        lista_menu_ropa = new ArrayList<Ropa>();
        for(Ropa lr: lista_ropa){
            String auxClientela = lr.getClientela().getClientelaDescripcion();
            String auxCategoria = lr.getCategoria().getCatDescripcion();
            boolean noEsta = true;
            for(Ropa lrm: lista_menu_ropa){
                if(auxClientela.equals(lrm.getClientela().getClientelaDescripcion()) && auxCategoria.equals(lrm.getCategoria().getCatDescripcion())){
                    noEsta = false;
                }
            }
            if(noEsta){
                lista_menu_ropa.add(lr);
            }
        }
        lista_ropa.clear();     
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(usi);
        for(Cesta caux:lista_ropa_Cestas){
            totalcestaUsuario += caux.getCestaUnidades();
            HomeRopa hr = new HomeRopa();
            caux.getRopaStock().setRopa(hr.descuentoEnRopa(caux.getRopaStock().getRopa()));
            for(Fotos fotos:caux.getRopaStock().getRopa().getFotoses()){
                fotos.getFotosRuta();
            }
        }
    }

    public void cargarUsuarioNoLogueado(Map sesion, String userCSL) {
        if(!userCSL.equals("")){
            userCookieSL = userCSL;
        }
        if(sesion.get("cookieLogueado") == null){
            List<NoLogUsuarios> nluList = ControladoresDAO.cUsuariosNoLog.recuperaPorNick(userCookieSL);
            if(nluList.size() > 0){
                nlu = nluList.get(0);
                sesion.put("cookieLogueado", (NoLogUsuarios) nlu);
                sesion.put("usuarioLogueado", "");
                sesion.put("usuId", "");
                sesion.put("usuNombre", "");
                sesion.put("usuAdministrador", "");
            } else {
                nlu = new NoLogUsuarios(userCookieSL, new Date());
                int resp = ControladoresDAO.cUsuariosNoLog.Inserta(nlu);
                if(resp == 1){
                    sesion.put("cookieLogueado", (NoLogUsuarios) nlu);
                } else {
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar guardar una cookie el "+new Date());
                }
            }
        } else {
            nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
        }
    }
    
    public String eliminarFavorito() throws Exception {
        cargarDatos(); 
        if(!usi.equals("")){
            List<Favoritos> fList = ControladoresDAO.cFavoritos.recuperaPorUsuario(u);
            Favoritos f = null;
            for(Favoritos fav:fList){
                if(fav.getRopa().getRoId() == Integer.parseInt(roId)){
                    f = fav;
                }
            }
            if(f != null){
                ControladoresDAO.cFavoritos.Elimina(f);
            } else {
                HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                huv.escribirEnArchivoLog("No se pudo eliminar Favorito. ID de ropa="+f.getRopa().getRoId()+", ID de usuario="+
                        u.getUsuId()+" el "+new Date());
            }
            lista_favoritos = ControladoresDAO.cFavoritos.recuperaPorUsuario(u);            
        } else {
            cargarUsuarioNoLogueado(sesion,"");
            List<NoLogFavoritos> fList = ControladoresDAO.cFavoritosNoLog.recuperaPorUsuario(nlu);
            NoLogFavoritos f = null;
            for(NoLogFavoritos fav:fList){
                if(fav.getRopa().getRoId() == Integer.parseInt(roId)){
                    f = fav;
                }
            }
            if(f != null){
                ControladoresDAO.cFavoritosNoLog.Elimina(f);
            } else {
                HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                huv.escribirEnArchivoLog("No se pudo eliminar Favorito. ID de ropa="+f.getRopa().getRoId()+", Nick de usuario="+
                        nlu.getNluNick()+" el "+new Date());
            }
            lista_favoritosNoLog = ControladoresDAO.cFavoritosNoLog.recuperaPorUsuario(nlu);            
        }
        return SUCCESS;
    }
    
    @SkipValidation
    public String ajaxCookie() throws Exception{        
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        if(sesion.get("usuarioLogueado") == null || sesion.get("usuarioLogueado").equals("")){
            cargarUsuarioNoLogueado(sesion, userCookie);
        }
        return SUCCESS;
    }
}