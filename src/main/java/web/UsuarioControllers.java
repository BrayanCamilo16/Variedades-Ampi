package web;

import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import vo.UsuarioVO;

/**
 *
 * @author Camargo
 */
@WebServlet(name = "UsuarioControllers", urlPatterns = {"/Usuario2"})
public class UsuarioControllers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("email").equals("") || request.getParameter("pass").equals("")) {
            request.setAttribute("tituloError", "Error en los datos");
            request.setAttribute("mensajeDescriptivo", "Ningún campo puede estar vacó, completelos e intente nuevamente");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            int action = Integer.parseInt(request.getParameter("action"));

            UsuarioDAO usuarioDao = new UsuarioDAO();

            UsuarioVO usuarioVo = null;

            switch (action) {
                case 1: // Login
                    usuarioVo = usuarioDao.login(email, pass);
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
                case 2: // Insert

                    break;
            }
        }
    }

}
