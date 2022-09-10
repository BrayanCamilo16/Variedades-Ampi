package dao;

import java.sql.SQLException;

/**
 *
 * @author Camargo
 */
public interface IUsuarioDAO {

    boolean insert() throws SQLException;

    boolean update() throws SQLException;

    boolean delect() throws SQLException;

    boolean select() throws SQLException;
}
