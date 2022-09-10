package vo;

/**
 *
 * @author jhona
 */
public class DetallesPedidoVO {
    private String idPedido;
    private String idProducto;
    private double precioUnidad;
    private double cantidad;

    public DetallesPedidoVO() {
    }

    public DetallesPedidoVO(String idProducto, double cantidad) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    public DetallesPedidoVO(String idPedido, String idProducto, double cantidad) {
        this.idPedido = idPedido;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    public DetallesPedidoVO(String idPedido, String idProducto, double precioUnidad, double cantidad) {
        this.idPedido = idPedido;
        this.idProducto = idProducto;
        this.precioUnidad = precioUnidad;
        this.cantidad = cantidad;
    }

    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public double getPrecioUnidad() {
        return precioUnidad;
    }

    public void setPrecioUnidad(double precioUnidad) {
        this.precioUnidad = precioUnidad;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "DetallesPedido{" + "idPedido=" + idPedido + ", idProducto=" + idProducto + ", precioUnidad=" + precioUnidad + ", cantidad=" + cantidad + '}';
    }
    
}
