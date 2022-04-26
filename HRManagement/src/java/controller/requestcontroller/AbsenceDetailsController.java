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
import model.DateConvert;
import model.Group;
import model.User;

/**
 *
 * @author ZenBook
 */
@WebServlet(name = "AbsenceDetails", urlPatterns = {"/absence-details"})
public class AbsenceDetailsController extends HttpServlet {

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
            SettingDAO settingDAO = new SettingDAO();
            List<String> absenceType = settingDAO.getAllValueSettingByType("absence type");
            request.setAttribute("types", absenceType);

            int id = getIntValueParameter(request, "id");
            if (id == 0) {
                request.getRequestDispatcher("absence_details.jsp").forward(request, response);
            } else {
                AbsenceDAO absenceDAO = new AbsenceDAO();
                GroupDAO groupDAO = new GroupDAO();
                request.setAttribute("acc", acc);
                Absence absence = absenceDAO.getAbsenceById(id);
                request.setAttribute("absence", absence);

                absenceDAO.close();
                groupDAO.close();
                request.getRequestDispatcher("absence_details.jsp").forward(request, response);
            }
            settingDAO.close();
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
        AbsenceDAO absenceDAO = new AbsenceDAO();

        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");

        String title = getStringValueParameter(request, "title");
        String type = getStringValueParameter(request, "absence-type");
        String from = getStringValueParameter(request, "from");
        String to = getStringValueParameter(request, "to");
        int duration = getIntValueParameter(request, "duration");
        int id = getIntValueParameter(request, "id");
        if (id == 0) {
            GroupDAO groupDAO = new GroupDAO();
            int groupId = groupDAO.getGroupIdByStaffId(acc.getId());
            absenceDAO.addNewAbsence(acc.getId(), title, type, groupId, from, to, duration);
            response.sendRedirect("absence-request");
        } else {
            if (title != null) {
                absenceDAO.updateTitleById(id, title);
            }

            if (type != null) {
                absenceDAO.updateTypeById(id, type);
            }

            if (from != null) {
                absenceDAO.updateStartDateById(id, from);
            }

            if (to != null) {
                absenceDAO.updateEndDateById(id, to);
            }
            absenceDAO.updateDurationById(id, duration);
            absenceDAO.updateStatusById(id, "Submitted");

            response.sendRedirect("absence-details?id=" + id);
        }
        absenceDAO.close();
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

    String getStringValueParameter(HttpServletRequest request, String str)
            throws ServletException, IOException {
        String titleRaw = request.getParameter(str);
        if (titleRaw == null || titleRaw.equals("")) {
            return null;
        } else {
            return titleRaw;
        }
    }

    int getIntValueParameter(HttpServletRequest request, String str)
            throws ServletException, IOException {
        String titleRaw = request.getParameter(str);
        int title;
        if (titleRaw.equals("") || titleRaw == null) {
            title = 0;
        } else {
            title = Integer.parseInt(titleRaw);
        }
        return title;
    }

}
