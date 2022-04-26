/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.groupcontroller;

import dao.GroupDAO;
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
import model.Group;
import model.User;

/**
 *
 * @author Minh Hieu Pham
 */
@WebServlet(name = "UpdateGroupController", urlPatterns = {"/updategroup"})
public class UpdateGroupController extends HttpServlet {

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
            out.println("<title>Servlet UpdateGroupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateGroupController at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();

            User p = (User) session.getAttribute("user");
            if (p == null) {
                response.sendRedirect("login");
                return;
            }
            if (!p.getRole().equals("HR")) {
                response.sendRedirect("home");
            } else {
                String id_raw = request.getParameter("id");
                int id = 0;
                try {
                    id = Integer.parseInt(id_raw);
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
                GroupDAO grdb = new GroupDAO();
                Group g = grdb.getGroupById(id);

                List<User> managers = grdb.getAllTeamLeader();
                List<Group> parentGroup = grdb.getAllGroups();

                request.setAttribute("managers", managers);
                request.setAttribute("parentGroup", parentGroup);
                request.setAttribute("g", g);
                request.setAttribute("oldcode", g.getCode());
                request.setAttribute("oldname", g.getName());
                request.setAttribute("group", g);
                grdb.close();
                request.getRequestDispatcher("groupdetail.jsp").forward(request, response);
            }
        } catch (IOException | NumberFormatException | ServletException e) {
            response.sendRedirect("home");
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
            String id_raw = request.getParameter("id");
            String code = request.getParameter("code");
            String name = request.getParameter("name");
            String manager_id_raw = request.getParameter("manager");
            String parentGroupCode = request.getParameter("parentGroupCode");
            String grType = request.getParameter("grType");
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            String oldname = request.getParameter("oldname");
            String oldcode = request.getParameter("oldcode");

            int id = 0;
            try {
                id = Integer.parseInt(id_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            int manager_id = 0;
            try {
                if (manager_id_raw != null && !manager_id_raw.equals("")) {
                    manager_id = Integer.parseInt(manager_id_raw);
                }

            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            int parent_team_id = 0;

            GroupDAO grdb = new GroupDAO();
            Group g = grdb.getGroupByName(name);

            Group g2 = grdb.getGroupByCode(code);

            List<User> managers = grdb.getAllTeamLeader();
            List<Group> parentGroup = grdb.getAllGroups();

            request.setAttribute("managers", managers);
            request.setAttribute("parentGroup", parentGroup);
            UserDAO udb = new UserDAO();
            User u = udb.managerGetByGroupId(id);
            request.setAttribute("code", code);
            request.setAttribute("name", name);
            request.setAttribute("manager_id", manager_id_raw);
            request.setAttribute("parentGroupCode", parentGroupCode);
            request.setAttribute("grType", grType);
            request.setAttribute("status", status);
            request.setAttribute("description", description);

            Group group = new Group();
            group.setId(id);
            group.setName(name);
            group.setCode(code);
            group.setManager(u);
            group.setParent_team_code(parentGroupCode);
            group.setStatus(status);
            group.setTeam_type(grType);
            group.setDescription(description);
            request.setAttribute("g", group);
            if ((g != null && !g.getName().equals(oldname)) || (g2 != null && !g2.getCode().equals(oldcode))) {
                if (g != null && !g.getName().equals(oldname)) {
                    request.setAttribute("error", "Group name has already existed!");
                }

                if (g2 != null && !g2.getCode().equals(oldcode)) {
                    request.setAttribute("error4", "Group code has already existed!");
                }
                request.setAttribute("oldcode", oldcode);
                request.setAttribute("oldname", oldname);
                request.getRequestDispatcher("groupdetail.jsp").forward(request, response);
                udb.close();
                grdb.close();
                return;
            }
            grdb.updateGroupInGroupDetail(id, code, name, manager_id, parent_team_id, status, description, grType);
            udb.close();
            grdb.close();
            request.setAttribute("oldcode", code);
            request.setAttribute("oldname", name);
            request.setAttribute("success", "Update successfully!");
            request.getRequestDispatcher("groupdetail.jsp").forward(request, response);

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
