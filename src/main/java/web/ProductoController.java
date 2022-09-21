package web;

import vo.PedidoVO;
import vo.DetallesPedidoVO;
import vo.UsuarioVO;
import vo.UsuarioPedidoVO;
import dao.ProductoDAO;
import dao.PedidoDAO;
import dao.UsuarioPedidoDAO;
import dao.DetallesPedidoDAO;
import util.*;
import java.io.*;
import java.util.*;
import java.nio.file.*;
import javax.servlet.*;
import vo.ProductoVO;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import static util.ManejoImg.saveFile;

/**
 *
 * @author Camargo
 */
@MultipartConfig
@WebServlet(name = "ProductoController", urlPatterns = {"/Producto"})
public class ProductoController extends HttpServlet {

    private ProductoVO productoVo = null;
    private ProductoDAO productoDao = new ProductoDAO();
    private final String pathFiles = "C:\\variedades-ampi\\src\\main\\webapp\\files\\producto\\";
    private File uploads = new File(pathFiles);
    private final String[] extens = {".ico", ".png", ".jpg", ".jpeg"};
//    private Set<Integer> idProductos = new HashSet();
    private List<Integer> idProductos = new ArrayList();
    private HttpSession sesion = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idProducto = request.getParameter("idProducto");
        String nombreProducto = request.getParameter("nombreProducto");
        String descripcionProducto = request.getParameter("descripcionProducto");
        String precioProducto = request.getParameter("precioProducto");
        String stockProducto = request.getParameter("stockProducto");
        String unidadMinimaProducto = request.getParameter("unidadMinimaProducto");
        String estadoProducto = request.getParameter("estadoProducto");
        String idCategoria = request.getParameter("idCategoria");
        String nombreImg = request.getParameter("nombreImg");
        String idMarca = "1";
        String direccion = request.getParameter("direccionEnvio");
        Part imgProducto = request.getPart("imgProducto");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        switch (opcion) {
            case 1: // Consultar
                if (Validacion.isNullStr(idProducto)) {
                    this.generarError(request, response, "Error al consultar el producto", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente", "admin/productos.jsp");
                } else {
                    this.consultarProducto(request, response, Integer.parseInt(idProducto));
                }
                break;
            case 2: // Insertar
                if (Validacion.isNullStr(nombreProducto) || Validacion.isNullStr(descripcionProducto) || Validacion.isNullStr(precioProducto) || Validacion.isNullStr(stockProducto) || Validacion.isNullStr(unidadMinimaProducto) || Validacion.isNullStr(estadoProducto) || Validacion.isNullStr(idCategoria) || Validacion.isNullStr(idMarca)) {
                    this.generarError(request, response, "Error al insertar el producto", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente", "admin/productos.jsp");
                } else {
                    productoVo = new ProductoVO(nombreProducto, descripcionProducto, Double.parseDouble(precioProducto), Double.parseDouble(stockProducto), Double.parseDouble(unidadMinimaProducto), "", estadoProducto, Integer.parseInt(idMarca), Integer.parseInt(idCategoria));
                    this.insertProducto(request, response, productoVo, imgProducto);
                }
                break;
            case 3: // Actualizar
                if (Validacion.isNullStr(nombreProducto) || Validacion.isNullStr(descripcionProducto) || Validacion.isNullStr(precioProducto) || Validacion.isNullStr(stockProducto) || Validacion.isNullStr(unidadMinimaProducto) || Validacion.isNullStr(estadoProducto) || Validacion.isNullStr(idCategoria) || Validacion.isNullStr(idMarca)) {
                    this.generarError(request, response, "Error al insertar el producto", "Debe proporcionar todos los datos solicitados, verifiquelos e intente nuevamente", "admin/productos.jsp");
                } else {
                    productoVo = new ProductoVO(Integer.parseInt(idProducto), nombreProducto, descripcionProducto, Double.parseDouble(precioProducto), Double.parseDouble(stockProducto), Double.parseDouble(unidadMinimaProducto), nombreImg, estadoProducto, Integer.parseInt(idMarca), Integer.parseInt(idCategoria));
                    this.actualizarProducto(request, response, productoVo, imgProducto);
                }
                break;
            case 4: // Agregar al producto
                if (Validacion.isNullStr(idProducto)) {
                    response.sendRedirect("cliente/");
                } else {
                    this.agregarAlCarrito(request, response, Integer.parseInt(idProducto));
                }
                break;
            case 5: // Registrar pedido
                sesion = request.getSession();
                if (sesion.getAttribute("productoCarrito") != null) {
                    List<ProductoVO> productosEnElCarrito = (List<ProductoVO>) sesion.getAttribute("productoCarrito");
                    System.out.println("productosEnElCarrito = " + productosEnElCarrito);

                    this.registrarProducto(request, response, productosEnElCarrito, direccion);

                } else {
                    request.setAttribute("tituloError", "No tiene productos en el carrito");
                    request.setAttribute("mensajeDescriptivo", "No tiene ningún producto agregado al carrito, agreguelos e intente nuevamente");
                    request.getRequestDispatcher("cliente/").forward(request, response);
                }
                break;
            default:
                this.accionDefault(request, response);
                break;
        }

    }

    private void insertProducto(HttpServletRequest request, HttpServletResponse response, ProductoVO productVo, Part imgProducto) throws ServletException, IOException {
        // Comprobamos que si la imagen es nula
        if (imgProducto == null) {
            this.generarError(request, response, "Error al insertar el producto", "No ha seleccionado la imagen del producto", "admin/productos.jsp");
        } else {
            // Comprobamos que la imagen tenga la extencion correcta (jpg, png, ...)
            if (ManejoImg.isExtension(imgProducto.getSubmittedFileName(), extens)) {
                // Obtenemos el nuevo nombre del archivo
                String photo = ManejoImg.saveFile(imgProducto, uploads);
                productVo.setNombreImgProducto(photo);

                // Insertamos el producto
                if (productoDao.insert(productoVo)) {
                    // Devolvemos mensaje respectivo
                    request.setAttribute("tituloExito", "Producto insertado");
                    request.setAttribute("mensajeDescriptivo", "El producto se insert\u00F3 correctamente");
                    request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
                } else {
                    // En caso de que no se haya podido registrar, mandamos un mensaje
                    this.generarError(request, response, "Error al insertar el producto", "Ocurrió un error, por favor recarga e intenta nuevamente", "admin/productos.jsp");
                }
            } else {
                // Devolvemos un error en caso de que el archivo no sea una imagen
                this.generarError(request, response, "Error al insertar el producto", "Debe escoger una imagen", "admin/productos.jsp");
            }
        }
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response, ProductoVO productVo, Part imgProducto) throws IOException, ServletException {
        if (ManejoImg.isExtension(imgProducto.getSubmittedFileName(), extens)) {
            String nombreArchivoAntiguo = uploads + "\\" + productVo.getNombreImgProducto();
            Path archivoAntiguo = Paths.get(nombreArchivoAntiguo);
            Files.deleteIfExists(archivoAntiguo);

            String urlImg = saveFile(imgProducto, uploads);
            productVo.setNombreImgProducto(urlImg);

            if (productoDao.update(productVo)) {
                request.setAttribute("tituloExito", "Producto actualizado");
                request.setAttribute("mensajeDescriptivo", "El producto se actualiz\u00F3 correctamente");
                request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
            } else {
                this.generarError(request, response, "Error al actualizar el producto", "Ocurrió un error, por favor recarga e intenta nuevamente", "admin/productos.jsp");
            }
        } else {
            this.generarError(request, response, "Error al actualizar el producto", "Debe escoger una imagen", "admin/productos.jsp");
        }
    }

    private void consultarProducto(HttpServletRequest request, HttpServletResponse response, int idProducto) throws ServletException, IOException {
        productoVo = productoDao.selectById(idProducto);
        if (productoVo != null) {
            request.setAttribute("producto", productoVo);
            request.getRequestDispatcher("WEB-INF/paginas/comunes/registrarProducto.jsp").forward(request, response);
        } else {
            this.generarError(request, response, "Error al consultar el producto", "No se encontró el producto", "admin/productos.jsp");
        }

    }

    private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        ProductoVO productVo = null;
        int posicion = 0;
        int cantidad = 0;

        // Alcance sesion
        HttpSession aplication = request.getSession();

        // Se obtienen los productos que ya esten en el carrito
        List<ProductoVO> productoEnElCarrito = (List<ProductoVO>) aplication.getAttribute("productoCarrito");

        // Comprobamos si hay producto en el carrito
        if (productoEnElCarrito == null) {
            productoEnElCarrito = new ArrayList<>();
        }

        idProductos.add(id);

        System.out.println(idProductos);

        if (productoEnElCarrito.size() > 0) {
            for (int i = 0; i < productoEnElCarrito.size(); i++) {
                if (id == productoEnElCarrito.get(i).getIdProducto()) {
                    posicion = i;
                }
            }
            if (id == productoEnElCarrito.get(posicion).getIdProducto()) {
                cantidad = productoEnElCarrito.get(posicion).getCantidad() + 1;
                productoEnElCarrito.get(posicion).setCantidad(cantidad);
            } else {
                productVo = productoDao.selectById(id);
                cantidad += 1;
                productVo.setCantidad(cantidad);
                productoEnElCarrito.add(productVo);

            }

        } else {
            productVo = productoDao.selectById(id);
            cantidad += 1;
            productVo.setCantidad(cantidad);
            productoEnElCarrito.add(productVo);
        }

        aplication.setAttribute("productoCarrito", productoEnElCarrito);
        response.sendRedirect("cliente/");
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    private void generarError(HttpServletRequest request, HttpServletResponse response, String tituloError, String descripcionError, String direccion) throws ServletException, IOException {
        request.setAttribute("tituloError", tituloError);
        request.setAttribute("mensajeDescriptivo", descripcionError);
        request.getRequestDispatcher(direccion).forward(request, response);
    }

    private void registrarProducto(HttpServletRequest request, HttpServletResponse response, List<ProductoVO> productosEnElCarrito, String direccion) throws ServletException, IOException {
        PedidoVO pedidoVo = new PedidoVO("22/08/13", "22/08/13", direccion, "Pendiente");
        DetallesPedidoVO detallesPedidoVO = null;
        UsuarioPedidoVO usuarioPedidoVo = null;
        PedidoDAO pedidoDao = new PedidoDAO();
        DetallesPedidoDAO detallesPedidoDAO = new DetallesPedidoDAO();
        UsuarioPedidoDAO usuarioPedidoDAO = new UsuarioPedidoDAO();

        sesion = request.getSession();

        UsuarioVO usuarioVo = (UsuarioVO) sesion.getAttribute("usuarioVo");
        int idUsuarioCliente = usuarioVo.getIdUsuario();

        for (ProductoVO productoVo : productosEnElCarrito) {
            int idPedido = pedidoDao.insert(pedidoVo);
            if (idPedido > 0) {
                detallesPedidoVO = new DetallesPedidoVO(String.valueOf(idPedido), String.valueOf(productoVo.getIdProducto()), productoVo.getPrecioUnitarioProducto(), productoVo.getCantidad());
                if (detallesPedidoDAO.insert(detallesPedidoVO)) {
                    usuarioPedidoVo = new UsuarioPedidoVO(0, idPedido, idUsuarioCliente, 1);
                    if (usuarioPedidoDAO.insert(usuarioPedidoVo)) {
                        request.setAttribute("tituloExito", "Pedido hecho");
                        request.setAttribute("mensajeDescriptivo", "El pedido se realizó correctamente, pronto estará listo");
                        request.getRequestDispatcher("cliente/").forward(request, response);
                    } else {
                        this.generarError(request, response, "Ocurrió un error", "No se pudo realizar el pedido", "cliente/");
                    }
                } else {
                }
            } else {
                this.generarError(request, response, "Ocurrió un error", "No se pudo realizar el pedido", "cliente/");
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.accionDefault(request, response);
    }
}
