
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
    String name=session.getAttribute("name").toString();
        session.setAttribute("name", name);
String uname,age,blood,mobile,email,location,part;
uname=request.getParameter("name");
age=request.getParameter("age");
blood=request.getParameter("blood");
mobile=request.getParameter("mobile");
email=request.getParameter("email");
location=request.getParameter("location");
part=request.getParameter("part");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/organ", "root","root");
PreparedStatement pst=con.prepareStatement("insert into det (name,age,blood,mobile,email,location,part) values ('"+uname+"','"+age+"','"+blood+"','"+mobile+"','"+email+"','"+location+"','"+part+"') ");
pst.executeUpdate(); 
 out.println("<script>"
				+"alert('Form Added')"
				+"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/userhome.jsp");
                rd.include(request, response);
    }
    catch(Exception ex)
    {
     out.println("<script>"
				+"alert('Not Added')"
				+"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/userhome.jsp");
                rd.include(request, response);
    }
%>