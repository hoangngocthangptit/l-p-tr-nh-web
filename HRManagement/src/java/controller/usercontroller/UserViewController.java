/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.usercontroller;

import dao.GroupDAO;
import dao.UserDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nghie
 */
@WebServlet(name = "UserViewServlet", urlPatterns = {"/userview"})
public class UserViewController extends HttpServlet {

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
            out.println("<title>Servlet UserView</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserView at " + request.getContextPath() + "</h1>");
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
        try {
            UserDAO u = new UserDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            User staff = u.getUserInformation(id);

            try {
                HttpSession session = request.getSession();
                String status = request.getParameter("status");
                if (status != null) {
                    if (status.equals("success")) {
                        request.setAttribute("mess", "Edit successfully");
                    } else {
                        List<String> messes = new ArrayList<>();
                        if (status.contains("errorGC")) {
                            messes.add("Group code was wrong format !!");
                            staff.setGroup_code(request.getParameter("egroup"));
                        }
                        if (status.contains("errorMb")) {
                            messes.add("Mobile number was wrong format !!");
                            staff.setMobile(request.getParameter("emobile"));
                        }
                        if (status.contains("errorEm")) {
                            String email = request.getParameter("eemail");
                            messes.add("Email " + email + " existed !!");
                        }
                        if (status.contains("errorUn")) {
                            String username = request.getParameter("eusername");
                            messes.add("User name " + username + " existed !!");
                        }
                        if (status.contains("errorNN")) {
                            messes.add("Full name must be fill !!");
                        }
                        if (status.contains("errorNE")) {
                            messes.add("Email must be fill !!");
                        }
                        if (status.contains("errorNU")) {
                            messes.add("User name must be fill !!");
                        }
                        request.setAttribute("mess", messes);
                    }
                }
                User user = (User) session.getAttribute("user");
                if (user == null) {
                    response.sendRedirect("home");
                    return;
                }
                if (user.getRole().equals("Staff")) {
                    response.sendRedirect("dashboard");
                    return;
                }
                request.setAttribute("edit", !user.getRole().toUpperCase().equals("HR"));
            } catch (IOException e) {
                response.sendRedirect("login");
                return;
            }

            request.setAttribute("user", staff);
            GroupDAO g = new GroupDAO();
            List<String> groupCode = g.getAllGroupsCode(0);
            groupCode.add(0, "None");
            request.setAttribute("groupCode", groupCode);
            u.close();
            g.close();
            request.getRequestDispatcher("userview.jsp").forward(request, response);
        } catch (IOException | NumberFormatException | ServletException e) {
            response.sendRedirect("home");
            System.out.println(e);
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
            request.setCharacterEncoding("UTF-8");
            UserDAO u = new UserDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String status = "";
            String errorParam = "";
            if (user != null && user.getRole().equals("HR")) {
                User edit = new User();
                String groups = request.getParameter("Group code");
                String username = request.getParameter("User name");
                String fullname = request.getParameter("Full Name");
                String email = request.getParameter("Email");
                String mobile = request.getParameter("Mobile");
                edit.setGender(request.getParameter("gender"));
                edit.setRole(request.getParameter("System Role"));
                edit.setStatus(request.getParameter("Status"));
                edit.setNote(request.getParameter("Note"));
                edit.setId(id);
                try {
                    u.UpdateGroupCode(groups, id);
                } catch (NumberFormatException e) {
                    status = "errorGC";
                    errorParam = "egroup=" + groups;
                }
                try {
                    u.UpdateMobile(mobile, id);
                } catch (NumberFormatException e) {
                    status = status + "errorMb";
                    errorParam = (errorParam.length() == 0 ? "" : errorParam + "&") + "emobile=" + mobile;
                }
                user.setFirstname("");
                user.setMiddlename("");
                user.setLastname("");
                String[] part = fullname.trim().split(" ");
                try {
                    if (fullname.trim().length() == 0) {
                        User staff = u.getUserInformation(id);
                        edit.setFirstname(staff.getFirstname());
                        edit.setMiddlename(staff.getMiddlename());
                        edit.setLastname(staff.getLastname());
                        status = status + "errorNN";
                        errorParam = (errorParam.length() == 0 ? "" : errorParam + "&") + "fullname=" + fullname;
                    } else {
                        edit.setFirstname(part[0]);
                        String midName = "";
                        for (int i = 1; i < part.length - 1; i++) {
                            midName = (midName + " " + part[i]).trim();
                        }
                        edit.setMiddlename(midName);
                        if (part.length > 1) {
                            edit.setLastname(part[part.length - 1]);
                        }
                    }
                } catch (Exception e) {
                    User staff = u.getUserInformation(id);
                    edit.setFirstname(staff.getFirstname());
                    edit.setMiddlename(staff.getMiddlename());
                    edit.setLastname(staff.getLastname());
                    status = status + "errorNN";
                    errorParam = (errorParam.length() == 0 ? "" : errorParam + "&") + "fullname=" + fullname;
                }
                if (email.equals("")) {
                    status = status + "errorNE";
                } else {
                    User check = u.emailExist(email);
                    if (check != null && check.getId() != id) {
                        status = status + "errorEm";
                        errorParam = (errorParam.length() == 0 ? "" : errorParam + "&") + "eemail=" + email;
                    } else {
                        u.UpdateEmail(email, id);
                    }
                }
                if (username.equals("")) {
                    status = status + "errorNU";
                } else {
                    User check = u.usernameExist(username);
                    if (check != null && check.getId() != id) {
                        status = status + "errorUn";
                        errorParam = (errorParam.length() == 0 ? "" : errorParam + "&") + "eusername=" + username;
                    } else {
                        u.UpdateUsername(username, id);
                    }
                }
                u.UpdateUserInformation(edit);
            }
            if (status.length() == 0) {
                status = "success";
            } else {
                errorParam = (errorParam.length() == 0 ? "" : "&" + errorParam);
            }
            u.close();
            response.sendRedirect("userview?id=" + id + "&status=" + status + errorParam);
        } catch (IOException | NumberFormatException e) {
            response.sendRedirect("home");
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
