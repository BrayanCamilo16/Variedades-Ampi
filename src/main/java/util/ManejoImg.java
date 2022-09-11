package util;

import java.io.*;
import java.nio.file.*;
import javax.servlet.http.Part;

/**
 *
 * @author Camargo
 */
public class ManejoImg {
    
    public static String saveFile(Part part, File pathUploads) {
        String[] extens = {".ico", ".png", ".jpg", ".jpeg"};
        String pathAbsolute = "";
        String fileName = "";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            fileName =  ManejoImg.nombreAleatorio(path.getFileName().toString(), extens);
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

    public static boolean isExtension(String fileName, String[] extensions) {
        for (String et : extensions) {
            if (fileName.toLowerCase().endsWith(et)) {
                return true;
            }
        }
        return false;
    }
    
    public static String nombreAleatorio(String nombreImg, String[] extensions) {
        String nombreRandom = "";
        String formatoImg = "";
        int num = (int) Math.floor(Math.random() * 999999999 + 1 );
        for (String et : extensions) {
            if (nombreImg.toLowerCase().endsWith(et)) {
                formatoImg = et;
                break;
            }else{
                formatoImg = ".png";
            }
        }
//        nombreRandom = String.valueOf(num) + nombreImg;
        nombreRandom = String.valueOf(num) + formatoImg;
        return nombreRandom;
    }
}
