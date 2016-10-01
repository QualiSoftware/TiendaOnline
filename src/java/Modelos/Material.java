package Modelos;
// Generated 01-oct-2016 9:25:16 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Material generated by hbm2java
 */
public class Material  implements java.io.Serializable {


     private Integer materialId;
     private String materialDescripcion;
     private Set<RopaMaterial> ropaMaterials = new HashSet<RopaMaterial>(0);

    public Material() {
    }

	
    public Material(String materialDescripcion) {
        this.materialDescripcion = materialDescripcion;
    }
    public Material(String materialDescripcion, Set<RopaMaterial> ropaMaterials) {
       this.materialDescripcion = materialDescripcion;
       this.ropaMaterials = ropaMaterials;
    }
   
    public Integer getMaterialId() {
        return this.materialId;
    }
    
    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }
    public String getMaterialDescripcion() {
        return this.materialDescripcion;
    }
    
    public void setMaterialDescripcion(String materialDescripcion) {
        this.materialDescripcion = materialDescripcion;
    }
    public Set<RopaMaterial> getRopaMaterials() {
        return this.ropaMaterials;
    }
    
    public void setRopaMaterials(Set<RopaMaterial> ropaMaterials) {
        this.ropaMaterials = ropaMaterials;
    }




}


