/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.usercontroller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ZenBook
 */
@WebServlet(name = "UserRegisterController", urlPatterns = {"/user-register"})
public class UserRegisterController extends HttpServlet {

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
        if (request.getParameter("verified") != null) {
            UserDAO u = new UserDAO();
            String code = (request.getParameter("verified"));
            int id = u.checkToVerifyAccount(code);
            if (id > 0) {
                u.verifyUserById(id);
                u.close();
                response.sendRedirect("login");
            } else {
                u.close();
                response.sendRedirect("user-register");
            }
        } else {
            request.getRequestDispatcher("user_register.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        try {
        String firstname = request.getParameter("first");
        String middlename = request.getParameter("middle");
        String lastname = request.getParameter("last");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        int count = 0;
        UserDAO userDAO = new UserDAO();
        if (userDAO.emailExist(email) != null) {
            count++;
            request.setAttribute("emailErr", "Email has been used!");
        }

        if (userDAO.usernameExist(username) != null) {
            count++;
            request.setAttribute("usernameErr", "Username has been existed!");
        }

        if (userDAO.mobileExist(mobile) != null) {
            count++;
            request.setAttribute("mobileErr", "Mobile has been used!");
        }

        if (count > 0) {
            request.getRequestDispatcher("user_register.jsp").forward(request, response);
        } else {
            userDAO.register(firstname, middlename, lastname, email, mobile, gender, username, password);
            response.sendRedirect("home");
        }} catch(Exception e) {
            response.sendRedirect("user-register");
        }
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
