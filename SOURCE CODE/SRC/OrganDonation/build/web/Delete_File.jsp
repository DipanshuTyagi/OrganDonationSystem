
<%@page import="java.sql.*"%>
<%
  String id=request.getParameter("id");
   String  name=request.getParameter("name");
  
          
    Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/organ","root","root");
   PreparedStatement ps=con.prepareStatement(" Delete from reg Where id='"+id+"'");
   System.out.println(ps);
   ps.executeUpdate();
   out.print(" Delete File successfully ");
   out.println("<script>"); 			
   out.println("alert(\"Delete File successfully \")");
   out.println("</script>");
        RequestDispatcher rd=request.getRequestDispatcher("/viewusers.jsp");  
        rd.include(request, response);  
  

%>