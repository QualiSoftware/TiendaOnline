/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Campania;
import Modelos.Cesta;
import Modelos.Marcas;
import Modelos.Paises;
import Modelos.Provincias;
import Modelos.Ropa;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/*  
*   Author     : QualiSoftware
*/
public class HomeApadrina extends ActionSupport {
    
    private Map sesion;
    private String usi;
    private Usuarios u;
    private String emailAmigo;
    private String nombreAmigo;
    private String mensajeDivError;
    private boolean superaPeriodo;
    private String filtro;
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Campania> lista_campanias;
    private List<Marcas>lista_marcas;
    private List<Campania> lista_campaniasTienda;
    private List<Marcas> lista_marcasTienda;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private String usuEmail;
    private String usuFechaNac;
    private String usuNombre;
    private String usuApellidos;
    private String usuPassword;
    private String usuDni;
    private String usuCp;
    private String usuDireccion;
    private boolean usuSexo;
    private String usuTelefono;
    private String usuLocalidad;
    private String provincias2;
    private List<Paises> listaPaises;
    private List<Provincias> listaProvincias;
    
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

    public String getEmailAmigo() {
        return emailAmigo;
    }

    public void setEmailAmigo(String emailAmigo) {
        this.emailAmigo = emailAmigo;
    }

    public String getNombreAmigo() {
        return nombreAmigo;
    }

    public void setNombreAmigo(String nombreAmigo) {
        this.nombreAmigo = nombreAmigo;
    }

    public String getMensajeDivError() {
        return mensajeDivError;
    }

    public void setMensajeDivError(String mensajeDivError) {
        this.mensajeDivError = mensajeDivError;
    }

    public boolean isSuperaPeriodo() {
        return superaPeriodo;
    }

    public void setSuperaPeriodo(boolean superaPeriodo) {
        this.superaPeriodo = superaPeriodo;
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

    public String getUsuEmail() {
        return usuEmail;
    }

    public void setUsuEmail(String usuEmail) {
        this.usuEmail = usuEmail;
    }

    public String getUsuFechaNac() {
        return usuFechaNac;
    }

    public void setUsuFechaNac(String usuFechaNac) {
        this.usuFechaNac = usuFechaNac;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuApellidos() {
        return usuApellidos;
    }

    public void setUsuApellidos(String usuApellidos) {
        this.usuApellidos = usuApellidos;
    }

    public String getUsuPassword() {
        return usuPassword;
    }

    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }

    public String getUsuDni() {
        return usuDni;
    }

    public void setUsuDni(String usuDni) {
        this.usuDni = usuDni;
    }

    public String getUsuCp() {
        return usuCp;
    }

    public void setUsuCp(String usuCp) {
        this.usuCp = usuCp;
    }

    public String getUsuDireccion() {
        return usuDireccion;
    }

    public void setUsuDireccion(String usuDireccion) {
        this.usuDireccion = usuDireccion;
    }

    public boolean isUsuSexo() {
        return usuSexo;
    }

    public void setUsuSexo(boolean usuSexo) {
        this.usuSexo = usuSexo;
    }

    public String getUsuTelefono() {
        return usuTelefono;
    }

    public void setUsuTelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }

    public String getUsuLocalidad() {
        return usuLocalidad;
    }

    public void setUsuLocalidad(String usuLocalidad) {
        this.usuLocalidad = usuLocalidad;
    }

    public String getProvincias2() {
        return provincias2;
    }

    public void setProvincias2(String provincias2) {
        this.provincias2 = provincias2;
    }

    public List<Paises> getListaPaises() {
        return listaPaises;
    }

    public void setListaPaises(List<Paises> listaPaises) {
        this.listaPaises = listaPaises;
    }

    public List<Provincias> getListaProvincias() {
        return listaProvincias;
    }

    public void setListaProvincias(List<Provincias> listaProvincias) {
        this.listaProvincias = listaProvincias;
    }
    
    public String enviaEmailApadrinado() throws Exception{
        cargarDatos();
        List<Usuarios> existe = ControladoresDAO.cUsuarios.recuperaPorEmail(emailAmigo);
        if(existe.size()==0){
            boolean confirmacion = ControladoresDAO.cEmail.enviarApadrina(nombreAmigo, emailAmigo, u);
            if(confirmacion){
                mensajeDivError = "Email enviado con éxito a tu amigo!";                
            } else {
                mensajeDivError = "Tu amigo ya está registrado en nuestra Base de Datos con anterioridad";
            }
        } else {
            mensajeDivError = "Tu amigo ya está registrado en nuestra Base de Datos con anterioridad";            
        }
        return SUCCESS; 
    }
    
    public String altaUsuarioApadrinado() throws Exception{
        cargarDatos();
        int year;
        int month;
        String monthString;
        int day;
        String dayString;
        usuNombre = "";
        usuApellidos = "";
        usuPassword = "";
        usuDni = "";
        usuDireccion = "";
        usuCp = "";
        Date fecha = new Date();
        year = fecha.getYear() + 1882;
        month = fecha.getMonth()+1;
        day = fecha.getDate();
        if(month < 10){
            monthString = "0"+month;
        }else{
            monthString = ""+month;
        }
        if(day < 10){
            dayString = "0"+day;
        }else{
            dayString = ""+day;
        }
        usuFechaNac = dayString+"-"+monthString+"-"+year;
        usuSexo = true;
        usuTelefono = "";
        usuLocalidad = "";
        provincias2 = "1";
        listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
        listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos("");
        return SUCCESS;
    }
     
    public String CrudActionApadrinado() throws Exception{
        
        if(sesion==null){
         sesion=ActionContext.getContext().getSession();
        }
        List<Usuarios> usuLista = ControladoresDAO.cUsuarios.recuperaPorEmail(usuEmail);
        if(usuLista.size()==1){         
            Usuarios p = usuLista.get(0);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String year;
            String month;
            String day;
            year = usuFechaNac.substring(6, 10);
            month = usuFechaNac.substring(3, 5);
            day = usuFechaNac.substring(0, 2);
            String auxFecha = year+"-"+month+"-"+day;
            Date date = sdf.parse(auxFecha);
            p.setProvincias(ControladoresDAO.cProvincias.RecuperaPorId(Integer.parseInt(provincias2)));
            p.setUsuNombre(usuNombre);
            p.setUsuApellidos(usuApellidos);
            p.setUsuEmail(usuEmail);
            HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
            p.setUsuPassword(huv.encriptar(usuPassword));
            p.setUsuDni(usuDni);
            p.setUsuCp(usuCp);
            p.setUsuDireccion(usuDireccion);
            p.setUsuSexo(usuSexo);
            p.setUsuTelefono(usuTelefono);
            p.setUsuLocalidad(usuLocalidad);
            p.setUsuFechaNac(date);
            p.setUsuDescuento(10.0);
            Date ahora = new Date();
            p.setUsuFechaLimiteDesc(Acciones.HomeRopa.sumarRestarDiasFecha(ahora, 30));
            p.setUsuAlta(ahora);
            p.setUsuAdministrador(0);
            p.setUsuActivo(true);
            ControladoresDAO.cUsuarios.Modifica(p);
        } else {
            return INPUT;
        }
        return SUCCESS;
    }
    
    public void cargarDatos() throws Exception {        
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        superaPeriodo = false;
        usi = "";
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) sesion.get("usuarioLogueado");
                    usi = ""+u.getUsuId();
                    Date hoy = new Date();
                    hoy = Acciones.HomeRopa.sumarRestarDiasFecha(hoy, -15);
                    if(u.getUsuAlta().before(hoy)){
                        superaPeriodo = true;
                    }
                }catch(Exception e){
                    System.out.println(e.getMessage());
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
        }
    }
}