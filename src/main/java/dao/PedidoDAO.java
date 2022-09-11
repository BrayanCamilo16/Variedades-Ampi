package dao;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import util.Conexion2;
import vo.PedidoVO;

/**
 *
 * @author Camargo
 */
public class PedidoDAO extends Conexion2 {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    public List<PedidoVO> select() {
        List<PedidoVO> pedidos = new ArrayList();
        PedidoVO pedidoVo = null;
        sql = "SELECT * FROM pedidos ORDER BY fecha_pedido desc";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                pedidoVo = new PedidoVO(rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getString("fecha_entrega"), rs.getString("destino_pedido"), rs.getString("estado_pedido"), rs.getInt("id_cliente"), rs.getString("nombre_cliente"), rs.getInt("id_vendedor"), rs.getString("nombre_vendedor"));
                pedidos.add(pedidoVo);
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al listar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }   
        }

        return pedidos;
    }
    
    public PedidoVO selectById(int id) {
        PedidoVO pedidoVo = null;

        sql = "SELECT * FROM pedidos WHERE id_pedido = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                pedidoVo = new PedidoVO(rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getString("fecha_entrega"), rs.getString("destino_pedido"), rs.getString("estado_pedido"), rs.getInt("id_cliente"), rs.getString("nombre_cliente"), rs.getInt("id_vendedor"), rs.getString("nombre_vendedor"));
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al consultar el pedido: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }
        }

        return pedidoVo;
    }
    
    /*public List<PedidoVO> selectByIdUsuario(int idUsuario) {
        List<PedidoVO> pedidos = new ArrayList();
        PedidoVO pedidoVo = null;
        sql = "SELECT * FROM categoria WHERE idUsuario = ?  ORDER BY fecha_pedido";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuarioVo.get());
            rs = stmt.executeQuery();

            while (rs.next()) {
                pedidoVo = new PedidoVO(rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getString("fecha_entrega"), rs.getString("destino_pedido"), rs.getString("estado_pedido"), rs.getInt("id_producto_fk"));
                pedidos.add(pedidoVo);
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al listar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }   
        }

        return pedidos;
    }*/

    public boolean insert(PedidoVO pedidoVo) {

        sql = "INSERT INTO pedido (fecha_pedido, fecha_entrega, destino_pedido, estado_pedido, id_producto_FK) VALUES (?,?,?,`Entregado`,null)";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, pedidoVo.getEstadoPedido());
            stmt.setString(2, pedidoVo.getFechaEntrega());
            stmt.setString(3, pedidoVo.getDestinoPedido());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar el pedido: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }
        }

        return operacionExitosa;
    }
    
    public boolean update(PedidoVO pedidoVo) {

        sql = "UPDATE pedido SET estado_pedido = ? WHERE id_pedido = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(4, pedidoVo.getEstadoPedido());
            stmt.setInt(5, pedidoVo.getIdPedido());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al actualizar el pedido: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }
        }

        return operacionExitosa;
    }
    
    public boolean delete(int idPedido) {
        sql = "UPDATE pedido SET estado_pedido = 'Cancelado' WHERE id_pedido = ? and estado_pedido `No entregado`";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPedido);
            stmt.executeUpdate();
            operacionExitosa = true;
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al cancelar el pedido: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
            }
        }

        return operacionExitosa;
    }
}