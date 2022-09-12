/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import vo.UsuarioVO;

/**
 *
 * @author SENA
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

    
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
        String rol = request.getParameter("idRol");

        int action = Integer.parseInt(request.getParameter("action"));

        UsuarioVO usuarioVo = null;
        
        UsuarioDAO usuDAO = new UsuarioDAO();
        
        
        if (request.getParameter("email").equals("") || request.getParameter("pass").equals("")) {
            request.setAttribute("tituloError", "Error en los datos");
            request.setAttribute("mensajeDescriptivo", "Ningún campo puede estar vacío, completelos e intente nuevamente");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {

            
            switch (action) {
                case 1: // Login
                    usuarioVo = usuDAO.login(email, pass);
                    if (usuarioVo != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("usuarioVo", usuarioVo);
                        response.sendRedirect("menu.jsp");
                    } else {
                        request.setAttribute("tituloError", "Error al iniciar sesion");
                        request.setAttribute("mensajeDescriptivo", "Las credenciales suministradas son err\u00f3neas, corr\u00EDjalas e intente nuevamente");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    break;

                case 2: {
                    usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo, Boolean.parseBoolean(estado),rol, tipoDocu);
                    usuDAO = new UsuarioDAO(usuarioVo);
                    if(usuDAO.insert()){
                request.setAttribute("mensajeExito", "El usuario se registro correctamente");
                    }else{
                        request.setAttribute("mensajeError", "El usuario no se registro correctamente");
                    }
                }
                request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;

            }

        }
    }

}
