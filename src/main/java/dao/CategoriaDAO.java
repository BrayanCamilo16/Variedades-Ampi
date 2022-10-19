package dao;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import util.Conexion2;
import vo.CategoriaVO;

/**
 *
 * @author Camargo
 */
public class CategoriaDAO extends Conexion2 {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private String sql = "";
    boolean operacionExitosa = false;

    public List<CategoriaVO> select() {
        List<CategoriaVO> categorias = new ArrayList();
        CategoriaVO categoriaVo = null;

        sql = "SELECT * FROM categoria ORDER BY nombre_categoria";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                categoriaVo = new CategoriaVO(rs.getInt("id_categoria"), rs.getString("nombre_categoria"), rs.getString("descripcion_categoria"), rs.getString("nombre_img_categoria"));
                categorias.add(categoriaVo);
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al listar las categorias: " + ex.toString());
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return categorias;
    }
    
    public CategoriaVO selectById(int id) {
        CategoriaVO categoriaVo = null;

        sql = "SELECT * FROM categoria WHERE id_categoria = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                categoriaVo = new CategoriaVO(rs.getInt("id_categoria"), rs.getString("nombre_categoria"), rs.getString("descripcion_categoria"), rs.getString("nombre_img_categoria"));
            }
        } catch (SQLException ex) {
            System.out.println("Ocurrió un error al consultar la categoria: " + ex.toString());
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return categoriaVo;
    }

    public boolean insert(CategoriaVO categoriaVo) {

        sql = "INSERT INTO categoria (nombre_categoria, descripcion_categoria, nombre_img_categoria) VALUES (?,?,?)";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoriaVo.getNombreCategoria());
            stmt.setString(2, categoriaVo.getDescripcionCategoria());
            stmt.setString(3, categoriaVo.getRutaImgCategoria());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar la categoria: " + ex.toString());
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }
    
    public boolean insertExcel(String values) {

        sql = "INSERT INTO categoria (nombre_categoria, descripcion_categoria, nombre_img_categoria) VALUES " + values;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, values);
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al insertar la categoria masiva: " + ex.toString());
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }
    
    public boolean update(CategoriaVO categoriaVo) {

        sql = "UPDATE categoria SET nombre_categoria = ?, descripcion_categoria = ?, nombre_img_categoria = ? WHERE id_categoria = ?";
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoriaVo.getNombreCategoria());
            stmt.setString(2, categoriaVo.getDescripcionCategoria());
            stmt.setString(3, categoriaVo.getRutaImgCategoria());
            stmt.setInt(4, categoriaVo.getIdCategoria());
            stmt.executeUpdate();
            
            operacionExitosa = true;
            
        } catch (SQLException ex) {
            operacionExitosa = false;
            System.out.println("Error al actualizar la categoria: " + ex.toString());
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return operacionExitosa;
    }
}
