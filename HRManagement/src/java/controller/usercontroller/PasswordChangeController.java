/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.usercontroller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hash;
import model.User;

/**
 *
 * @author nghie
 */
@WebServlet(name = "PasswordChangeController", urlPatterns = {"/change-pass"})
public class PasswordChangeController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PasswordChangeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordChangeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        String status = request.getParameter("status");
        if (status != null) {
            switch (status) {
                case "success":
                    request.setAttribute("mess", "Password changed successfully");
                    break;
                case "fail_1":
                    request.setAttribute("mess", "Confirm password not same new password!!");
                    break;
                case "fail_2":
                    request.setAttribute("mess", "New password must be longer 8 character!!");
                    break;
                case "fail_3":
                    request.setAttribute("mess", "Password not correct!!");
                    break;
            }
            if (status.contains("fail")) {
                String fail = request.getParameter("fail");
                String[] part = fail.split(",");
                Hash hash = new Hash();
                if (part.length > 0) {
                    request.setAttribute("oldpass", hash.hexToAscii(part[0]));
                    if (part.length > 1) {
                        request.setAttribute("newpass", hash.hexToAscii(part[1]));
                        if (part.length > 2) {
                            request.setAttribute("confpass", hash.hexToAscii(part[2]));
                        }
                    }
                }

            }
        }
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        int id = user.getId();
        String status = "success";
        Hash hash = new Hash();
        String oldPass = hash.HashPassword(request.getParameter("oldPassword"));
        String newPass = request.getParameter("newPassword");
        String confPass = request.getParameter("confPassword");
        UserDAO u = new UserDAO();
        if (u.checkToChangePassword(id, oldPass)) {
            if (newPass.length() >= 8) {
                if (newPass.equals(confPass)) {
                    u.changePassword(id, hash.HashPassword(newPass));
                } else {
                    status = "fail_1";
                }
            } else {
                status = "fail_2";
            }
        } else {
            status = "fail_3";
        }
        String fail = "";
        if (status.contains("fail")) {
            fail = "&fail=" + hash.asciiToHex(hash.RevertPassword(oldPass)) + "," + hash.asciiToHex(newPass) + "," + hash.asciiToHex(confPass);
        }
        u.close();
        response.sendRedirect("change-pass?status=" + status + fail);
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
