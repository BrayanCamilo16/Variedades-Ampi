package dao;

import java.sql.*;
import java.util.*;
import vo.PedidoVO;
import java.util.logging.*;

/**
 *
 * @author jhona
 */
public class PedidoDAO {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    // Este metodo inserta un pedido y retorna el id de ese pedido
    public int insert(PedidoVO pedidoVo) {
        int idPedido = 0;

        sql = "INSERT INTO pedido (fecha_pedido, fecha_entrega, destino_pedido, estado_pedido) VALUES (?,?,?,?)";
        try {
            // Se inserta el pedido
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, pedidoVo.getFechaPedido());
            stmt.setString(2, pedidoVo.getFechaEntrega());
            stmt.setString(3, pedidoVo.getDestinoPedido());
            stmt.setString(4, pedidoVo.getEstadoPedido());
            stmt.executeUpdate();

            // Se consulta el ultimo pedido insertado
            sql = "SELECT id_pedido FROM pedido ORDER BY id_pedido DESC LIMIT 1";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            if (rs.next()) {
                idPedido = rs.getInt(1);
            }

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar el producto: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return idPedido;
    }
    
    // Este metodo devuelve los VO de pedido
    public List<PedidoVO> consultarPedidosCliente(int idCliente) {
        PedidoVO pedidoVo = null;
        
        List<PedidoVO> pedidos = new ArrayList();
        
        
        sql = "SELECT id_pedido, fecha_pedido, fecha_entrega, destino_pedido, estado_pedido FROM pedido AS ped INNER JOIN usuario_pedido AS usu_ped ON ped.id_pedido = usu_ped.id_pedido_fk WHERE id_usuario_cliente_fk = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Llenamos el VO del pedido
                pedidoVo = new PedidoVO(rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getString("fecha_entrega"), rs.getString("destino_pedido"), rs.getString("estado_pedido"), rs.getInt("id_pedido"));
                
                pedidos.add(pedidoVo);
            }
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return pedidos;
    }

}
