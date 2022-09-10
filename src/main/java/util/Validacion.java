package util;

/**
 *
 * @author Camargo
 */
public class Validacion {

    public static boolean isNullStr(Object dato) {
        return dato.equals("");
    }

    public static void main(String[] args) {
        String nombreCategoria = "Hola";
        System.out.println(Validacion.isNullStr(nombreCategoria));    }
}
