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
@WebServlet(name = "SettingDetailController", urlPatterns = {"/setting-detail"})
public class SettingDetailController extends HttpServlet {

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
            out.println("<title>Servlet SettingDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingDetailController at " + getAllSettingType() + "</h1>");
            out.println("</body>");
            out.println("</html>");

        }
    }

    public List<String> getAllSettingType() {
        try {
            Properties properties = new Properties();
            properties.load(getServletContext().getResourceAsStream("/WEB-INF/settingType.properties"));
            String types = properties.getProperty("type");
            String[] part = types.split(",");
            List<String> list = new ArrayList<>();
            list.addAll(Arrays.asList(part));
            return list;
        } catch (IOException e) {
            System.out.println(e);
            return null;
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
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("home");
            return;
        }
        if (!user.getRole().equals("Admin")) {
            response.sendRedirect("dashboard");
            return;
        }
        String action = request.getParameter("action");
        SettingDAO s = new SettingDAO();
        String status = request.getParameter("error");
        List<String> mess = new ArrayList<>();
        if (status != null) {
            if (status.contains("errV")) {
                mess.add("Value must be filled");
            }
            if (status.contains("errO")) {
                mess.add("Order must in range 0 to 1000");
            }
            if (status.contains("errS")) {
                mess.add("Status must be select");
            }
            if (status.contains("errN")) {
                mess.add("Order must be filled");
            }
            if (status.contains("errE")) {
                mess.add("This value was exist in setting type");
            }
        }
        List<String> settings = getAllSettingType();
        request.setAttribute("settings", settings);
        if (action.equals("edit")) {
            request.setAttribute("action", "Edit");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Setting setting = s.getSettingByValueId(id);
                request.setAttribute("setting", setting);
            } catch (NumberFormatException e) {
            }
            if (status != null && status.equals("success")) {
                request.setAttribute("mess", "Update successfuly");
            }
        } else {
            request.setAttribute("action", "Add");
            if (status != null && status.equals("success")) {
                request.setAttribute("mess", "Add successfuly");
            }
        }
        if (status != null && (!status.equals("success"))) {
            request.setAttribute("mess", mess);
        }
        s.close();
        request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
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
        SettingDAO s = new SettingDAO();
        Setting setting = new Setting();
        String type = request.getParameter("type");
        setting.setType(type);
        setting.setId(s.getSettingIdByType(type));
        setting.setValue(request.getParameter("value"));
        setting.setNote(request.getParameter("note"));
        setting.setStatus(request.getParameter("status"));
        String action = request.getParameter("action");
        String status = "";
        if (setting.getValue().equals("")) {
            status = "errV";
        }
        try {
            setting.setOrder(Integer.parseInt(request.getParameter("order")));
        } catch (NumberFormatException e) {
            status = status + "errN";
        }
        if (setting.getOrder() < 0 || setting.getOrder() > 1000) {
            status = status + "errO";
        }
        if (setting.getStatus() == null) {
            status = status + "errS";
        }
        int valueId = s.checkValueExist(setting);
        if (valueId > 0) {
            if (action.equals("add")) {
                status = status + "errE";
            } else {
                try {
                    if (valueId != Integer.parseInt(request.getParameter("id"))) {
                        status = status + "errE";
                    }
                } catch (NumberFormatException e) {
                }
            }
        }
        if (!status.equals("")) {
            String id = "";
            try {
                id = "&id=" + Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
            }
            s.close();
            response.sendRedirect("setting-detail?action=" + action + id + "&type=" + setting.getType() + "&order=" + setting.getOrder()
                    + "&note=" + setting.getNote() + "&status=" + setting.getStatus() + "&value=" + setting.getValue() + "&error=" + status);
            return;
        }
        if (setting.getId() == 0) {
            s.AddSettingType(type);
            setting.setId(s.getSettingIdByType(type));
        }
        if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            setting.setValueid(id);
            s.UpdateSettingValue(setting);
            response.sendRedirect("setting-detail?action=edit&id=" + id + "&error=success");
        } else {
            s.AddSettingValue(setting);
            response.sendRedirect("setting-detail?action=add&error=success");
        }
        s.close();
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
