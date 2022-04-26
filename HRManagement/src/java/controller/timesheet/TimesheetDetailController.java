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
import java.sql.Date;
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
@WebServlet(name = "TimesheetDetailController", urlPatterns = {"/timesheetdetail"})
public class TimesheetDetailController extends HttpServlet {

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
            out.println("<title>Servlet TimesheetDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TimesheetDetailController at " + request.getContextPath() + "</h1>");
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

        if (!p.getRole().equals("Staff")) {
            response.sendRedirect("home");
            return;
        }
        String action = request.getParameter("action");
        String id_raw = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (NumberFormatException ne) {
            System.err.println(ne);
        }
        TimesheetDAO tsdb = new TimesheetDAO();
        Timesheet timesheet = tsdb.getTimesheetById(id);
        ProjectDAO pdb = new ProjectDAO();
        List<Project> listProjects = pdb.getAllProjectForTimesheet();
        List<String> listProcess = tsdb.getAllTimesheetProcess();
        request.setAttribute("data_process", listProcess);
        request.setAttribute("data_projects", listProjects);
        request.setAttribute("timesheet", timesheet);
        request.setAttribute("action", action);
        tsdb.close();
        pdb.close();
        request.getRequestDispatcher("timesheetdetail.jsp").forward(request, response);

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
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addTimesheet(request, response);
                break;
            case "update":
                updateTimesheet(request, response);
                break;
            default:
                response.sendRedirect("home");
        }
    }

    private void addTimesheet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        User p = (User) session.getAttribute("user");

        if (p == null) {
            response.sendRedirect("home");
            return;
        }

        if (!p.getRole().equals("Staff")) {
            response.sendRedirect("home");
            return;
        }
        String action = request.getParameter("action");
        String date = request.getParameter("date");
        String title = request.getParameter("title");
        String process = request.getParameter("process");
        String project = request.getParameter("project");
        String duration_raw = request.getParameter("duration");
        String status = request.getParameter("status");
        String workResult = request.getParameter("workResult");
        String rejectReason = request.getParameter("rejectReason");
        double duration = 0;
        try {
            duration = Double.parseDouble(duration_raw);
        } catch (NumberFormatException ne) {
            System.out.println(ne);
        }
        ProjectDAO pdb = new ProjectDAO();
        TimesheetDAO tsdb = new TimesheetDAO();
        List<Project> listProjects = pdb.getAllProjectForTimesheet();
        List<String> listProcess = tsdb.getAllTimesheetProcess();
        request.setAttribute("data_process", listProcess);
        request.setAttribute("data_projects", listProjects);
        request.setAttribute("date", date);
        request.setAttribute("action", action);
        request.setAttribute("title", title);
        request.setAttribute("process", process);
        request.setAttribute("project", project);
        request.setAttribute("duration", duration_raw);
        request.setAttribute("status", status);
        request.setAttribute("workResult", workResult);
        request.setAttribute("rejectReason", rejectReason);

        if (tsdb.checkValidProject(p.getId(), project) == true) {
            tsdb.addTimeSheet(date, title, project, process, duration, p.getId(), workResult);
            request.setAttribute("success", "Add successfully");

            request.getRequestDispatcher("timesheetdetail.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "You are not joining in this project");
            request.getRequestDispatcher("timesheetdetail.jsp").forward(request, response);
        }
        pdb.close();
        tsdb.close();
    }

    private void updateTimesheet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        User p = (User) session.getAttribute("user");

        if (p == null) {
            response.sendRedirect("home");
            return;
        }

        if (!p.getRole().equals("Staff")) {
            response.sendRedirect("home");
            return;
        }
        String action = request.getParameter("action");
        String date = request.getParameter("date");
        String title = request.getParameter("title");
        String process = request.getParameter("process");
        String project = request.getParameter("project");
        String duration_raw = request.getParameter("duration");
        String status = request.getParameter("status");
        String workResult = request.getParameter("workResult");
        String rejectReason = request.getParameter("rejectReason");
        double duration = 0;
        try {
            duration = Double.parseDouble(duration_raw);
        } catch (NumberFormatException ne) {

        }
        String id_raw = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (NumberFormatException ne) {
            System.err.println(ne);
        }
        ProjectDAO pdb = new ProjectDAO();
        TimesheetDAO tsdb = new TimesheetDAO();
        List<Project> listProjects = pdb.getAllProjectForTimesheet();
        List<String> listProcess = tsdb.getAllTimesheetProcess();
        request.setAttribute("data_process", listProcess);
        request.setAttribute("data_projects", listProjects);
        request.setAttribute("action", action);
        Timesheet t = new Timesheet(id, Date.valueOf(date), title, project, process,
                duration, workResult, status, rejectReason, p.getId());
        request.setAttribute("timesheet", t);
        if (tsdb.checkValidProject(p.getId(), project) == true) {
            tsdb.updateTimesheet(date, title, project, process, duration, id);
            request.setAttribute("success", "Update successfully");
            pdb.close();
            tsdb.close();
            request.getRequestDispatcher("timesheetdetail.jsp").forward(request, response);
        } else {
            pdb.close();
            tsdb.close();
            request.setAttribute("error", "You are not joining in this project");
            request.getRequestDispatcher("timesheetdetail.jsp").forward(request, response);
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
