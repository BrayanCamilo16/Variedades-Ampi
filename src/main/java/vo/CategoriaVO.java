package vo;

/**
 *
 * @author Camargo
 */
public class CategoriaVO {
    private int idCategoria;
    private String nombreCategoria;
    private String descripcionCategoria;
        private String rutaImgCategoria;

    public CategoriaVO() {
    }
   
    public CategoriaVO(String nombreCategoria, String descripcionCategoria, String rutaImgCategoria) {
        this.nombreCategoria = nombreCategoria;
        this.descripcionCategoria = descripcionCategoria;
        this.rutaImgCategoria = rutaImgCategoria;
    }

    public CategoriaVO(int idCategoria, String nombreCategoria, String descripcionCategoria) {
        this.idCategoria = idCategoria;
        this.nombreCategoria = nombreCategoria;
        this.descripcionCategoria = descripcionCategoria;
    }

    public CategoriaVO(int idCategoria, String nombreCategoria, String descripcionCategoria, String rutaImgCategoria) {
        this.idCategoria = idCategoria;
        this.nombreCategoria = nombreCategoria;
        this.descripcionCategoria = descripcionCategoria;
        this.rutaImgCategoria = rutaImgCategoria;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getDescripcionCategoria() {
        return descripcionCategoria;
    }

    public void setDescripcionCategoria(String descripcionCategoria) {
        this.descripcionCategoria = descripcionCategoria;
    }

    public String getRutaImgCategoria() {
        return rutaImgCategoria;
    }

    public void setRutaImgCategoria(String rutaImgCategoria) {
        this.rutaImgCategoria = rutaImgCategoria;
    }

    @Override
    public String toString() {
        return "CategoriaVO{" + "idCategoria=" + idCategoria + ", nombreCategoria=" + nombreCategoria + ", descripcionCategoria=" + descripcionCategoria + ", rutaImgCategoria=" + rutaImgCategoria + '}';
    }
    
}
