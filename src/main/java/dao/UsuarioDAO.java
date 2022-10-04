package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.*;
import util.Conexion2;
import vo.UsuarioVO;
import org.springframework.security.crypto.bcrypt.BCrypt;
import util.Password;

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

    private String email = "", pass = "", nombre = "", apellido = "", TipoDocu = "", numDocu = "", telefono = "", direccion = "", sexo = "", rol = "";
    private boolean estado;
    private int usuId;
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
            rol = usuVO.getIdRol();
            TipoDocu = usuVO.getTipoDocumento();
        } catch (Exception e) {
            //traiga el log de la clase e imprima los errores
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean insert() {
        try {
//            String consulta = "select * usuario where email_usuario=?";
            conn = this.getConnection();
            sql = "insert into usuario(email_usuario, pass_usuario, nombre_usuario, apellido_usuario, num_documento_usuario, telefono_usuario, direccion_usuario, sexo_usuario, estado_usuario, id_rol_FK, id_tipo_doc_FK) values(?,?,?,?,?,?,?,?,?,?,?)";
            
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a insertar
            stmt.setString(1, email);
            stmt.setString(2, Password.encript(pass));
            stmt.setString(3, nombre);
            stmt.setString(4, apellido);
            stmt.setString(5, numDocu);
            stmt.setString(6, telefono);
            stmt.setString(7, direccion);
            stmt.setInt(8, Integer.parseInt(sexo));
            stmt.setBoolean(9, estado);
            stmt.setString(10, rol);
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

    public ArrayList<UsuarioVO> listar() {
        ArrayList<UsuarioVO> listarUsuarios = new ArrayList<>();
        try {
            String sexos = "";
            //String rol="";
            //int roll = Integer.toString("roll");
            conn = this.getConnection();
            sql = "SELECT u.id_usuario, u.email_usuario, u.pass_usuario, u.nombre_usuario, u.apellido_usuario, u.num_documento_usuario, u.telefono_usuario, u.direccion_usuario, u.sexo_usuario, u.estado_usuario, r.nombre_rol, t.nombre_tipo_doc FROM usuario as u INNER JOIN rol as r ON u.id_rol_FK=r.id_rol INNER JOIN tipo_doc as t ON u.id_tipo_doc_fk=t.id_tipo_doc ORDER BY u.id_usuario";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                if (rs.getString(9).equals("1")) {
                    sexos = "M";
                } else if (rs.getString(9).equals("2")) {
                    sexos = "F";
                } else if (rs.getString(9).equals("3")) {
                    sexos = "Otro";
                } else {
                    sexos = "Sexo Desconocido";
                }

                UsuarioVO usuVO = new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), sexos, rs.getBoolean(10), rs.getString(11), rs.getString(12));

                listarUsuarios.add(usuVO);

            }

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return listarUsuarios;
    }
//principals

    public UsuarioVO leerUsuarioPorID(String usuId) {
        UsuarioVO usus = new UsuarioVO();
        sql = "select * from usuario where id_usuario = ?";
        try {
            conn = this.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuId);
            rs = stmt.executeQuery();
            //esto reornara un boolean
            if (rs.next()) {
                usus.setIdUsuario(rs.getInt("id_usuario"));
                usus.setEmailUsuario(rs.getString("email_usuario"));
                usus.setPassUsuario(rs.getString("pass_usuario"));
                usus.setNombreUsuario(rs.getString("nombre_usuario"));
                usus.setApellidoUsuario(rs.getString("apellido_usuario"));
                usus.setNumDocumentoUsuario(rs.getString("num_documento_usuario"));
                usus.setTelefonoUsuario(rs.getString("telefono_usuario"));
                usus.setDireccionUsuario(rs.getString("direccion_usuario"));
                usus.setSexoUsuario(rs.getString("sexo_usuario"));
                usus.setEstadoUsuario(rs.getBoolean("estado_usuario"));
                usus.setIdRol(rs.getString("id_rol_FK"));
                usus.setTipoDocumento(rs.getString("id_tipo_doc_fk"));
            }
            this.close();
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
        return usus;
    }

    @Override
    public boolean update() {
        UsuarioVO usuario = null;
        try {
            sql = "update usuario set nombre_usuario=?, apellido_usuario=?, email_usuario=?, pass_usuario=?, num_documento_usuario=?, telefono_usuario=?, direccion_usuario=?, sexo_usuario=?, estado_usuario=?, id_rol_FK=?,  id_tipo_doc_FK=? where id_usuario=?";

            conn = this.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a modificar

            stmt.setString(1, nombre);
            stmt.setString(2, apellido);
            stmt.setString(3, email);
            stmt.setString(4, pass);
            stmt.setString(5, numDocu);
            stmt.setString(6, telefono);
            stmt.setString(7, direccion);
            stmt.setString(8, sexo);
            stmt.setBoolean(9, estado);
            stmt.setString(10, rol);
            stmt.setString(11, TipoDocu);
            stmt.setInt(12, usuId);
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

    public boolean updateAdministrador() {
        UsuarioVO usuario = null;
        try {
            sql = "update usuario set id_rol_FK=? where id_usuario=?";

            conn = this.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a modificar
            stmt.setString(1, rol);
            stmt.setInt(2, usuId);
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

    public UsuarioVO consultarNumeroDocumento(String numDocu) {
        UsuarioVO usuariovo = null;

        try {
            conn = this.getConnection();
            sql = "select * from usuario where num_documento_usuario=?";
            stmt = conn.prepareStatement(sql);
            //posicion
            stmt.setString(1, numDocu);
            rs = stmt.executeQuery();
            //si en el mensajero encuentra lo buscado
            while (rs.next()) {
                usuariovo = new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12));
            }
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return usuariovo;
    }

    @Override
    public boolean Inactivar() {
        try {
            sql = "update usuario set estado_usuario=false  where id_usuario=?";
            conn = this.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a eliminar, estos van en orden a la base de datos
            stmt.setInt(1, usuId);

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

    public boolean Activar() {
        try {
            sql = "update usuario set estado_usuario=true  where id_usuario=?";
            conn = this.getConnection();
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a eliminar, estos van en orden a la base de datos
            stmt.setInt(1, usuId);

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
    public boolean select() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public UsuarioVO login(String email, String pass) {
        UsuarioVO usuarioVo = null;

        sql = "SELECT * FROM usuario WHERE BINARY email_usuario = ?";
        try {
            conn = this.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                if (Password.verifyPassword(pass, rs.getString("pass_usuario"))) {
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
                    String idrol = rs.getString("id_rol_FK");

                    usuarioVo = new UsuarioVO(idUsuario, emailUsuario, passUsuario, nombreUsuario, apellidoUsuario, numDocumentoUsuario, telefonoUsuario, direccionUsuario, sexoUsuario, estadoUsuario, idrol);
                }
            }

        } catch (SQLException ex) {
            System.out.println("Error en el login");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.close();
        }

        return usuarioVo;
    }

//    public String generarContraseña(int longitud) {
//        String res = "";
//        for (int cont = 1; cont <= longitud; cont++) {
//            int num = (int) ((Math.random() * (('Z' - 'A') + 1)) + 'a');
//            char letra = (char) num;
//            res = res + letra;
//        }
//        return res;
//    }
    //recibe una id
    public UsuarioVO consultarId(int usuId) {
        //por si no encuentra el usuario retorne null
        UsuarioVO user = null;

        try {
            conn = this.getConnection();
            sql = "select * from usuario where id_usuario=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuId);
            rs = stmt.executeQuery();
            //si en el mensajero encuentra lo buscado
            while (rs.next()) {
                user = new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12));
            }
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return user;
    }

    public boolean signup() {
        try {
            conn = this.getConnection();
            sql = "insert into usuario(email_usuario, pass_usuario, nombre_usuario, apellido_usuario, sexo_usuario, estado_usuario, id_rol_FK, id_tipo_doc_FK) values(?,?,?,?,?,?,?,?)";
            //crear el puente, prepara lo que va a mandar
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a insertar
            stmt.setString(1, email);
            stmt.setString(2, Password.encript(pass));
            stmt.setString(3, nombre);
            stmt.setString(4, apellido);
            stmt.setInt(5, Integer.parseInt(sexo));
            stmt.setBoolean(6, estado);
            stmt.setString(7, rol);
            stmt.setString(8, TipoDocu);

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

    public boolean recoverPassword(String email, String pass) {
        try {
            sql = "update usuario set pass_usuario=? where email_usuario=?";
            conn = this.getConnection();
            stmt = conn.prepareStatement(sql);
            //por el puente manda los datos a modificar
            stmt.setString(1, Password.encript(pass));
            stmt.setString(2, email);
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

    public static String generarNumeroAleatorio() {
        Random random = new Random();
        int randomNumber = random.nextInt(999999);
        return String.valueOf(randomNumber);
    }

    public boolean RecibirEmail(String email) {
        //por defecto
        boolean existe = false;

        try {
            conn = this.getConnection();
            sql = "select * from usuario where email_usuario=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            //si en el mensajero encuentra lo buscado
            if (rs.next()) {
                existe = true;
            }
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.close();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return existe;
    }
}
