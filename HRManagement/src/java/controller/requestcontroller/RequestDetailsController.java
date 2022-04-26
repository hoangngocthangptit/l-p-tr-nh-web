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
@WebServlet(name = "RequestDetailsController", urlPatterns = {"/request-details"})
public class RequestDetailsController extends HttpServlet {

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
        processRequest(request, response);
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
        } else {
            SettingDAO settingDAO = new SettingDAO();
            SupportTypeDAO supportTypeDAO = new SupportTypeDAO();
            List<SupportType> spList = supportTypeDAO.getAllSupportTypesName();
            request.setAttribute("sp", spList);

            int id = getIntValueParameter(request, "id");
            if (request.getParameter("id") == null) {
                request.getRequestDispatcher("request_details.jsp").forward(request, response);
            } else {
                RequestDAO requestDAO = new RequestDAO();
                Request req = requestDAO.getRequestById(id);
                request.setAttribute("req", req);
                requestDAO.close();
                request.getRequestDispatcher("request_details.jsp").forward(request, response);
            }
            supportTypeDAO.close();
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
//        processRequest(request, response);
        UserDAO userDAO = new UserDAO();
        RequestDAO requestDAO = new RequestDAO();

        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");
        request.setAttribute("acc", acc);

        String title = getStringValueParameter(request, "title");
        String spId = getStringValueParameter(request, "support-type");
        String des = getStringValueParameter(request, "des");
        int id = getIntValueParameter(request, "id");

        if (id == 0) {
            int managerId = userDAO.getManagerIdBySupportTypeId(Integer.parseInt(spId));
            requestDAO.addNewRequest(title, spId, acc.getId(), des, managerId);
            userDAO.close();
            requestDAO.close();
            response.sendRedirect("requests-list");
        } else {
            if (spId != null) {
                requestDAO.updateSupportTypeById(id, spId);
                int managerId = userDAO.getManagerIdBySupportTypeId(Integer.parseInt(spId));
                requestDAO.updateInchargeStaffById(id, managerId);
            }

            if (des != null) {
                requestDAO.updateDescriptionById(id, des);
            }

            userDAO.close();
            requestDAO.close();
            response.sendRedirect("request-details?id=" + id);
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
