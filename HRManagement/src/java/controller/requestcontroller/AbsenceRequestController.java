/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.requestcontroller;

import dao.AbsenceDAO;
import dao.GroupDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Absence;
import model.Group;
import model.User;

/**
 *
 * @author ZenBook
 */
@WebServlet(name = "AbsenceRequestController", urlPatterns = {"/absence-request"})
public class AbsenceRequestController extends HttpServlet {

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
        AbsenceDAO absenceDAO = new AbsenceDAO();
        if (request.getParameter("delete") != null) {
            int id = Integer.parseInt(request.getParameter("delete"));
            absenceDAO.deleteAbsenceById(id);
            response.sendRedirect("absence-request");
        } else {
            if (request.getParameter("delete") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                absenceDAO.deleteAbsenceById(id);
                response.sendRedirect("absence-request");
            } else {

                SettingDAO settingDAO = new SettingDAO();
                List<String> types = settingDAO.getAllValueSettingByType("absence type");
                request.setAttribute("types", types);

                List<String> statusList = settingDAO.getAllValueSettingByType("absence request status");
                request.setAttribute("status", statusList);
                settingDAO.close();

                absenceDAO.close();
                request.getRequestDispatcher("absence_requests.jsp").forward(request, response);
            }
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
        User acc = (User) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
        } else {
            request.setAttribute("acc", acc);
            AbsenceDAO absenceDAO = new AbsenceDAO();
            List<Absence> absences = absenceDAO.getAbsenceByStaffId(acc.getId());
            request.setAttribute("absences", absences);
            absenceDAO.close();
            processRequest(request, response);
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
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");

        String title = getValueParameter(request, "title");
        request.setAttribute("title", title);

        String type = getValueParameter(request, "absence-type");
        request.setAttribute("type", type);

        String requestDate = getValueParameter(request, "request-date");
        request.setAttribute("requestDate", requestDate);

        String startDate = getValueParameter(request, "start-date");
        request.setAttribute("startDate", startDate);

        String endDate = getValueParameter(request, "end-date");
        request.setAttribute("endDate", endDate);

        String status = getValueParameter(request, "status");
        request.setAttribute("st", status);

        AbsenceDAO absenceDAO = new AbsenceDAO();
        List<Absence> absences = absenceDAO.getAbsenceByStaffIdAndFilter(acc.getId(), title, type, requestDate, startDate, endDate, status);
        request.setAttribute("absences", absences);
        absenceDAO.close();
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

    String getValueParameter(HttpServletRequest request, String str)
            throws ServletException, IOException {
        String titleRaw = request.getParameter(str);
        String title;
        if (titleRaw.equals("") || titleRaw == null) {
            title = null;
        } else {
            title = titleRaw;
        }
        return title;
    }

}
