/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;
import org.springframework.security.crypto.bcrypt.BCrypt;

/**
 *
 * @author pc
 */
public class Password {

    /**
     * Este metodo encripta las contraseñas, utilizando spring security
     *
     * @param passwordNotEncript, password sin encriptar
     * @return String, devuelve la contraseña encriptada
     */
    public static String encript(String passwordNotEncript) {
        return BCrypt.hashpw(passwordNotEncript, BCrypt.gensalt());
    }

    /**
     * Este metodo verifica si una contraseña sin encriptar es la misma que una
     * contraseña encriptada, utilizando spring security
     *
     * @param passwordNotEncript, password sin encriptar
     * @param passwordEncript, password con encriptacion
     * @return boolean, retorna si una contraseña encriptada es igual a una que
     * no lo esta
     */
    public static boolean verifyPassword(String passwordNotEncript, String passwordEncript) {
        return BCrypt.checkpw(passwordNotEncript, passwordEncript);
    }
}
