package Modelos;

public class cestaSH {
    private int cesta_id;
    private int cesta_ro_id;
    private int cesta_usu_id;
    private int cesta_unidades;

    public cestaSH(int cesta_id, int cesta_ro_id, int cesta_usu_id, int cesta_unidades) {
        this.cesta_id = cesta_id;
        this.cesta_ro_id = cesta_ro_id;
        this.cesta_usu_id = cesta_usu_id;
        this.cesta_unidades = cesta_unidades;
    }

    public int getCesta_id() {
        return cesta_id;
    }

    public void setCesta_id(int cesta_id) {
        this.cesta_id = cesta_id;
    }

    public int getCesta_ro_id() {
        return cesta_ro_id;
    }

    public void setCesta_ro_id(int cesta_ro_id) {
        this.cesta_ro_id = cesta_ro_id;
    }

    public int getCesta_usu_id() {
        return cesta_usu_id;
    }

    public void setCesta_usu_id(int cesta_usu_id) {
        this.cesta_usu_id = cesta_usu_id;
    }

    public int getCesta_unidades() {
        return cesta_unidades;
    }

    public void setCesta_unidades(int cesta_unidades) {
        this.cesta_unidades = cesta_unidades;
    }
    
    
}
