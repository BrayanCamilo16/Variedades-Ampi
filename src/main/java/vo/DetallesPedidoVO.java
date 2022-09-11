package vo;

/**
 *
 * @author Camargo
 */
public class DetallespedidoVO {
    private int idPedido, cantidadProducto;
    private String nombreProducto, categoriaProducto, marcaProducto;
    private float precioUnitarioProducto;

    public DetallespedidoVO(int idPedido, int cantidadProducto, String nombreProducto, String categoriaProducto, String marcaProducto, float precioUnitarioProducto) {
        this.idPedido = idPedido;
        this.cantidadProducto = cantidadProducto;
        this.nombreProducto = nombreProducto;
        this.categoriaProducto = categoriaProducto;
        this.marcaProducto = marcaProducto;
        this.precioUnitarioProducto = precioUnitarioProducto;
    }

    public int getIdpedido() {
        return idPedido;
    }

    public void setIdpedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCategoriaProducto() {
        return categoriaProducto;
    }

    public void setCategoriaProducto(String categoriaProducto) {
        this.categoriaProducto = categoriaProducto;
    }

    public String getMarcaProducto() {
        return marcaProducto;
    }

    public void setMarcaProducto(String marcaProducto) {
        this.marcaProducto = marcaProducto;
    }

    public float getPrecioUnitarioProducto() {
        return precioUnitarioProducto;
    }

    public void setPrecioUnitarioProducto(float precioUnitarioProducto) {
        this.precioUnitarioProducto = precioUnitarioProducto;
    }

    

    @Override
    public String toString() {
        return "DetallespedidoVO{" + "idPedido=" + idPedido + ", nombreProducto=" + nombreProducto + ", categoriaProducto=" + categoriaProducto + ", marcaProducto=" + marcaProducto + ", precioUnitarioProducto=" + precioUnitarioProducto + ", cantidadProducto=" + marcaProducto + '}';
    }
    
}
