/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.UsuarioDAO;
import java.io.IOException;
import java.util.List;
import javax.mail.MessagingException;
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
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Inactivar");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            }
        } else {
            if (UsuaDAO.Activar()) {
                request.setAttribute("titleexito", "Usuario Activado Correctamente");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Activar");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
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
        String estadoUnico = "true";

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

            case 2: // insert del usuario cliente
                 {
                    usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo,
                            Boolean.parseBoolean(estadoUnico), rol, tipoDocu);
                    usuDAO = new UsuarioDAO(usuarioVo);
                    String resultado = "";
                    String asunto = "Bienvenido!";
                    String contenido = "Registro Existoso<br> <p style='background: yellow;'>" + nombre + " " + apellido + "</p>.Te acabas de registrar a Variedades Ampi <a href=\"http://localhost:8080/Variedades_Ampi/index.jsp\">Volver</a>";
                    //SI ESTO RETORNA UN VERDADERO RETORNA UN MENSAJE EXITO
                    try {
                        EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, email, asunto, contenido);
                        if (usuDAO.signup()) {
                            request.setAttribute("mensajeExito", "Señor(@)" + " "+ nombre + " " + "se ha registrado correctamente");
                        } else {
                            request.setAttribute("mensajeError", "NO se ha podido registrar");
                        }
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } catch (MessagingException e) {
                        resultado = "Error de envio " + e.getMessage();
                        e.printStackTrace();
                    }
                }
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

                    if (usuaaaVO.getIdRol().equals("1")) {
                        usuaaDAO.updateAdministrador();
                        request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
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
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
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
                            request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                        } else {
                            request.setAttribute("MensajeError", "El usuario no esta registrado");
                            request.getRequestDispatcher("vendedor/index.jsp").forward(request, response);
                        }
                    }

                } else {
                    request.setAttribute("mensajeerror", "No se encontro el parametro necesario");
                }

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
                UsuarioVO userVO = new UsuarioVO();
                UsuarioDAO userDAO = new UsuarioDAO();
                //CUANDO ES DIFERENTE A NULO ES QUE TIENE CONTENIDO 
                userVO = userDAO.leerUsuarioPorID(codigo);
                //CUANDO ES DIFERENTE A NULO ES QUE TIENE CONTENIDO
                if (userVO != null) {
                    request.setAttribute("userConsultado", userVO);
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "El usuario no se ha registrado");
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                }
                break;

            case 8:
                UsuarioDAO USUDAO = new UsuarioDAO();
                String direccion2 = request.getParameter("email");
                String asunto2 = "Recuperacion de Contraseña";
                HttpSession lasesion = request.getSession();
                String codigoVerificacion = USUDAO.generarNumeroAleatorio();
                lasesion.setAttribute("emailActualizar", direccion2);
                lasesion.setAttribute("codigoVerificacion", codigoVerificacion);

                String contenido2 = "Su Codigo de Verificacion es" + codigoVerificacion + "asegurese de suministrarlo  bien";
                String resultado = "";

                if (USUDAO.RecibirEmail(direccion2)) {
                    try {
                        EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, direccion2, asunto2, contenido2);
                        request.setAttribute("MensajeEnviado", "true");
                        request.setAttribute("mensajeExito", "Porfavor mire el correo que suministro, el codigo de verificacion fue enviado.");
                        request.getRequestDispatcher("Recuperar.jsp").forward(request, response);

                    } catch (MessagingException e) {
                        e.printStackTrace();
                        request.setAttribute("mensajeError", "El codigo no se pudo enviar");
                        request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("mensajeError", "El correo no existe");
                    request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                }

                break;

            case 9://en este caso estamos comprobando que el codigo enviaado al correo sea correcto
                HttpSession obtener = request.getSession();
                String direcc = request.getParameter("codigoVerificacion");
                String codigoV = (String) obtener.getAttribute("codigoVerificacion");

                if (direcc.equals(codigoV)) {
//                    UsuarioDAO uusDAO = new UsuarioDAO();
                    request.setAttribute("mensajeExito", "Porfavor suministra la nueva contraseña");
                    request.getRequestDispatcher("Password.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El codigo no coincide con el enviado");
                    request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                }
                break;

            case 10:
                UsuarioDAO DAO = new UsuarioDAO();
                HttpSession obtenerr = request.getSession();
                String mail = (String) obtenerr.getAttribute("emailActualizar");
                String passs = request.getParameter("pass");
                if (DAO.recoverPassword(mail, passs)) {
                    request.setAttribute("mensajeExito", "Tu contrase&ntilde;a se ha recuperado.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "Tu contrase&ntilde;a NO se´pudo recuperar.");
                    request.getRequestDispatcher("Password.jsp").forward(request, response);

                }
                break;
                
                case 11: // insert para cuando el administrador crea un usuario
                 {
                    usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo,
                            Boolean.parseBoolean(estadoUnico), rol2, tipoDocu);
                    usuDAO = new UsuarioDAO(usuarioVo);
                    String resultadoo = "";
                    String nuevorol= " ";
                    String asunto3 = "Bienvenido!";
                     if (rol2.equals("1")) {
                         nuevorol="Administrador";
                     }else if(rol2.equals("2")){
                         nuevorol="Vendedor";
                     }else{
                         nuevorol="desconocido";
                     }
                    String contenido3 = "Hola" + " " + nombre + " " + apellido + "<br>Te han registrado como"+ " " + nuevorol + " "+ "Disfruta <a href=\"http://localhost:8080/Variedades_Ampi/index.jsp\">Variedades Ampi</a>";
                    //SI ESTO RETORNA UN VERDADERO RETORNA UN MENSAJE EXITO
                    HttpSession obtenerSesion = request.getSession();
                    try {
                        EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, email, asunto3, contenido3);
                        if (usuDAO.insert()) {
                            obtenerSesion.setAttribute("mensajeExitoo", "El usuario se registro correctamente");
                            response.sendRedirect("admin/usuarios.jsp");
                        } else {
                            obtenerSesion.setAttribute("mensajeErroro", "El usuario no se registro correctamente");
                            response.sendRedirect("admin/usuarios.jsp");
                        }
                        
                    } catch (MessagingException e) {
                        resultadoo = "Error de envio " + e.getMessage();
                        e.printStackTrace();
                    }
                }
                break;
        }

    }
}
