
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name,password,mobile,email,location,country;
name=request.getParameter("name");
password=request.getParameter("password");
mobile=request.getParameter("mobile");
email=request.getParameter("email");
location=request.getParameter("location");
country=request.getParameter("country");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/organ", "root","root");
        String s133="insert into reg (name,pass,mobile,email,location,country) values ('"+name+"','"+password+"','"+mobile+"','"+email+"','"+location+"','"+country+"') ";
        PreparedStatement pst = con.prepareStatement(s133);
        pst.executeUpdate();
        out.println("<script>"
                        +"alert('Details Inserted..')"
                        +"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/register.jsp");
                rd.include(request, response);
%>