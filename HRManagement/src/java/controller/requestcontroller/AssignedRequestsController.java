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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Request;
import model.SupportType;
import model.User;

/**
 *
 * @author ZenBook
 */
@WebServlet(name = "AssignedRequests", urlPatterns = {"/assigned-requests"})
public class AssignedRequestsController extends HttpServlet {

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
        
        UserDAO userDAO = new UserDAO();
        List<User> staffs = userDAO.getAllStaffByRole("Staff");
        request.setAttribute("staffs", staffs);
        userDAO.close();

        SupportTypeDAO supportTypeDAO = new SupportTypeDAO();
        List<SupportType> spList = supportTypeDAO.getAllSupportTypesName();
        request.setAttribute("sp", spList);
        supportTypeDAO.close();
        
        SettingDAO settingDAO = new SettingDAO();
        List<String> statusList = settingDAO.getAllValueSettingByType("request status");
        request.setAttribute("status", statusList);
        settingDAO.close();
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
            RequestDAO requestDAO = new RequestDAO();

            if (request.getParameter("reqId") != null && request.getParameter("status") != null) {
                int reqId = Integer.parseInt(request.getParameter("reqId"));
                String status = request.getParameter("status");
                requestDAO.updateStatusById(reqId, status);
                response.sendRedirect("assigned-requests");
            } else {
                UserDAO userDAO = new UserDAO();
                SupportTypeDAO spDAO = new SupportTypeDAO();

                List<Request> requests_list = new ArrayList<>();
                int spId = spDAO.getSupportTypeIdByInchargeId(acc.getId());
                int managerId = userDAO.getManagerIdBySupportTypeId(spId);

                if (managerId == acc.getId()) {
                    requests_list = requestDAO.getAllAssignedRequestsByManagerId(acc.getId());
                    request.setAttribute("mamager", acc);
                } else {
                    requests_list = requestDAO.getAllAssignedRequestsByInchargeStaffId(acc.getId());
                }
                request.setAttribute("requests", requests_list);

                userDAO.close();
                spDAO.close();
                processRequest(request, response);
                request.getRequestDispatcher("assigned_requests.jsp").forward(request, response);
            }
            requestDAO.close();
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
        if (acc == null) {
            response.sendRedirect("login");
        } else {
            RequestDAO requestDAO = new RequestDAO();
            UserDAO userDAO = new UserDAO();
            SupportTypeDAO spDAO = new SupportTypeDAO();

            String title = getValueParameter(request, "title");
            request.setAttribute("title", title);
            String requestDate = getValueParameter(request, "request-date");
            request.setAttribute("requestDate", requestDate);
            String updatedDate = getValueParameter(request, "updated-date");
            request.setAttribute("updatedDate", updatedDate);
            String inchargeId = getValueParameter(request, "incharge-staff");
            request.setAttribute("inchargeId", inchargeId);
            String spId = getValueParameter(request, "support-type");
            request.setAttribute("spId", spId);
            String status = getValueParameter(request, "status");
            request.setAttribute("st", status);

            List<Request> requests_list = new ArrayList<>();
            int managerId = userDAO.getManagerIdBySupportTypeId(spDAO.getSupportTypeIdByInchargeId(acc.getId()));
            if (managerId == acc.getId()) {
                requests_list = requestDAO
                        .getAllAssignedRequestsByManagerIdAndFilter(
                                managerId, requestDate, updatedDate, inchargeId, spId, status, title);
                request.setAttribute("mamager", acc);
            } else {
                requests_list = requestDAO
                        .getAllAssignedRequestsByInchargeStaffIdAndFilter(
                                acc.getId(), requestDate, updatedDate, spId, status, title);
            }
            request.setAttribute("requests", requests_list);
            requestDAO.close();
            userDAO.close();
            spDAO.close();
            processRequest(request, response);
            request.getRequestDispatcher("assigned_requests.jsp").forward(request, response);

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

    String getValueParameter(HttpServletRequest request, String str)
            throws ServletException, IOException {
        String titleRaw = request.getParameter(str);
        if (titleRaw == null) {
            return null;
        } else if (titleRaw.equals("")) {
            return null;
        } else {
            return titleRaw;
        }
    }
}
