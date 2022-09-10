package dao;

import java.sql.*;
import java.util.*;
import vo.UsuarioPedidoVO;
import java.util.logging.*;

/**
 *
 * @author jhona
 */
public class UsuarioPedidoDAO {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    // Este metodo inserta un registro en la tabla usuario_pedido
    public boolean insert(UsuarioPedidoVO usuarioPedidoVo) {
        sql = "INSERT INTO usuario_pedido (id_pedido_fk, id_usuario_cliente_fk, id_usuario_vendedor_fk) VALUES (?,?,?)";
        try {
            // Se inserta el pedido
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuarioPedidoVo.getIdPedido());
            stmt.setInt(2, usuarioPedidoVo.getIdUsuarioClienteFk());
            stmt.setInt(3, usuarioPedidoVo.getIdUsuarioVendedorFk());
            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar el producto: " + ex.toString());
            Logger.getLogger(UsuarioPedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return operacionExitosa;
    }

    // Este metodo devuelve los VO de pedido
    public List<UsuarioPedidoVO> consultarPedidosCliente(int idCliente) {
        UsuarioPedidoVO usuarioPedidoVo = null;

        List<UsuarioPedidoVO> usuarioPedidos = new ArrayList();

        sql = "SELECT * FROM pedido AS ped INNER JOIN usuario_pedido WHERE id_usuario_cliente_fk = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Llenamos el VO del usuarioPedido
                usuarioPedidoVo = new UsuarioPedidoVO(rs.getInt("id_usuario_pedido"), rs.getInt("id_pedido_fk"), rs.getInt("id_usuario_cliente_fk"), rs.getInt("id_usuario_vendedor_fk"));
                usuarioPedidos.add(usuarioPedidoVo);
            }

        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return usuarioPedidos;
    }
}
