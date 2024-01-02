<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
%>

<%

CustomerService custSer = new CustomerService();

try {

    Customer customer = custSer.authenticate(username, password);
    session.setAttribute("customerObj2022", customer);
    response.sendRedirect("home.jsp");
%>
<jsp:forward page="home.jsp" />
<%
} catch (Exception e) {
    
    request.setAttribute("message", e.getMessage());
%>
<jsp:forward page="log_in.jsp" />
<%
}
%>