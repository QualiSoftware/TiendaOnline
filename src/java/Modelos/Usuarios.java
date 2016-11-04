package Modelos;
// Generated 04-nov-2016 22:00:06 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Usuarios generated by hbm2java
 */
public class Usuarios  implements java.io.Serializable {


     private Integer usuId;
     private Provincias provincias;
     private String usuNombre;
     private String usuApellidos;
     private String usuEmail;
     private String usuPassword;
     private String usuDni;
     private String usuDireccion;
     private String usuCp;
     private Date usuFechaNac;
     private boolean usuSexo;
     private String usuTelefono;
     private String usuLocalidad;
     private int usuAdministrador;
     private Set<Cesta> cestas = new HashSet<Cesta>(0);
     private Set<Favoritos> favoritoses = new HashSet<Favoritos>(0);

    public Usuarios() {
    }

	
    public Usuarios(Provincias provincias, String usuNombre, String usuApellidos, String usuEmail, String usuPassword, String usuDni, String usuDireccion, String usuCp, Date usuFechaNac, boolean usuSexo, String usuTelefono, String usuLocalidad, int usuAdministrador) {
        this.provincias = provincias;
        this.usuNombre = usuNombre;
        this.usuApellidos = usuApellidos;
        this.usuEmail = usuEmail;
        this.usuPassword = usuPassword;
        this.usuDni = usuDni;
        this.usuDireccion = usuDireccion;
        this.usuCp = usuCp;
        this.usuFechaNac = usuFechaNac;
        this.usuSexo = usuSexo;
        this.usuTelefono = usuTelefono;
        this.usuLocalidad = usuLocalidad;
        this.usuAdministrador = usuAdministrador;
    }
    public Usuarios(Provincias provincias, String usuNombre, String usuApellidos, String usuEmail, String usuPassword, String usuDni, String usuDireccion, String usuCp, Date usuFechaNac, boolean usuSexo, String usuTelefono, String usuLocalidad, int usuAdministrador, Set<Cesta> cestas, Set<Favoritos> favoritoses) {
       this.provincias = provincias;
       this.usuNombre = usuNombre;
       this.usuApellidos = usuApellidos;
       this.usuEmail = usuEmail;
       this.usuPassword = usuPassword;
       this.usuDni = usuDni;
       this.usuDireccion = usuDireccion;
       this.usuCp = usuCp;
       this.usuFechaNac = usuFechaNac;
       this.usuSexo = usuSexo;
       this.usuTelefono = usuTelefono;
       this.usuLocalidad = usuLocalidad;
       this.usuAdministrador = usuAdministrador;
       this.cestas = cestas;
       this.favoritoses = favoritoses;
    }
   
    public Integer getUsuId() {
        return this.usuId;
    }
    
    public void setUsuId(Integer usuId) {
        this.usuId = usuId;
    }
    public Provincias getProvincias() {
        return this.provincias;
    }
    
    public void setProvincias(Provincias provincias) {
        this.provincias = provincias;
    }
    public String getUsuNombre() {
        return this.usuNombre;
    }
    
    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }
    public String getUsuApellidos() {
        return this.usuApellidos;
    }
    
    public void setUsuApellidos(String usuApellidos) {
        this.usuApellidos = usuApellidos;
    }
    public String getUsuEmail() {
        return this.usuEmail;
    }
    
    public void setUsuEmail(String usuEmail) {
        this.usuEmail = usuEmail;
    }
    public String getUsuPassword() {
        return this.usuPassword;
    }
    
    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }
    public String getUsuDni() {
        return this.usuDni;
    }
    
    public void setUsuDni(String usuDni) {
        this.usuDni = usuDni;
    }
    public String getUsuDireccion() {
        return this.usuDireccion;
    }
    
    public void setUsuDireccion(String usuDireccion) {
        this.usuDireccion = usuDireccion;
    }
    public String getUsuCp() {
        return this.usuCp;
    }
    
    public void setUsuCp(String usuCp) {
        this.usuCp = usuCp;
    }
    public Date getUsuFechaNac() {
        return this.usuFechaNac;
    }
    
    public void setUsuFechaNac(Date usuFechaNac) {
        this.usuFechaNac = usuFechaNac;
    }
    public boolean isUsuSexo() {
        return this.usuSexo;
    }
    
    public void setUsuSexo(boolean usuSexo) {
        this.usuSexo = usuSexo;
    }
    public String getUsuTelefono() {
        return this.usuTelefono;
    }
    
    public void setUsuTelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }
    public String getUsuLocalidad() {
        return this.usuLocalidad;
    }
    
    public void setUsuLocalidad(String usuLocalidad) {
        this.usuLocalidad = usuLocalidad;
    }
    public int getUsuAdministrador() {
        return this.usuAdministrador;
    }
    
    public void setUsuAdministrador(int usuAdministrador) {
        this.usuAdministrador = usuAdministrador;
    }
    public Set<Cesta> getCestas() {
        return this.cestas;
    }
    
    public void setCestas(Set<Cesta> cestas) {
        this.cestas = cestas;
    }
    public Set<Favoritos> getFavoritoses() {
        return this.favoritoses;
    }
    
    public void setFavoritoses(Set<Favoritos> favoritoses) {
        this.favoritoses = favoritoses;
    }




}


