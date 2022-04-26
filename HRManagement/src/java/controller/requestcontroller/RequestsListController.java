/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.requestcontroller;

import dao.RequestDAO;
import dao.SettingDAO;
import dao.SupportTypeDAO;
import dao.UserDAO;
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
import model.DateConvert;
import model.Request;
import model.SupportType;
import model.User;

/**
 *
 * @author ZenBook
 */
@WebServlet(name = "RequestsListController", urlPatterns = {"/requests-list"})
public class RequestsListController extends HttpServlet {

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
        RequestDAO requestDAO = new RequestDAO();
        if (request.getParameter("delete") != null) {
            requestDAO.deleteRequestById(Integer.parseInt(request.getParameter("delete")));
            response.sendRedirect("requests-list");
        } else {

            SupportTypeDAO supportTypeDAO = new SupportTypeDAO();
            List<SupportType> spList = supportTypeDAO.getAllSupportTypesName();
            request.setAttribute("sp", spList);

            SettingDAO settingDAO = new SettingDAO();
            List<String> statusList = settingDAO.getAllValueSettingByType("request status");
            request.setAttribute("status", statusList);

            requestDAO.close();
            supportTypeDAO.close();
            settingDAO.close();
            request.getRequestDispatcher("requests_list.jsp").forward(request, response);
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
            RequestDAO requestDAO = new RequestDAO();
            List<Request> requests_list = requestDAO.getAllRequestsByRaisedStaffId(acc.getId());
            request.setAttribute("requests", requests_list);
            requestDAO.close();
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

        String spId = getValueParameter(request, "support-type");
        request.setAttribute("spId", spId);

        String requestDate = getValueParameter(request, "request-date");
        request.setAttribute("requestDate", requestDate);

        String updatedDate = getValueParameter(request, "updated-date");
        request.setAttribute("updatedDate", updatedDate);

        String status = getValueParameter(request, "status");
        request.setAttribute("st", status);

        RequestDAO requestDAO = new RequestDAO();
        List<Request> requests_list = requestDAO
                .getAllRequestsByRaisedStaffIdAndFilter(
                        acc.getId(), spId, requestDate, updatedDate, status, title);
        requestDAO.close();
        request.setAttribute("requests", requests_list);

        if (spId != null) {
            int spIdint = Integer.parseInt(spId);
            SupportTypeDAO supportTypeDAO = new SupportTypeDAO();
            supportTypeDAO.close();
        }

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
