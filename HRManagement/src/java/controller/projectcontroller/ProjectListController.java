/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.projectcontroller;

import dao.GroupDAO;
import dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Project;
import model.User;

/**
 *
 * @author nghie
 */
@WebServlet(name = "ProjectListController", urlPatterns = {"/project-list"})
public class ProjectListController extends HttpServlet {

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
            out.println("<title>Servlet ProjectListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectListController at " + request.getContextPath() + "</h1>");
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
        ProjectDAO p = new ProjectDAO();
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String group = request.getParameter("group");
        String manager = request.getParameter("manager");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        int staffId = user.getId();
        if (user.getRole().equals("HR") || user.getRole().equals("Manager")) {
            if (user.getRole().equals("HR")) {
                staffId = 0;
            }
            request.setAttribute("show", true);
        } else {
            request.setAttribute("show", false);
        }
        List<Project> projects = p.getAllProject(code, name, group, manager, status, staffId);
        GroupDAO g = new GroupDAO();
        List<String> groups = g.getAllGroupsCode(staffId);
        List<User> managers = p.getAllManagerGroup(staffId);
        groups.add(0, "All group");
        request.setAttribute("projects", projects);
        request.setAttribute("groups", groups);
        request.setAttribute("managers", managers);
        g.close();
        p.close();
        request.getRequestDispatcher("projectlist.jsp").forward(request, response);
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
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String group = request.getParameter("group");
        String manager = request.getParameter("manager");
        String status = request.getParameter("status");
        String url = "";
        if (!code.equals("")) {
            url = "?code=" + code;
        }
        if (!name.equals("")) {
            url = url.length() > 0 ? url + "&" : url + "?";
            url = url + "name=" + name;
        }
        if (!group.equals("All group")) {
            url = url.length() > 0 ? url + "&" : url + "?";
            url = url + "group=" + group;
        }
        if (!manager.equals("0")) {
            url = url.length() > 0 ? url + "&" : url + "?";
            url = url + "manager=" + manager;
        }
        if (!status.equals("All Status")) {
            url = url.length() > 0 ? url + "&" : url + "?";
            url = url + "status=" + status;
        }
        response.sendRedirect("project-list" + url);
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
