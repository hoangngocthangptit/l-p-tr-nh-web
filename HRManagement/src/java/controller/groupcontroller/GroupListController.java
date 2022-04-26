/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.groupcontroller;

import dao.GroupDAO;
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
import model.Group;
import model.User;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "GroupListController", urlPatterns = {"/grouplist"})
public class GroupListController extends HttpServlet {

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
            out.println("<title>Servlet SearchFilterGroupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchFilterGroupController at " + request.getContextPath() + "</h1>");
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
                response.sendRedirect("home");
                return;
            }

            if (!p.getRole().equals("HR")) {
                response.sendRedirect("home");
            } else {
                String str = request.getParameter("str");
                String parent_gr_code = request.getParameter("parent_group");
                String gr_type = request.getParameter("gr_type");
                String status = request.getParameter("status");

                GroupDAO grdb = new GroupDAO();
                
                List<Group> listParentGroup = grdb.getAllGroups();
                List<Group> list = grdb.searchGroupByOption(str, parent_gr_code, gr_type, status);

                request.setAttribute("listParentGroup", listParentGroup);
                request.setAttribute("parent_gr_code", parent_gr_code);
                request.setAttribute("gr_type", gr_type);
                request.setAttribute("status", status);
                request.setAttribute("str", str);
                request.setAttribute("data", list);
                grdb.close();
                request.getRequestDispatcher("grouplist.jsp").forward(request, response);
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
