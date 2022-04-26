/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.settingcontroller;

import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Setting;
import model.User;

/**
 *
 * @author nghie
 */
@WebServlet(name = "SettingListController", urlPatterns = {"/setting-list"})
public class SettingListController extends HttpServlet {

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
            out.println("<title>Servlet SettingListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingListController at " + request.getContextPath() + "</h1>");
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
     * @return
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public List<String> getAllSettingType() {
        try {
            Properties properties = new Properties();
            properties.load(getServletContext().getResourceAsStream("/WEB-INF/settingType.properties"));
            String types = properties.getProperty("type");
            String[] part = types.split(",");
            List<String> list = new ArrayList<>();
            list.addAll(Arrays.asList(part));
            list.add(0, "All Type");
            return list;
        } catch (IOException e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("home");
            return;
        }
        if (!user.getRole().equals("Admin")) {
            response.sendRedirect("dashboard");
            return;
        }
        SettingDAO s = new SettingDAO();
        String type = (request.getParameter("type") == null || request.getParameter("type").equals("All Type"))   ? "" : request.getParameter("type");
        String status = (request.getParameter("status") == null || request.getParameter("status").equals("All Status")) ? "" : request.getParameter("status");
        String value = request.getParameter("value") == null ? "" : request.getParameter("value");
        List<Setting> settings = s.getAllSettings(type, status, value);
        request.setAttribute("settings", settings);
        request.setAttribute("allType", getAllSettingType());
        s.close();
        request.getRequestDispatcher("settinglist.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        String status = request.getParameter("status");
        String value = request.getParameter("value");
        String btn = request.getParameter("action");
        if (btn != null) {
            String[] part = btn.split(",");
            SettingDAO s = new SettingDAO();
            s.UpdateStatus(part[1], Integer.parseInt(part[0]));
            s.close();
        }
        if (type != null && status != null && value != null) {
            if (value.length() > 0 || (!type.equals("All Type")) || (!status.equals("All Status"))) {
                response.sendRedirect("setting-list?type=" + type + "&status=" + status + "&value=" + value);
            } else {
                response.sendRedirect("setting-list");
            }
        } else {
            response.sendRedirect("setting-list");
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
