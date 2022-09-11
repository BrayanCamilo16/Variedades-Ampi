package web;

import dao.CategoriaDAO;
import java.io.*;
import java.nio.file.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import util.ManejoImg;
import static util.ManejoImg.saveFile;
import util.Validacion;
import vo.CategoriaVO;

/**
 *
 * @author Camargo
 */
@MultipartConfig
@WebServlet(name = "CategoriaController", urlPatterns = {"/Categoria"})
public class CategoriaController extends HttpServlet {

    private CategoriaVO categoriaVo = new CategoriaVO();
    private CategoriaDAO categoriaDao = new CategoriaDAO();
    private String pathFiles = "C:\\variedades-ampi\\src\\main\\webapp\\files\\categoria\\";
    private File uploads = new File(pathFiles);
    private String[] extens = {".ico", ".png", ".jpg", ".jpeg"};

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idCategoria = request.getParameter("idCategoria");
        String nombreCategoria = request.getParameter("nombreCategoria");
        String descripcionCategoria = request.getParameter("descripcionCategoria");
        String nombreImg = request.getParameter("nombreImg");
        Part part = request.getPart("imgCategoria");
        int option = Integer.parseInt(request.getParameter("opcion"));

        switch (option) {
            case 1: // Consultar

                if (Validacion.isNullStr(idCategoria)) {
                    this.generarError(request, response, "Error al consultar la categoria", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente");
                } else {
                    this.consultarCategoria(request, response, Integer.parseInt(idCategoria));
                }

                break;
            case 2: // Insertar

                if (Validacion.isNullStr(nombreCategoria) || Validacion.isNullStr(descripcionCategoria)) {
                    this.generarError(request, response, "Error al insertar la categoria", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente");
                } else {
                    this.insertCategoria(request, response, nombreCategoria, descripcionCategoria, part);
                }

                break;
            case 3: // Actualizar
                if (Validacion.isNullStr(nombreCategoria) || Validacion.isNullStr(descripcionCategoria)) {
                    this.generarError(request, response, "Error al actualizar la categoria", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente");
                } else {
                    categoriaVo = new CategoriaVO(Integer.parseInt(idCategoria), nombreCategoria, descripcionCategoria, nombreImg);
                    this.updateCategoria(request, response, categoriaVo, part);
                }
                break;

            default:
                this.accionDefault(request, response);
                break;
        }

    }

    private void generarError(HttpServletRequest request, HttpServletResponse response, String tituloError, String descripcionError) throws ServletException, IOException {
        request.setAttribute("tituloError", tituloError);
        request.setAttribute("mensajeDescriptivo", descripcionError);
        request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
    }

    private void consultarCategoria(HttpServletRequest request, HttpServletResponse response, int idCategoria) throws ServletException, IOException {
        CategoriaVO categoria = categoriaDao.selectById(idCategoria);
        if (categoria != null) {
//            HttpSession sesion = request.getSession();
            request.setAttribute("categoria", categoria);
            request.getRequestDispatcher("WEB-INF/paginas/registrarCategoria.jsp").forward(request, response);
//            response.sendRedirect("admin/categorias.jsp");
        } else {
            this.generarError(request, response, "Error al consultar la categoria", "No se encontró la categoria");
        }
    }

    private void insertCategoria(HttpServletRequest request, HttpServletResponse response, String nombreCategoria, String descripcionCategoria, Part imgCategoria) throws ServletException, IOException {
        if (imgCategoria == null) {
            this.generarError(request, response, "Error al insertar la categoria", "No ha seleccionado la imagen de la categoria");
        } else {
            if (ManejoImg.isExtension(imgCategoria.getSubmittedFileName(), extens)) {
                String photo = saveFile(imgCategoria, uploads);
                categoriaVo = new CategoriaVO(nombreCategoria, descripcionCategoria, photo);

                if (categoriaDao.insert(categoriaVo)) {
                    request.setAttribute("tituloExito", "Categoria insertada");
                    request.setAttribute("mensajeDescriptivo", "La categoria se inserto correctamente");
                    request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
                } else {
                    this.generarError(request, response, "Error al registrar la categoria", "Ocurrió un error, por favor recarga e intenta nuevamente");
                }
            } else {
                String extensionImg = "";
                for (String ex : extens) {
                    extensionImg += ex + " ";
                }
                this.generarError(request, response, "Error al registrar la categoria", "Debe escoger una imagen con uno de los siguientes formatos: " + extensionImg);
            }
        }
    }

    private void updateCategoria(HttpServletRequest request, HttpServletResponse response, CategoriaVO catVo, Part imgCategoria) throws ServletException, IOException {

        if (ManejoImg.isExtension(imgCategoria.getSubmittedFileName(), extens)) {
            String nombreArchivoAntiguo = uploads + "\\" + catVo.getRutaImgCategoria();
            Path archivoAntiguo = Paths.get(nombreArchivoAntiguo);
            Files.deleteIfExists(archivoAntiguo);

            String urlImg = saveFile(imgCategoria, uploads);
            catVo.setRutaImgCategoria(urlImg);

            if (categoriaDao.update(catVo)) {
                request.setAttribute("tituloExito", "Categoria actualizada");
                request.setAttribute("mensajeDescriptivo", "La categoria se actualiz\u00F3 correctamente");
                request.getRequestDispatcher("admin/categorias.jsp").forward(request, response);
            } else {
                this.generarError(request, response, "Error al actualizar la categoria", "Ocurrió un error, por favor recarga e intenta nuevamente");
            }
        } else {
            this.generarError(request, response, "Error al actualizar la categoria", "Debe escoger una imagen");
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.accionDefault(request, response);
    }

}
