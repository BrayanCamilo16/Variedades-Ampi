/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
@WebServlet(name = "Recuperacion", urlPatterns = {"/Recuperacion"})
public class Recuperacion extends HttpServlet {
    
    private String servidor, puerto, usuario, clave;

    public void init() {
        ServletContext contex = getServletContext();
        servidor = contex.getInitParameter("servidor");
        puerto = contex.getInitParameter("puerto");
        usuario = contex.getInitParameter("usuario");
        clave = contex.getInitParameter("clave");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String direccion = request.getParameter("email");
        String asunto= "Recuperacion de Contraseña";
        UsuarioDAO USUDAO = new UsuarioDAO();
//        USUDAO.generarContraseña(0);
        USUDAO.generarNumeroAleatorio();
        String contenido ="Nueva Contraseña" + USUDAO;
        String resultado="";
        
        try {
            EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, direccion, asunto, contenido);
            resultado="El correo fue enviado exitosamente";
        } catch (MessagingException e) {
            resultado = "Error de envio " + e.getMessage();
            e.printStackTrace();
        }finally {
            request.setAttribute("resultado", resultado);
            getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
