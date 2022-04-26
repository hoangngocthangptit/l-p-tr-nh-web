/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.slidercontroller;

import dao.SliderDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.PushImageFromLocal;
import model.Slider;
@MultipartConfig
/**
 *
 * @author Duc Huy
 */
@WebServlet(name = "SliderDetailController", urlPatterns = {"/slidedetail"})
public class SliderDetailController extends HttpServlet {

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
            out.println("<title>Servlet SliderDetailController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderDetailController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("sid"));        
        SliderDAO slider = new SliderDAO();
        Slider slide = slider.getSliderDetails(id);
        request.setAttribute("slidedetail", slide);
        slider.close();
        request.getRequestDispatcher("sliderdetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part part = request.getPart("image");
        String image = part.getSubmittedFileName();
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String backlink = request.getParameter("backlink");
        String status = request.getParameter("status");
        String note = request.getParameter("note");
        SliderDAO sliderdao = new SliderDAO();
        Slider slide = new Slider();
        slide.setId(id);
        slide.setTitle(title);
        slide.setBacklink(backlink);
        slide.setStatus(status);
        slide.setNote(note);
        slide.setImage(image);
        PrintWriter out = response.getWriter();
        boolean ans = sliderdao.UpdateSlider(slide);
        sliderdao.close();
        if (ans) {
            String path = request.getRealPath("/image") + File.separator + slide.getImage();
            if (PushImageFromLocal.saveFile(part.getInputStream(), path)) {
//                      slide = sliderdao.getSliderDetails(id);
//                      request.setAttribute("slide",slide);
                      String valid = "Update profile success";
                      request.setAttribute("valid", valid);
                } else{
                    String valid = "Something went wrong...";
                    request.setAttribute("valid", valid);
                }          
        } else {
            String valid = "Something went wrong...";
            request.setAttribute("valid", valid);
        }
        response.sendRedirect("sliderlist");

        
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
