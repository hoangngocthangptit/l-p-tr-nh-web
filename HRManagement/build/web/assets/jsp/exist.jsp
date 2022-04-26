<%-- 
    Document   : exist
    Created on : Jan 15, 2022, 4:51:23 PM
    Author     : ZenBook
--%>

<%@page import="dao.UserDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Test here</title>
    </head>
    <body>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://hr.cyj41au55ncu.ap-southeast-1.rds.amazonaws.com/HR_Management", "admin", "p5Dckj6qsRuB4kjA");
            PreparedStatement ps = con.prepareStatement("select * from User where username = ?");
            ps.setString(1, request.getParameter("username"));
            ResultSet res = ps.executeQuery();
            UserDAO u = new UserDAO();
            if (res.next()) {
                out.print("User already exists");
            } else {
                out.print("User name is valid");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        %>
    </body>
</html>