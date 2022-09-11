package vo;

/**
 *
 * @author Camargo
 */
public class ProductoVO {
    private int idProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private double precioUnitarioProducto;
    private double stockProducto;
    private double unidadMinimaProducto;
    private String nombreImgProducto;
    private String estadoProducto;
    private int idMarca;
    private int idCategoria;

    public ProductoVO() {
    }

    public ProductoVO(String nombreProducto, String descripcionProducto, double precioUnitarioProducto, double stockProducto, double unidadMinimaProducto, String nombreImgProducto, String estadoProducto) {
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioUnitarioProducto = precioUnitarioProducto;
        this.stockProducto = stockProducto;
        this.unidadMinimaProducto = unidadMinimaProducto;
        this.nombreImgProducto = nombreImgProducto;
        this.estadoProducto = estadoProducto;
    }

    public ProductoVO(String nombreProducto, String descripcionProducto, double precioUnitarioProducto, double stockProducto, double unidadMinimaProducto, String nombreImgProducto, String estadoProducto, int idMarca, int idCategoria) {
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioUnitarioProducto = precioUnitarioProducto;
        this.stockProducto = stockProducto;
        this.unidadMinimaProducto = unidadMinimaProducto;
        this.nombreImgProducto = nombreImgProducto;
        this.estadoProducto = estadoProducto;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
    }

    public ProductoVO(int idProducto, String nombreProducto, String descripcionProducto, double precioUnitarioProducto, double stockProducto, double unidadMinimaProducto, String nombreImgProducto, String estadoProducto, int idMarca, int idCategoria) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioUnitarioProducto = precioUnitarioProducto;
        this.stockProducto = stockProducto;
        this.unidadMinimaProducto = unidadMinimaProducto;
        this.nombreImgProducto = nombreImgProducto;
        this.estadoProducto = estadoProducto;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecioUnitarioProducto() {
        return precioUnitarioProducto;
    }

    public void setPrecioUnitarioProducto(double precioUnitarioProducto) {
        this.precioUnitarioProducto = precioUnitarioProducto;
    }

    public double getStockProducto() {
        return stockProducto;
    }

    public void setStockProducto(double stockProducto) {
        this.stockProducto = stockProducto;
    }

    public double getUnidadMinimaProducto() {
        return unidadMinimaProducto;
    }

    public void setUnidadMinimaProducto(double unidadMinimaProducto) {
        this.unidadMinimaProducto = unidadMinimaProducto;
    }

    public String getNombreImgProducto() {
        return nombreImgProducto;
    }

    public void setNombreImgProducto(String nombreImgProducto) {
        this.nombreImgProducto = nombreImgProducto;
    }

    public String getEstadoProducto() {
        return estadoProducto;
    }

    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    @Override
    public String toString() {
        return "ProductoVO{" + "idProducto=" + idProducto + ", nombreProducto=" + nombreProducto + ", descripcionProducto=" + descripcionProducto + ", precioUnitarioProducto=" + precioUnitarioProducto + ", stockProducto=" + stockProducto + ", unidadMinimaProducto=" + unidadMinimaProducto + ", nombreImgProducto=" + nombreImgProducto + ", estadoProducto=" + estadoProducto + ", idMarca=" + idMarca + ", idCategoria=" + idCategoria + '}';
    }
    
}
