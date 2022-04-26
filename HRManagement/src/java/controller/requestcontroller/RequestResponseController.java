/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.requestcontroller;

import dao.RequestDAO;
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
@WebServlet(name = "RequestResponseController", urlPatterns = {"/request-response"})
public class RequestResponseController extends HttpServlet {

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
            RequestDAO requestDAO = new RequestDAO();

            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                if (request.getParameter("status") != null) {
                    String status = request.getParameter("status");
                    requestDAO.updateStatusById(id, status);
                    response.sendRedirect("request-response");
                }
            }

            List<Request> requests_list = requestDAO.getAllAssignedRequestsByInchargeStaffId(acc.getId());
            request.setAttribute("requests", requests_list);
            requestDAO.close();
            request.getRequestDispatcher("request_response.jsp").forward(request, response);
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
        processRequest(request, response);
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
        } else {
            RequestDAO requestDAO = new RequestDAO();
            if (request.getParameter("id") != null && request.getParameter("incharge") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                int inchargeId = Integer.parseInt(request.getParameter("incharge"));
                requestDAO.updateInchargeStaffById(id, inchargeId);
                requestDAO.close();
                response.sendRedirect("request-response");
            } else {
                requestDAO.close();
                response.sendRedirect("request-response");
            }
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
