package dao;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import util.Conexion2;
import vo.DetallespedidoVO;

/**
 *
 * @author Camargo
 */
public class DetallespedidoDAO extends Conexion2 {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    public List<DetallespedidoVO> select(int idPedido) {
        List<DetallespedidoVO> detalles = new ArrayList();
        DetallespedidoVO detallesPedidoVo = null;
        sql = "SELECT * FROM detpedido WHERE id_pedido = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPedido);
            rs = stmt.executeQuery();
            while (rs.next()) {
                detallesPedidoVo = new DetallespedidoVO(rs.getInt("id_pedido"), rs.getInt("cantidad_producto"), rs.getString("nombre_producto"), rs.getString("categoria_producto"), rs.getString("marca_producto"), rs.getFloat("precio_unitario_producto"));
                detalles.add(detallesPedidoVo);
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al listar los detalles del pedidos: " + ex.toString());
            Logger.getLogger(DetallespedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }   
        }

        return detalles;
    }
}