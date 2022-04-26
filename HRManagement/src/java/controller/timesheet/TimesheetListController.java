/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.timesheet;

import dao.ProjectDAO;
import dao.TimesheetDAO;
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
import model.Project;
import model.Timesheet;
import model.User;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "TimesheetListController", urlPatterns = {"/timesheetlist"})
public class TimesheetListController extends HttpServlet {

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
            out.println("<title>Servlet TimesheetListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TimesheetListController at " + request.getContextPath() + "</h1>");
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

//        User p = new User(); p.setId(131);p.setRole("Staff");
//        session.setAttribute("user", p);
        if (p == null) {
            response.sendRedirect("home");
            return;
        }

        if (!p.getRole().equals("Staff")) {
            response.sendRedirect("home");
            return;
        }

        int staff_id = p.getId();
        TimesheetDAO tsdb = new TimesheetDAO();
        List<Timesheet> list = new ArrayList<>();
        ProjectDAO pdb = new ProjectDAO();
        List<Project> listProjects = pdb.getAllProjectForTimesheet();
        List<String> listProcess = tsdb.getAllTimesheetProcess();

        String title = request.getParameter("title");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String process = request.getParameter("process");
        String project = request.getParameter("project");

        if (tsdb.getTeamRoleByStaff(staff_id) != null) {
            if (tsdb.getTeamRoleByStaff(staff_id).equals("Member")) {
                list = tsdb.getTimesheetByStaff(staff_id, title, from, to, process, project);
            }
            if (tsdb.getTeamRoleByStaff(staff_id).equals("Manager")) {
                list = tsdb.getTimesheetByManager(staff_id, title, from, to, process, project);
            }
        }
        request.setAttribute("title", title);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("process", process);
        request.setAttribute("project", project);
        request.setAttribute("data_process", listProcess);
        request.setAttribute("data_projects", listProjects);
        request.setAttribute("data", list);
        tsdb.close();
        pdb.close();
        request.getRequestDispatcher("timesheetlist.jsp").forward(request, response);
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
