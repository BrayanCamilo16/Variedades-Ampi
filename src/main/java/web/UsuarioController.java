/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.UsuarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import vo.UsuarioVO;

/**
 *
 * @author SENA
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioController extends HttpServlet {

    private String servidor, puerto, usuario, clave;

    public void init() {
        ServletContext contex = getServletContext();
        servidor = contex.getInitParameter("servidor");
        puerto = contex.getInitParameter("puerto");
        usuario = contex.getInitParameter("usuario");
        clave = contex.getInitParameter("clave");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigoId = request.getParameter("codigoId");
        String action = request.getParameter("action");
        UsuarioVO UsuVO = new UsuarioVO(Integer.parseInt(codigoId), Boolean.valueOf(action));
        UsuarioDAO UsuaDAO = new UsuarioDAO(UsuVO);
        if (request.getParameter("action").equals("true")) {
            if (UsuaDAO.Inactivar()) {
                String redirigirA = "";
                request.setAttribute("titleexito", "Usuario Inactivado Correctamente");
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Inactivar");
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            }
        } else {
            if (UsuaDAO.Activar()) {
                request.setAttribute("titleexito", "Usuario Activado Correctamente");
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Activar");
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            }

        }

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
        String codigo = (request.getParameter("codigo"));
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String tipoDocu = request.getParameter("tipoDocu");
        String numDocu = request.getParameter("numDocu");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");
        String rol2 = request.getParameter("rol");
        String rol = "3";
        String estadoCliente = "true";

        int action = Integer.parseInt(request.getParameter("action"));

        UsuarioVO usuarioVo = null;

        UsuarioDAO usuDAO = new UsuarioDAO();

        switch (action) {
            case 1: // Login
                if (request.getParameter("email").equals("") || request.getParameter("pass").equals("")) {
                    request.setAttribute("tituloError", "Error en los datos");
                    request.setAttribute("mensajeDescriptivo",
                            "Ningún campo puede estar vacío, completelos e intente nuevamente");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    usuarioVo = usuDAO.login(email, pass);
                    if (usuarioVo != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("usuarioVo", usuarioVo);
                        if (usuarioVo.isEstadoUsuario() == true) {
                            response.sendRedirect("menu.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                            request.setAttribute("MensajeErrorrr", "Tu estado actual esta INACTIVO");
                        }

                    } else {
                        request.setAttribute("tituloError", "Error al iniciar sesion");
                        request.setAttribute("mensajeDescriptivo",
                                "Las credenciales suministradas son err\u00f3neas, corr\u00EDjalas e intente nuevamente");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
                break;

            case 2: // insert
                HttpSession sesion = request.getSession();
                if (sesion.getAttribute("usuarioVo") != null) {
                    UsuarioVO usuarioVO = (UsuarioVO) sesion.getAttribute("usuarioVo");
                    String idRol = usuarioVO.getIdRol();

                    if (idRol.equals(1)) {
                        rol = request.getParameter("idRol");
                    }
                }
                 {
                    usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo,
                            Boolean.parseBoolean(estadoCliente), rol, tipoDocu);
                    usuDAO = new UsuarioDAO(usuarioVo);
                    if (usuDAO.insert()) {
                        request.setAttribute("mensajeExito", "El usuario se registro correctamente");
                    } else {
                        request.setAttribute("mensajeError", "El usuario no se registro correctamente");
                    }
                }

                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case 3: // update
                UsuarioVO usuaVO = new UsuarioVO();
                UsuarioDAO usuaDAO = new UsuarioDAO();

                if (!request.getParameter("codigoId").equals("")
                        && !request.getParameter("rol").equals("")) {
                    usuaVO = new UsuarioVO(Integer.parseInt(request.getParameter("codigoId")),
                            request.getParameter("email"), request.getParameter("pass"),
                            request.getParameter("nombre"), request.getParameter("apellido"),
                            request.getParameter("numDocu"), request.getParameter("telefono"),
                            request.getParameter("direccion"), request.getParameter("sexo"), true,
                            request.getParameter("rol"), request.getParameter("tipoDocu"));

                    HttpSession sessioon = request.getSession();
                    UsuarioVO usuaaaVO = (UsuarioVO) sessioon.getAttribute("usuarioVo");
                    UsuarioDAO usuaaDAO = new UsuarioDAO(usuaVO);

                    if (usuaaDAO.updateAdministrador()) {
                        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                        request.setAttribute("mensajeExito", "Tus datos se modificaron correctamente");
                    } else if (usuaaDAO.update()) {
                        request.getRequestDispatcher("vendedor/ActualizarPerfilE.jsp").forward(request, response);
                        request.setAttribute("mensajeExito", "Tus datos se modificaron correctamente");
                    } else {
                        request.setAttribute("mensajeError", "Los datos no se modificaron");
                    }
                } else {
                    request.setAttribute("mensajeActualzar", "Tus datos son nulos");
                    System.out.println("Los datos son nulos");
                    request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                }
                break;

            case 4: // leer por id del usuario
                UsuarioVO ususVO = new UsuarioVO();
                UsuarioDAO ususDAO = new UsuarioDAO();

                if (request.getParameter("codigoId") != null) {
                    ususVO = ususDAO.leerUsuarioPorID(request.getParameter("codigoId"));

                    request.setAttribute("UsuarioConsultado", ususVO);
                    HttpSession session = request.getSession();
                    UsuarioVO ususuuVO = (UsuarioVO) session.getAttribute("usuarioVo");

                    if (ususVO != null) {

                        if (ususuuVO.getIdRol().equals(1)) {
                            request.getRequestDispatcher("admin/updateUser.jsp").forward(request, response);
                        } else {
                            request.getRequestDispatcher("vendedor/ActualizarPerfilE.jsp").forward(request, response);
                        }

                    } else {
                        if (ususuuVO.getIdRol().equals(1)) {
                            request.setAttribute("MensajeError", "El usuario no esta registrado");
                            request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                        } else {
                            request.setAttribute("MensajeError", "El usuario no esta registrado");
                            request.getRequestDispatcher("vendedor/index.jsp").forward(request, response);
                        }
                    }

                } else {
                    request.setAttribute("mensajeerror", "No se encontro el parametro necesario");
                }

                break;

            case 5: // eliminar o cambiar estado usuario
                UsuarioDAO DAO = null;
                UsuarioVO VO = new UsuarioVO();
                // try {
                if (request.getParameter("cambiar") != null) {
                    if (request.getParameter("cambiar").equals("false")) {
                        VO.setEstadoUsuario(true);
                    } else {
                        VO.setEstadoUsuario(false);
                    }
                }

                if (request.getParameter("codigoId") != null) {
                    System.out.println(request.getParameter("codigoId"));
                    request.setAttribute("Usuarioc", VO);
                    VO.setIdUsuario(Integer.parseInt(request.getParameter("codigoId")));
                    DAO = new UsuarioDAO(VO);
                    if (DAO.Inactivar()) {
                        request.setAttribute("MensajeExito", "El usuario se inactivo correcctamente");
                    } else {
                        request.setAttribute("MensajeError", "El usuario NO se inactivo");
                    }
                    if (DAO.Activar()) {
                        request.setAttribute("MensajeExito", "El usuario se activo correcctamente");
                    } else {
                        request.setAttribute("MensajeError", "El usuario NO se activo");
                    }
                } else {
                    request.setAttribute("MensajeError", "No se obtuvo el ID del usuario");
                }

                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                // } catch (Exception e) {
                // }
                break;

            case 6:
                usuarioVo = usuDAO.consultarNumeroDocumento(numDocu);
                // CUANDO ES DIFERENTE A NULO ES QUE TIENE CONTENIDO
                if (usuarioVo != null) {
                    request.setAttribute("consultado", usuarioVo);

                    request.setAttribute("FuncionEmail", usuarioVo.getEmailUsuario());
                    request.setAttribute("FuncionPassword", usuarioVo.getPassUsuario());
                    request.setAttribute("FuncionNombre", usuarioVo.getNombreUsuario());
                    request.setAttribute("FuncionApellido", usuarioVo.getApellidoUsuario());
                    request.setAttribute("FuncionDocumento", usuarioVo.getNumDocumentoUsuario());
                    request.setAttribute("FuncionTelefono", usuarioVo.getTelefonoUsuario());
                    request.setAttribute("FuncionDireccion", usuarioVo.getDireccionUsuario());
                    request.setAttribute("FuncionSexo", usuarioVo.getSexoUsuario());
                    request.setAttribute("FuncionEstado", usuarioVo.isEstadoUsuario());
                    request.setAttribute("FuncionRol", usuarioVo.getIdRol());
                    request.setAttribute("FuncionTipoDocu", usuarioVo.getTipoDocumento());

                    request.getRequestDispatcher("admin/VerDatosUsuario.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "El usuario NO esta en la lista");
                    request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                }
                break;

            case 7:
                UsuarioDAO uusuaDAO = new UsuarioDAO();
                List<UsuarioVO> uuusuaVO = null;
                try {
                    uuusuaVO = uusuaDAO.listar();
                    request.setAttribute("listarusuarios", uuusuaVO);
                } catch (Exception e) {
                    request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
                } finally {
                    uusuaDAO = null;
                }
                try {
                    this.getServletConfig().getServletContext().getRequestDispatcher("admin/index.jsp").forward(request,
                            response);
                } catch (Exception ex) {
                    request.setAttribute("msje", "No se pudo realizar la peticion" + ex.getMessage());
                }

                break;

        }

    }
}
