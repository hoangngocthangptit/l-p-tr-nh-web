/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.usercontroller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "UserListController", urlPatterns = {"/userlist"})
public class UserListController extends HttpServlet {

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
            out.println("<title>Servlet UserListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserListController at " + request.getContextPath() + "</h1>");
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
        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();

            User p = (User) session.getAttribute("user");
            if (p == null) {
                response.sendRedirect("login");
                return;
            }

            if (!p.getRole().equals("Manager") && !p.getRole().equals("HR")) {
                response.sendRedirect("home");

            } else {
                UserDAO udb = new UserDAO();
                List<User> list = new ArrayList<>();
                String str = request.getParameter("string");
                String op = request.getParameter("option");

                String gr_code = request.getParameter("gr_code");

                String status = request.getParameter("status");
                String gender = request.getParameter("gender");

                if (p.getRole().equals("Manager")) {
                    list = udb.searchByOption(op, str, p.getId(), gr_code, gender, status);
                }
                if (p.getRole().equals("HR")) {
                    list = udb.getAllUserInfo(op, str, p.getId(), gr_code, gender, status);
                }

                request.setAttribute("data", list);

                request.setAttribute("string", str);
                request.setAttribute("option", op);
                request.setAttribute("gr_code", gr_code);
                request.setAttribute("status", status);
                request.setAttribute("gender", gender);
                udb.close();
                request.getRequestDispatcher("userlist.jsp").forward(request, response);
            }

        } catch (IOException | NumberFormatException | ServletException e) {
            response.sendRedirect("home");
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
        String id_raw = request.getParameter("id");
        String status = request.getParameter("status");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (Exception e) {
        }
        UserDAO udb = new UserDAO();
        udb.updateStatus(id, status);

        response.sendRedirect("userlist");
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
