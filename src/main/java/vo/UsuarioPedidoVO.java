package vo;

/**
 *
 * @author jhona
 */
public class UsuarioPedidoVO {
    private int idUsuarioPedido;
    private int idPedido;
    private int idUsuarioClienteFk;
    private int idUsuarioVendedorFk;

    public UsuarioPedidoVO() {
    }

    public UsuarioPedidoVO(int idUsuarioPedido, int idPedido, int idUsuarioClienteFk, int idUsuarioVendedorFk) {
        this.idUsuarioPedido = idUsuarioPedido;
        this.idPedido = idPedido;
        this.idUsuarioClienteFk = idUsuarioClienteFk;
        this.idUsuarioVendedorFk = idUsuarioVendedorFk;
    }

    public int getIdUsuarioPedido() {
        return idUsuarioPedido;
    }

    public void setIdUsuarioPedido(int idUsuarioPedido) {
        this.idUsuarioPedido = idUsuarioPedido;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdUsuarioClienteFk() {
        return idUsuarioClienteFk;
    }

    public void setIdUsuarioClienteFk(int idUsuarioClienteFk) {
        this.idUsuarioClienteFk = idUsuarioClienteFk;
    }

    public int getIdUsuarioVendedorFk() {
        return idUsuarioVendedorFk;
    }

    public void setIdUsuarioVendedorFk(int idUsuarioVendedorFk) {
        this.idUsuarioVendedorFk = idUsuarioVendedorFk;
    }

    @Override
    public String toString() {
        return "UsuarioPedidoVO{" + "idUsuarioPedido=" + idUsuarioPedido + ", idPedido=" + idPedido + ", idUsuarioClienteFk=" + idUsuarioClienteFk + ", idUsuarioVendedorFk=" + idUsuarioVendedorFk + '}';
    }
    
}
