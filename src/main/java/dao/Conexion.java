package dao;

import java.sql.*;
import java.util.logging.*;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author Camargo
 */
public class Conexion {
    
//    //Declarar variables
//    private String driver, userDB, passwordDB, dataBase, urlDB;
//
//    //Objeto de elemento conexion, es el que almacena la conexion 
//    private Connection conexion;
//
//    //Constructor.
//    public Conexion() {
//
//        // Asignar valores
//        driver = "com.mysql.cj.jdbc.Driver";
//        userDB = "root";
//        passwordDB = "";
//        dataBase = "variedades_ampi";
//        urlDB = "jdbc:mysql://localhost:3306/" + dataBase;
//
//        //Conectarse 
//        //El try es una forma de controlar errores 
//        try {
//
//            //Creando nueva instancia del driver
//            Class.forName(driver).newInstance();
//            conexion = DriverManager.getConnection(urlDB, userDB, passwordDB);
//            System.out.println("Conexión ok!");
//
//        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
//
//            System.out.println("Error al conectarse" + e.toString());
//        }
//    }
//
//    //Metodos tipo objeto ( para obtener la conexion y otro para cerrarla)
//    public Connection getConnection() {
//        return conexion;
//    }
//
//    public Connection close(){
//        try {
//            conexion.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        conexion = null;
//        return conexion;
//    }
//    public Connection close(Connection conn){
//        this.close();
//        try {
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        conexion = null;
//        return conexion;
//    }
//
//    public static void main(String[] args) {
//        new Conexion();
//    }
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/variedades_ampi?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    private static BasicDataSource dataSource;

    public static DataSource getDataSource() {
        if (dataSource == null) {
            dataSource = new BasicDataSource();
            dataSource.setUrl(JDBC_URL);
            dataSource.setUsername(JDBC_USER);
            dataSource.setPassword(JDBC_PASS);
            dataSource.setInitialSize(1);
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }

    public static void close(ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error al cerrar el ResultSet");
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void close(PreparedStatement stmt) {
        try {
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Error al cerrar el PreparedStatement");
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void close(Connection conn) {
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexion");
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
