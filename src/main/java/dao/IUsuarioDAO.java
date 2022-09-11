package dao;

import java.sql.SQLException;
import vo.UsuarioVO;

/**
 *
 * @author Camargo
 */
public interface IUsuarioDAO {

    boolean insert() throws SQLException;

    boolean update() throws SQLException;

    boolean Inactivar() throws SQLException;

    boolean select() throws SQLException;
}
