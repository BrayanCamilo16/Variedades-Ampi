package vo;

/**
 *
 * @author Camargo
 */
public class PedidoVO {
    private int idPedido;
    private String fechaPedido, fechaEntrega, destinoPedido, estadoPedido ,nombreCliente, nombreVendedor;
    private int idCliente, idVendedor;

    public PedidoVO(int idPedido, String fechaPedido, String fechaEntrega, String destinoPedido, String estadoPedido, int idCliente, String nombreCliente, int idVendedor, String nombreVendedor) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.destinoPedido = destinoPedido;
        this.estadoPedido = estadoPedido;
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.idVendedor = idVendedor;
        this.nombreVendedor = nombreVendedor;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getDestinoPedido() {
        return destinoPedido;
    }

    public void setDestinoPedido(String destinoPedido) {
        this.destinoPedido = destinoPedido;
    }

    public String getEstadoPedido() {
        return estadoPedido;
    }

    public void setEstadoPedido(String estadoPedido) {
        this.estadoPedido = estadoPedido;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getNombreVendedor() {
        return nombreVendedor;
    }

    public void setNombreVendedor(String nombreVendedor) {
        this.nombreVendedor = nombreVendedor;
    }

    @Override
    public String toString() {
        return "PedidoVO{" + "idPedido=" + idPedido + ", fechaPedido="+ fechaPedido + ", fechaEntrega=" + fechaEntrega + ", destinoPedido=" + destinoPedido + ", estadoPedido=" + estadoPedido + ", idCliente=" + idCliente + ", nombreCliente=" + nombreCliente + ", idVendedor=" + idVendedor + ", nombreVendedor=" + nombreVendedor + '}';
    }

}
