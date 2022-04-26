/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.requestcontroller;

import dao.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Request;
import model.User;

/**
 *
 * @author nghie
 */
@WebServlet(name = "StaffFeedback", urlPatterns = {"/staff-feedback"})
public class StaffFeedbackController extends HttpServlet {

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
            out.println("<title>Servlet StaffFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffFeedback at " + request.getContextPath() + "</h1>");
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
        RequestDAO r = new RequestDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        try {
            User p = (User) session.getAttribute("user");
            if (p == null) {
                response.sendRedirect("login");
                r.close();
                return;
            }
            int user_request_id = p.getId();
            Request req = r.checkAccess(id, user_request_id);
            String status = request.getParameter("status");
            if (status != null && status.equals("fail")) {
                request.setAttribute("mess", "You can't access this page");
            } else {
                if (req != null) {
                    request.setAttribute("title", req.getTitle());
                    request.setAttribute("star", req.getStar());
                    request.setAttribute("comment", req.getComment());
                } else {
                    r.close();
                    response.sendRedirect("staff-feedback?id=" + id + "&status=fail");
                    return;
                }
                if (status != null) {
                    switch (status) {
                        case "error":
                            request.setAttribute("mess", "All attribute must be fill");
                            break;
                        case "success":
                            request.setAttribute("mess", "Feedback was updated");
                            break;
                        case "edit":
                            request.setAttribute("mess", "Edit successfully");
                            break;
                    }
                }
                r.close();
                request.getRequestDispatcher("staff_feedback.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            r.close();
            response.sendRedirect("login");
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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String starStr = request.getParameter("star");
            String comment = request.getParameter("comment");
            int star = 0;
            if (comment.trim().length() < 1 || starStr == null) {
                response.sendRedirect("staff-feedback?id=" + id + "&status=error&star=" + starStr + "&comment=" + comment);
                return;
            } else {
                star = Integer.parseInt(starStr);
            }
            RequestDAO r = new RequestDAO();
            if (r.Feedback(star, comment, id) > 0) {
                r.close();
                response.sendRedirect("staff-feedback?id=" + id + "&status=success&star=" + starStr + "&comment=" + comment);
            } else {
                r.editFeedback(star, comment, id);
                r.close();
                response.sendRedirect("staff-feedback?id=" + id + "&status=edit&star=" + starStr + "&comment=" + comment);
            }
        } catch (IOException | NumberFormatException e) {
            int id = Integer.parseInt(request.getParameter("id"));
            response.sendRedirect("staff-feedback?id=" + id + "&status=error");
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
