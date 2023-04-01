

<%@page import="com.mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
String from="1croreprojectsvadapalani";
    String pass="qweasd12345";
    String subject="Registration Link";
    String message="http://localhost:8080/OrganDonation/register.jsp";
    mail mm = new mail();
    mm.sendFromGMail(from, pass, email, subject, message);
    out.println("<script>"
                        +"alert('Your Request Sent Successfully')"
                        +"</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
                rd.include(request, response);
%>
