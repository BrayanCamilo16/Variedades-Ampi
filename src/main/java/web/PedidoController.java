package web;

import dao.PedidoDAO;
import java.io.*;
import java.util.*;
import util.ManejoImg;
import util.Validacion;
import java.nio.file.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import static util.ManejoImg.saveFile;
import vo.PedidoVO;

/**
 *
 * @author Camargo
 */
@MultipartConfig
@WebServlet(name = "PedidoController", urlPatterns = {"/Pedido"})
public class PedidoController extends HttpServlet {

    private PedidoVO pedidoVo = null;
    private PedidoDAO pedidoDao = new PedidoDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        switch (opcion) {
            case 1: // Consultar
                if (Validacion.isNullStr(idPedido)) {
                    this.generarError(request, response, "Error al consultar el pedido", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente");
                } else {
                    this.consultarPedido(request, response, idPedido);
                }
                break;
            case 2: // Consultar detalles
                if (Validacion.isNullStr(idPedido)) {
                    this.generarError(request, response, "Error al mostrar detalles", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente");
                } else {
                    this.consultarDetalles(request, response, idPedido);
                }
                break;
            default:
                this.accionDefault(request, response);
                break;
        }

    }

    
    private void consultarPedido(HttpServletRequest request, HttpServletResponse response, int idPedido) throws ServletException, IOException {
        pedidoVo = pedidoDao.selectById(idPedido);
        if (pedidoVo != null) {
            request.setAttribute("pedido", pedidoVo);
            request.getRequestDispatcher("WEB-INF/paginas/comunes/registrarProducto.jsp").forward(request, response);
        } else {
            this.generarError(request, response, "Error al consultar el pedido", "No se encontró el pedido");
        }

    }
    
    private void consultarDetalles(HttpServletRequest request, HttpServletResponse response, int idPedido) throws ServletException, IOException {
        if (String.valueOf(idPedido) != null) {
            request.setAttribute("id_Pedido", idPedido);
            request.getRequestDispatcher("WEB-INF/paginas/comunes/detallesPedido.jsp").forward(request, response);
        } else {
            this.generarError(request, response, "Error al consultar los detalles", "No se encontró el pedido");
        }
    }
    
    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    private void generarError(HttpServletRequest request, HttpServletResponse response, String tituloError, String descripcionError) throws ServletException, IOException {
        request.setAttribute("tituloError", tituloError);
        request.setAttribute("mensajeDescriptivo", descripcionError);
        request.getRequestDispatcher("vendedor/pedidos.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.accionDefault(request, response);
    }

}
