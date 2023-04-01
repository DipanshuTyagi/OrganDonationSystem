
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name,password;
name=request.getParameter("name");
password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/organ", "root","root");
String s133="select * from reg where name='"+name+"' and pass='"+password+"'  ";
PreparedStatement pst = con.prepareStatement(s133);
ResultSet rss = pst.executeQuery();
if(rss.next())
{
    session.setAttribute("name", name);
    out.println("<script>"
				+"alert('Welcome " + name + "')"
				+"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/userhome.jsp");
                rd.include(request, response);
}
else if(name.equals("admin")&&password.equals("admin"))
{
out.println("<script>"
				+"alert('Welcome Admin')"
				+"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/adminhome.jsp");
                rd.include(request, response);
}
else
{
out.println("<script>"
                        +"alert('Invalid Username & Password')"
                        +"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
                rd.include(request, response);
}
%>