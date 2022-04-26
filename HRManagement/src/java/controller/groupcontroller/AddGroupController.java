/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.groupcontroller;

import dao.GroupDAO;
import dao.UserDAO;
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
import model.User;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "AddGroupController", urlPatterns = {"/addgroup"})
public class AddGroupController extends HttpServlet {

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
            out.println("<title>Servlet AddGroupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddGroupController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        User p = (User) session.getAttribute("user");
        if (p == null) {
            response.sendRedirect("home");
            return;
        }

        if (!p.getRole().equals("HR")) {
            response.sendRedirect("home");
            return;
        }
        GroupDAO grdb = new GroupDAO();
        List<User> managers = grdb.getAllTeamLeader();
        List<Group> parentGroup = grdb.getAllGroups();
        grdb.close();

        request.setAttribute("managers", managers);
        request.setAttribute("parentGroup", parentGroup);
        request.setAttribute("status", "Active");
        request.setAttribute("grType", "BA");
        request.getRequestDispatcher("addgroup.jsp").forward(request, response);

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
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();

            User p = (User) session.getAttribute("user");
            if (p == null) {
                response.sendRedirect("home");
                return;
            }

            if (!p.getRole().equals("HR")) {
                response.sendRedirect("home");
                return;
            }

            String code = request.getParameter("code");
            String name = request.getParameter("name");
            String manager_id_raw = request.getParameter("manager");
            String parentGroupCode = request.getParameter("parentGroup");
            String grType = request.getParameter("grType");
            String status = request.getParameter("status");
            String description = request.getParameter("description");

            int manager_id = 0;
            try {
                manager_id = Integer.parseInt(manager_id_raw);
            } catch (NumberFormatException ne) {
                System.out.println(ne);
            }

            GroupDAO grdb = new GroupDAO();
            Group g = grdb.getGroupByName(name);

            Group g2 = grdb.getGroupByCode(code);

            int parent_team_id = 0;
            if (!parentGroupCode.equals("none")) {
                Group pGroup = grdb.getGroupByCode(parentGroupCode);
                parent_team_id = pGroup.getId();
            }
            List<User> managers = grdb.getAllTeamLeader();
            List<Group> parentGroup = grdb.getAllGroups();

            request.setAttribute("managers", managers);
            request.setAttribute("parentGroup", parentGroup);

            request.setAttribute("code", code);
            request.setAttribute("name", name);
            request.setAttribute("manager", manager_id);
            request.setAttribute("parentGroupCode", parentGroupCode);
            request.setAttribute("grType", grType);
            request.setAttribute("status", status);
            request.setAttribute("description", description);

            if (g != null || g2 != null) {
                if (g2 != null) {
                    request.setAttribute("error2", "Group code is existed!");
                }
                if (g != null) {
                    request.setAttribute("error", "Group name has already existed!");
                }
                request.getRequestDispatcher("addgroup.jsp").forward(request, response);
                return;
            }

            grdb.addGroupInGroupDetail(code, name, manager_id, parent_team_id, status, description, grType);
            grdb.close();

            request.setAttribute("success", "Add successfully!");
            request.getRequestDispatcher("addgroup.jsp").forward(request, response);

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
