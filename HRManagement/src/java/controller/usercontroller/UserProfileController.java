package controller.usercontroller;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.GroupDAO;
import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Group;
import model.PushImageFromLocal;
import model.User;
@MultipartConfig

/**
 *
 * @author Duc Huy
 */
@WebServlet(name = "UserProfileController", urlPatterns = {"/profile"})
public class UserProfileController extends HttpServlet {

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
            out.println("<title>Servlet UserProfileController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileController at " + request.getContextPath() + "</h1>");
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
       request.getRequestDispatcher("userprofile.jsp").forward(request, response);
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
        User user = (User) session.getAttribute("user");
        if (user == null) {
        response.sendRedirect("home");
        }else
        {
        int id = user.getId();
        Part part = request.getPart("avata");
        String image = part.getSubmittedFileName();
        String firstname = request.getParameter("firstname");
        String phone = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        Date date = Date.valueOf(request.getParameter("date"));
        List<Group> group = new GroupDAO().getAllGroupByUserId(id);
        request.setAttribute("group", group);
        UserDAO userDAO = new UserDAO();
        user.setAva(image);
        user.setFirstname(firstname);
        user.setMobile(phone);
        user.setGender(gender);
        user.setBirthdate(date);
        String oldImage = user.getAva();
        boolean ans = userDAO.UpdateUserProfile(user);
        if (ans) {
            String path = request.getRealPath("/") + "image" + File.separator + user.getAva();
            if (PushImageFromLocal.saveFile(part.getInputStream(), path)) {
                      out.print("Update success");
                      String valid = "Update profile success";
                      request.setAttribute("valid", valid);
                } else{
                    String valid = "Something went wrong...";
                    request.setAttribute("valid", valid);
                }          
        } else {
            out.print("Not updated...");
            String valid = "Something went wrong...";
            request.setAttribute("valid", valid);
        }
        response.sendRedirect("userprofile.jsp");
//        request.setAttribute("Success", "Successfully");
//        request.getRequestDispatcher("userprofile.jsp").forward(request, response);
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
