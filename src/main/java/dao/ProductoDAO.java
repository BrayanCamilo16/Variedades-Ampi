package dao;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import util.Conexion2;
import vo.ProductoVO;

/**
 *
 * @author Camargo
 */
public class ProductoDAO extends Conexion2{
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    public List<ProductoVO> select() {
        List<ProductoVO> productos = new ArrayList();
        ProductoVO productoVo = null;

        sql = "SELECT * FROM producto ORDER BY nombre_producto";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                productoVo = new ProductoVO(rs.getInt("id_producto"), rs.getString("nombre_producto"), rs.getString("descripcion_producto"), rs.getDouble("precio_unitario_producto"), rs.getDouble("stock_producto"), rs.getDouble("unidad_minima_producto"), rs.getString("nombre_img_producto"), rs.getString("estado_producto"), rs.getInt("id_marca_FK"), rs.getInt("id_categoria_FK"));
                productos.add(productoVo);
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al listar los productos: " + ex.toString());
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return productos;
    }
    
    public ProductoVO selectById(int id) {
        ProductoVO productoVo = null;

        sql = "SELECT * FROM producto WHERE id_producto = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                productoVo = new ProductoVO(rs.getInt("id_producto"), rs.getString("nombre_producto"), rs.getString("descripcion_producto"), rs.getDouble("precio_unitario_producto"), rs.getDouble("stock_producto"), rs.getDouble("unidad_minima_producto"), rs.getString("nombre_img_producto"), rs.getString("estado_producto"), rs.getInt("id_marca_FK"), rs.getInt("id_categoria_FK"));
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al consultar el producto: " + ex.toString());
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return productoVo;
    }

    public boolean insert(ProductoVO productoVo) {

        sql = "INSERT INTO producto (nombre_producto, descripcion_producto, precio_unitario_producto, stock_producto, unidad_minima_producto, nombre_img_producto, estado_producto, id_marca_fk, id_categoria_fk) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, productoVo.getNombreProducto());
            stmt.setString(2, productoVo.getDescripcionProducto());
            stmt.setDouble(3, productoVo.getPrecioUnitarioProducto());
            stmt.setDouble(4, productoVo.getStockProducto());
            stmt.setDouble(5, productoVo.getUnidadMinimaProducto());
            stmt.setString(6, productoVo.getNombreImgProducto());
            stmt.setString(7, productoVo.getEstadoProducto());
            stmt.setInt(8, productoVo.getIdMarca());
            stmt.setInt(9, productoVo.getIdCategoria());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar el producto: " + ex.toString());
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }
    
    public boolean update(ProductoVO productoVo) {

        sql = "UPDATE producto SET nombre_producto = ?, descripcion_producto = ?, precio_unitario_producto = ?, stock_producto = ?, unidad_minima_producto = ?, nombre_img_producto = ?, estado_producto = ?, id_marca_fk = ?, id_categoria_fk = ?  WHERE id_producto = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, productoVo.getNombreProducto());
            stmt.setString(2, productoVo.getDescripcionProducto());
            stmt.setDouble(3, productoVo.getPrecioUnitarioProducto());
            stmt.setDouble(4, productoVo.getStockProducto());
            stmt.setDouble(5, productoVo.getUnidadMinimaProducto());
            stmt.setString(6, productoVo.getNombreImgProducto());
            stmt.setString(7, productoVo.getEstadoProducto());
            stmt.setInt(8, productoVo.getIdMarca());
            stmt.setInt(9, productoVo.getIdCategoria());
            stmt.setInt(10, productoVo.getIdProducto());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al actualizar la categoria: " + ex.toString());
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }
    
    // Este metodo devuelve los VO de pedido
    public List<ProductoVO> consultarProductosDePedidosCliente(int idCliente) {
        ProductoVO productoVo = null;
        
        List<ProductoVO> productos = new ArrayList();
        
        sql = "SELECT prod.id_producto, nombre_producto, descripcion_producto, precio_unitario_producto, stock_producto, unidad_minima_producto, nombre_img_producto, estado_producto, id_marca_fk, id_categoria_fk, cantidad FROM producto AS prod INNER JOIN detalles_pedido AS det_ped ON prod.id_producto = det_ped.id_producto INNER JOIN pedido AS ped ON ped.id_pedido = det_ped.id_pedido INNER JOIN usuario_pedido AS usu_ped ON ped.id_pedido = usu_ped.id_pedido_fk WHERE id_usuario_cliente_fk = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Lenamos el VO de producto
                productoVo = new ProductoVO(rs.getInt("id_producto"), rs.getString("nombre_producto"), rs.getString("descripcion_producto"), rs.getDouble("precio_unitario_producto"), rs.getDouble("stock_producto"), rs.getDouble("unidad_minima_producto"), rs.getString("nombre_img_producto"),rs.getString("estado_producto"), rs.getInt("id_marca_fk"), rs.getInt("id_categoria_fk"), rs.getInt("cantidad"));
                
                productos.add(productoVo);
            }
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al consultar los pedidos: " + ex.toString());
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return productos;
    }
}
