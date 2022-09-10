package dao;

import java.sql.*;
import java.util.logging.*;
import util.Conexion2;
import vo.UsuarioVO;

/**
 *
 * @author Camargo
 */
public class UsuarioDAO extends Conexion2 implements IUsuarioDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    private String sql;
    boolean operacionExitosa = false;

    public UsuarioDAO() {
    }

    private String email = "", pass = "", nombre = "", apellido = "", TipoDocu = "", numDocu = "", telefono = "", direccion = "", sexo = "";
    private boolean estado;
    private int usuId, idRol;
//metodo constructor para recibir datos del VO

    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        //conectarse a la base de datos
        try {
            conn = this.getConnection();
            //traer al DAO los datos del VO para hacer la operacion y los trae de forma segura
            usuId = usuVO.getIdUsuario();
            email = usuVO.getEmailUsuario();
            pass = usuVO.getPassUsuario();
            nombre = usuVO.getNombreUsuario();
            apellido = usuVO.getApellidoUsuario();
            numDocu = usuVO.getNumDocumentoUsuario();
            telefono = usuVO.getTelefonoUsuario();
            direccion = usuVO.getDireccionUsuario();
            sexo = usuVO.getSexoUsuario();
            estado = usuVO.isEstadoUsuario();
            idRol = usuVO.getIdRol();
            TipoDocu = usuVO.getTipoDocumento();
        } catch (Exception e) {
            //traiga el log de la clase e imprima los errores
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean insert() {
        try {
            sql = "insert into usuario(email_usuario, pass_usuario, nombre_usuario, apellido_usuario, num_documento_usuario, telefono_usuario, direccion_usuario, sexo_usuario, estado_usuario, id_rol_FK, id_tipo_doc_FK) values(?,?,?,?,?,?,?,?,?,?,?)";

            conn = this.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a insertar
            stmt.setString(1, email);
            stmt.setString(2, pass);
            stmt.setString(3, nombre);
            stmt.setString(4, apellido);
            stmt.setString(5, numDocu);
            stmt.setString(6, telefono);
            stmt.setString(7, direccion);
            stmt.setInt(8, Integer.parseInt(sexo));
            stmt.setBoolean(9, estado);
            stmt.setInt(10, idRol);
            stmt.setString(11, TipoDocu);

            stmt.executeUpdate();

            operacionExitosa = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } //
        finally {
            try {
                this.close();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacionExitosa;
    }

    @Override
    public boolean update() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delect() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean select() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public UsuarioVO login(String email, String pass) {
        UsuarioVO usuarioVo = null;

        sql = "SELECT * FROM usuario WHERE BINARY email_usuario = ? AND BINARY pass_usuario = ?";
        try {
            conn = this.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, pass);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int idUsuario = rs.getInt("id_usuario");
                String emailUsuario = rs.getString("email_usuario");
                String passUsuario = rs.getString("pass_usuario");
                String nombreUsuario = rs.getString("nombre_usuario");
                String apellidoUsuario = rs.getString("apellido_usuario");
                String numDocumentoUsuario = rs.getString("num_documento_usuario");
                String telefonoUsuario = rs.getString("telefono_usuario");
                String direccionUsuario = rs.getString("direccion_usuario");
                String sexoUsuario = rs.getString("sexo_usuario");
                boolean estadoUsuario = rs.getBoolean("estado_usuario");
                int idRol = rs.getInt("id_rol_FK");

                usuarioVo = new UsuarioVO(idUsuario, emailUsuario, passUsuario, nombreUsuario, apellidoUsuario, numDocumentoUsuario, telefonoUsuario, direccionUsuario, sexoUsuario, estadoUsuario, idRol);
            }

        } catch (SQLException ex) {
            System.out.println("Error en el login");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.close();
        }

        return usuarioVo;
    }
}
