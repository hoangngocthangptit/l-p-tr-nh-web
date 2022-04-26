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
import model.Email;
import model.Hash;

/**
 *
 * @author nghie
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/reset-pass"})
public class ResetPasswordController extends HttpServlet {

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
            out.println("<title>Servlet ResetPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordController at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("request");
        if (code != null) {
            Hash hash = new Hash();
            int id = hash.revertResetPasswordCode(code);
            if (id == 0) {
                response.sendRedirect("reset-pass?status=invalid");
                return;
            }
        }
        String status = request.getParameter("status");
        if (status != null) {
            switch (status) {
                case "send":
                    request.setAttribute("mess", "A new password was sent to your email. Please verify the password in 30 minutes!!");
                    break;
                case "fail":
                    request.setAttribute("mess", "Information not correct!!");
                    break;
                case "success":
                    request.setAttribute("mess", "Your new password is update successfully");
                    break;
                case "invalid":
                    request.setAttribute("mess", "The request is invalid (Time out) !!");
                    break;
                case "lack":
                    request.setAttribute("mess", "All the fields must be fill !!");
                    break;
                case "fail_1":
                    request.setAttribute("mess", "New password must be longer 8 character!!");
                    break;
                case "fail_2":
                    request.setAttribute("mess", "Confirm password not same new password!!");
                    break;
            }
        }
        try {
            Hash hash = new Hash();
            String newpass = request.getParameter("newpass");
            String confpass = request.getParameter("confpass");
            request.setAttribute("newpass", hash.hexToAscii(newpass));
            request.setAttribute("confpass", hash.hexToAscii(confpass));
        } catch (Exception e) {
        }
        request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        UserDAO u = new UserDAO();
        String status;
        if (email != null && username != null) {
            if (email.equals("") || username.equals("")) {
                status = "lack";
            } else {
                int id = u.checkToResetPassword(username, email);
                if (id > 0) {
                    status = "send";
                    Email mail = new Email();
                    Hash hash = new Hash();
                    mail.resetPasswordEmail(email, hash.resetPasswordCode(id));
                } else {
                    status = "fail";
                }
            }
            String fail = "";
            if (!status.equals("send")) {
                fail = "&email=" + email + "&username=" + username;
            }
            response.sendRedirect("reset-pass?status=" + status + fail);
            u.close();
            return;
        }
        String newpass = request.getParameter("newPassword");
        String confpass = request.getParameter("confPassword");
        String code = request.getParameter("request");
        if (newpass.length() < 8) {
            status = "fail_1";
        } else {
            if (!newpass.equals(confpass)) {
                status = "fail_2";
            } else {
                Hash hash = new Hash();
                int id = hash.revertResetPasswordCode(code);
                if (id == 0) {
                    response.sendRedirect("reset-pass?status=invalid");
                    u.close();
                    return;
                } else {
                    u.changePassword(id, hash.HashPassword(newpass));
                    status = "success";
                }
            }
        }
        if (status.equals("success")) {
            u.close();
            response.sendRedirect("reset-pass?status=success");
        } else {
            Hash hash = new Hash();
            u.close();
            response.sendRedirect("reset-pass?request=" + code + "&action=set&status=" + status + "&newpass=" + hash.asciiToHex(newpass) + "&confpass=" + hash.asciiToHex(confpass));
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
