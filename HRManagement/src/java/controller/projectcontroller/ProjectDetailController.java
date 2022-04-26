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
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Project;
import model.Resource;
import model.User;

/**
 *
 * @author nghie
 */
@WebServlet(name = "ProjectDetailController", urlPatterns = {"/project-detail"})
public class ProjectDetailController extends HttpServlet {

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
            out.println("<title>Servlet ProjectDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectDetailController at " + request.getContextPath() + "</h1>");
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
        int userId = user.getId();
        if (user.getRole().equals("HR")){
            userId = 0;
        }
        ProjectDAO p = new ProjectDAO();
        String code = request.getParameter("code");
        Project project = p.getProjectByCode(code);
        request.setAttribute("project", project);
        GroupDAO g = new GroupDAO();
        List<String> groups = g.getAllGroupsCode(userId);
        request.setAttribute("groups", groups);
        String action = request.getParameter("action");
        request.setAttribute("action", (action.charAt(0) + "").toUpperCase() + action.substring(1));
        String error = request.getParameter("error");
        if (error != null) {
            switch (error) {
                case "successEdit":
                    request.setAttribute("mess", "Edit successfully");
                    break;
                case "successAdd":
                    request.setAttribute("mess", "Add successfully");
                    break;
                default:
                    List<String> list = new ArrayList<>();
                    if (error.contains("errorD")) {
                        list.add("End date must be after start date");
                    }
                    if (error.contains("errorF")) {
                        list.add("Date must be filled");
                    }
                    if (error.contains("errorC")) {
                        list.add("Project code was exist");
                    }
                    if (error.contains("errorN")) {
                        list.add("Project name must be fill");
                    }
                    if (error.contains("errorS")) {
                        list.add("Status must be selected");
                    }
                    if (error.contains("errorP")) {
                        list.add("Code must be fill");
                    }
                    request.setAttribute("mess", list);
            }
        }
        request.setAttribute("role", user.getRole().equals("Manager") || user.getRole().equals("HR"));
        List<Resource> list = p.getAllResourceByCode(request.getParameter("code"));
        request.setAttribute("list", list);
        p.close();
        g.close();
        request.getRequestDispatcher("projectdetail.jsp").forward(request, response);
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
        ProjectDAO p = new ProjectDAO();
        Project project = new Project();
        String error = "";
        project.setProjectCode(request.getParameter("projectCode"));
        project.setProjectName(request.getParameter("name"));
        project.setTeamCode(request.getParameter("group"));
        try {
            project.setStartDate(Date.valueOf(request.getParameter("start")));
            project.setEndDate(Date.valueOf(request.getParameter("end")));
            if (project.getStartDate().compareTo(project.getEndDate()) > 0) {
                error = error + "errorD";
            }
        } catch (Exception e) {
            error = error + "errorF";
        }
        project.setStatus(request.getParameter("status"));
        project.setDescription(request.getParameter("description"));
        String action = request.getParameter("action");
        String code = request.getParameter("code");
        if ((code == null || !code.equals(project.getProjectCode())) && p.projectCodeExist(project.getProjectCode())) {
            error = error + "errorC";
        }
        if (project.getProjectCode().equals("")) {
            error = error + "errorP";
        }
        if (project.getProjectName().equals("")) {
            error = error + "errorN";
        }
        if (project.getStatus() == null) {
            error = error + "errorS";
        }
        if (error.contains("error")) {
            response.sendRedirect("project-detail?action=" + action + "&code=" + code + "&projectCode=" + project.getProjectCode()
                    + "&name=" + project.getProjectName() + "&group=" + project.getTeamCode() + "&start=" + project.getStartDate() + "&end=" + project.getEndDate()
                    + "&status=" + project.getStatus() + "&description=" + project.getDescription() + "&error=" + error);
        } else {
            if (action.equals("edit")) {
                p.editProject(project, code);
                response.sendRedirect("project-detail?action=edit&code=" + project.getProjectCode() + "&error=successEdit");
            }
            if (action.equals("add")) {
                p.addProject(project);
                response.sendRedirect("project-detail?action=edit&code=" + project.getProjectCode() + "&error=successAdd");
            }
        }
        p.close();
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
