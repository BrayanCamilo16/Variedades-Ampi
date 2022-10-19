package util;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import javax.servlet.http.Part;
import vo.CategoriaVO;

/**
 *
 * @author Jhon Camargo
 * @version 1.0.0
 */
public class ManejoExcel {

    /**
     * Este método sirve para guardar el archivo en una ruta absoluta
     *
     * @param part, Archivo
     * @param pathUploads, Ruta absoluta
     * @return String, retorna el nombre del nuevo archivo
     */
    public static String saveFile(Part part, File pathUploads) {
        String[] extens = {".csv"};
        String pathAbsolute = "";
        String fileName = "";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            fileName = ManejoExcel.nombreAleatorio(path.getFileName().toString(), extens);
            InputStream input = part.getInputStream();

            if (input != null) {
                File file = new File(pathUploads, fileName);
                pathAbsolute = file.getAbsolutePath();
                Files.copy(input, file.toPath());
            }

        } catch (IOException e) {
            System.out.println("Ocurrió un error al guardar el archivo. Metodo: 'saveFile' : " + e.toString());
        }
        return fileName;
    }

    /**
     * Este metodo sirve para eliminar los archivos
     *
     * @param fileOld, nombre del archivo
     * @return boolean, retorna si se pudo eliminar o no el archivo
     */
    public static boolean deleteFile(Path fileOld) throws IOException {
        return Files.deleteIfExists(fileOld);
    }

    public static boolean isExtension(String fileName, String[] extensions) {
        for (String et : extensions) {
            if (fileName.toLowerCase().endsWith(et)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Este metodo sirve para generar un nombre aleatorio
     *
     * @param nombreImg, nombre del archivo
     * @param extensions, extensiones que puede tener el archivo
     * @return String, retorna un nombre aleatorio
     */
    public static String nombreAleatorio(String nombreImg, String[] extensions) {
        String nombreRandom = "";
        String formatoExcel = "";
        int num = (int) Math.floor(Math.random() * 999999999 + 1);
        for (String et : extensions) {
            if (nombreImg.toLowerCase().endsWith(et)) {
                formatoExcel = et;
                break;
            } else {
                formatoExcel = ".csv";
            }
        }
        nombreRandom = String.valueOf(num) + formatoExcel;
        return nombreRandom;
    }

    /**
     * Este método sirve para leer los archivos
     *
     * @param nameFile, nombre del archivo
     * @return List<Pelicula>, Retorna una lista de datos
     */
    public static List<String> leerArchivo(String nameFile) {
        List<String> totalCategorias = new ArrayList<>();
        String categorias = "";
        String categoriaVo = "";
        try {
            BufferedReader reader = new BufferedReader(new FileReader("C:\\variedades-ampi\\src\\main\\webapp\\files\\excel\\" + nameFile));
            String line = null;
            int contador = 0;
            while ((line = reader.readLine()) != null) {
                contador++;
                String[] parts = line.split(";");
                int totalParts = parts.length;
                for (int i = 0; i < totalParts; i++) {
                    if (i > 0) {
                        continue;
                    }
                    categoriaVo = "('" + parts[0] + "','" + parts[1] + "','" + parts[2] + "'),";
                    categorias += categoriaVo;
                }

                if (contador > 5000) {
                    categorias = categorias.substring(0, categorias.length() - 1);
                    totalCategorias.add(categorias);
                    categorias = "";
                    contador = 0;
                }

            }
            if (categorias.length() > 2 && contador > 0) {
                categorias = categorias.substring(0, categorias.length() - 1);
                totalCategorias.add(categorias);
            }
        } catch (IOException ex) {
            System.out.println("ex = " + ex.toString());
        }
        System.out.println("Total categorias: " + totalCategorias.size());
        return totalCategorias;
    }

}
