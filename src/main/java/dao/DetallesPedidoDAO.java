package dao;

import java.sql.*;
import java.util.*;
import vo.DetallesPedidoVO;
import java.util.logging.*;

/**
 *
 * @author jhona
 */
public class DetallesPedidoDAO {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    // Este metodo inserta un registro en la tabla detalles_pedido
    public boolean insert(DetallesPedidoVO detallesPedidoVo) {
        sql = "INSERT INTO detalles_pedido (id_pedido, id_producto, precio_unidad, cantidad) VALUES (?,?,?,?)";
        try {
            // Se inserta el pedido
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, detallesPedidoVo.getIdPedido());
            stmt.setString(2, detallesPedidoVo.getIdProducto());
            stmt.setDouble(3, detallesPedidoVo.getPrecioUnidad());
            stmt.setDouble(4, detallesPedidoVo.getCantidad());
            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar el producto: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return operacionExitosa;
    }

    // Este metodo devuelve los VO de pedido
    public List<DetallesPedidoVO> consultarDetallesPedidosCliente(int idCliente) {
        DetallesPedidoVO detallesPedidoVo = null;

        List<DetallesPedidoVO> detallesPedidos = new ArrayList();

        sql = "SELECT ped.id_pedido, id_producto, precio_unidad, cantidad FROM detalles_pedido AS det_ped INNER JOIN pedido AS ped ON det_ped.id_pedido = ped.id_pedido INNER JOIN usuario_pedido AS usu_ped ON ped.id_pedido = usu_ped.id_pedido_fk WHERE id_usuario_cliente_fk = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Llenamos el VO del detallesPedido
                detallesPedidoVo = new DetallesPedidoVO(rs.getString("id_pedido"), rs.getString("id_producto"), rs.getDouble("precio_unidad"), rs.getDouble("cantidad"));

                detallesPedidos.add(detallesPedidoVo);
            }

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return detallesPedidos;
    }
}
