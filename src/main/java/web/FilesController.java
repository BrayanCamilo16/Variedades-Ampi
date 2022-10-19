package web;

import dao.CategoriaDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import util.ManejoExcel;
import vo.CategoriaVO;

/**
 * Esta clase se encargara de manejar los archivos y generar inserciones masivamente
 *
 * @author Jhon Camargo
 * @version 1.0.0
 */
@MultipartConfig
@WebServlet(name = "FilesController", urlPatterns = {"/Files"})
public class FilesController extends HttpServlet {

    private final String pathFiles = "C:\\variedades-ampi\\src\\main\\webapp\\files\\excel\\";
    private File uploads = new File(pathFiles);
    private final String[] extens = {".csv"};
    private CategoriaDAO categoriaDao = new CategoriaDAO();
    private CategoriaVO categoriaVo = null;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int option = Integer.parseInt(request.getParameter("option"));
        Part excelCsv = request.getPart("excel");

        switch (option) {
            case 1: // Insertar categorias
                this.insert(request, response, excelCsv);
                break;
            default:
                throw new AssertionError();
        }

    }

    private void insert(HttpServletRequest request, HttpServletResponse response, Part excelCsv) throws IOException {
        try ( PrintWriter out = response.getWriter()) {
            if (excelCsv != null) {
                if (ManejoExcel.isExtension(excelCsv.getSubmittedFileName(), extens)) {
                    // Nuevo nombre al archivo
                    String nameFile = ManejoExcel.saveFile(excelCsv, uploads);

                    String mensajeOperacion = "Error al insertar los archivos";

                    List<String> listaStr = ManejoExcel.leerArchivo(nameFile);
                    String lista;
                    for (int i = 0; i < listaStr.size(); i++) {
                        if (categoriaDao.insertExcel(listaStr.get(i))) {
                            mensajeOperacion = "Registro exitoso";
                        }
                    }

                    out.print(mensajeOperacion);
                    out.print("<script>Swal.fire('Insercion exitosa', 'Los datos el archivo fueron insertados en la base de datos', 'success');</script>");
                    String nameFileOld = uploads + "\\" + nameFile;
                    Path fileOld = Paths.get(nameFileOld);
                    ManejoExcel.deleteFile(fileOld);
                } else {
                    out.print("Por favor ingrese un archivo valido");
                }
            }
        }
    }

}
