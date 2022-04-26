/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.supporttypecontroller;

import dao.GroupDAO;
import dao.SupportTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Group;
import model.SupportType;
import model.User;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "AddSupportTypeController", urlPatterns = {"/addsupporttype"})
public class AddSupportTypeController extends HttpServlet {

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
            out.println("<title>Servlet AddSupportTypeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSupportTypeController at " + request.getContextPath() + "</h1>");
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

            if (!p.getRole().equals("Admin")) {
                response.sendRedirect("home");
                return;
            }
            GroupDAO grdb = new GroupDAO();
            List<Group> groups = grdb.getAllBAGroups();
            request.setAttribute("groups", groups);
            request.setAttribute("status", "active");
            grdb.close();
            request.getRequestDispatcher("addsupporttype.jsp").forward(request, response);
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
        try {
//            request.setCharacterEncoding("UTF-8");
//            HttpSession session = request.getSession();
//
//            User p = (User) session.getAttribute("user");
//            if (p == null) {
//                response.sendRedirect("home");
//                return;
//            }
//
//            if (!p.getRole().equals("Admin")) {
//                response.sendRedirect("home");
//                return;
//            }
            String name = request.getParameter("name");
            String in_charge_group_name = request.getParameter("in_charge_group_name");
            String email = request.getParameter("email");
            String status = request.getParameter("status");
            String description = request.getParameter("description");

            GroupDAO grdb = new GroupDAO();
            Group g = grdb.getGroupByName(in_charge_group_name);

            SupportTypeDAO spdb = new SupportTypeDAO();
            SupportType sp = spdb.getSupportTypeByName(name);
            SupportType sp2 = spdb.getSupportTypeByEmail(email);
            if (sp != null) {
                request.setAttribute("error2", "This support type is existed");
            }
            if (sp2 != null) {
                request.setAttribute("error3", "This email is existed");
            }
//            if (!g.getTeam_type().equals("BA")) {
//                request.setAttribute("error", "This group is not BA");
//            }
            if (sp == null && sp2 == null) {
                int in_charge_group_id = g.getId();
                spdb.addSupportType(name, in_charge_group_id, email, status, description);
                request.setAttribute("success", "Add successfully");
                List<Group> groups = grdb.getAllBAGroups();
                request.setAttribute("groups", groups);
                request.setAttribute("status", "active");
                grdb.close();
                spdb.close();
                request.getRequestDispatcher("addsupporttype.jsp").forward(request, response);
                return;
            } 
            
                request.setAttribute("name", name);
                request.setAttribute("in_charge_group_name", in_charge_group_name);
                request.setAttribute("email", email);
                request.setAttribute("status", status);
                request.setAttribute("description", description);
                List<Group> groups = grdb.getAllBAGroups();
                request.setAttribute("groups", groups);
                grdb.close();
                spdb.close();
                request.getRequestDispatcher("addsupporttype.jsp").forward(request, response);
            
        } catch (IOException | NumberFormatException | ServletException e) {
            response.sendRedirect("home");
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
