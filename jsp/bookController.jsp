<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj2022");
String customer_username = customer.getUsername();
String exam_name = request.getParameter("exam_name");
String day = request.getParameter("day");
String month = request.getParameter("month");
String year = request.getParameter("year");
String time = request.getParameter("time");
boolean exist1 = false;
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Έλεγχος συμπλήρωσης ραντεβού</title>
</head>
<body>
    

    <!--navbar-->
    <a href="home.jsp">
        <img src="iasis.png" class="logo">
    </a>
    <nav>
        <div class='heading'>
            <h4>ΙΑΣΙΣ: Η διαγνωση ειναι η επιστημη μας.</h4>
        </div>
        <ul class='nav-links'>
            <li><a href="home.jsp" class="glyphicon glyphicon-home"> Home</a></li>
            <li><a href="book.jsp" class="glyphicon glyphicon-book">Κλείσιμο ραντεβού</a></li>
            <li><a href="cancel.jsp" class="glyphicon glyphicon-trash">Ακύρωση ραντεβού</a></li>
            <li><a href="history.jsp" class="glyphicon glyphicon-list-alt">Εμφάνιση αποτελεσμάτων (Ιστορικο)</a></li>
            <li><a href="exam.jsp" class="glyphicon glyphicon-pencil">Υποβολή νέας εξέτασης (Μόνο για Γραμματεία)</a></li>
            <li><p class="navbar-text"><code>Signed in as <b><%=customer.getUsername() %></b></code></p></li>
            <li>
                <a href="log_out.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
            </li>
        </ul>
    </nav>
    <%
    if (customer.getUsername().equals("doctor")) {
    %>
    <body>
		<div class="form">
		<h1>Sorry, restricted access.</h1>
        <br><br>
        <div class="alert alert-danger" role="alert">
            <b>Please, login as customer.</b>
          </div>
        </div>
    </body>
    <%} else {%>

    
    <div class="body-text">
        <h1>Έλεγχος στοιχείων ραντεβού</h1>
    </div>
    <br>

    <%
    if (exam_name.equals("default") || day.equals("default") || month.equals("default") || year.equals("default") || time.equals("default")) {
    %>
    <li class="list-group-item list-group-item-danger">
        <p style="color: rgb(133, 64, 64);"></p>
    <div class="page-header">
        <h2>Μη έγκυρη υποβολή πεδίων. Δοκιμάστε ξανά</h2>
    </div>
    </li>
    <br><br>
    <a href="book.jsp"
    <button type="button" class="btn btn-info">
        <span class="glyphicon glyphicon-chevron-left"> </span> Πίσω στο κλείσιμο ραντεβού
    </button>
    </a>

    <%
    } else {
    %>
        <!--edw-->
        <%
        Booking booking = new Booking(customer_username, exam_name, day, month, year, time);
        Booking_Service bookService = new Booking_Service();
        
        try {
            bookService.create_appointment(booking);
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
            exist1=true;
        }
        
        %>
    <!-- edw -->
    <% if (exist1 == false) { %>
    <br>
    <li class="list-group-item list-group-item-success"><p style="color: rgb(24, 114, 36);">
        <div class="page-header">
            <h2>Έγκυρη υποβολή στοιχείων!</h2>
        </div>
        <b>Εξέταση:</b> <%if (booking.getExam_name().equals("Kardiologikes")) { %> Καρδιολογικές <% } else if (booking.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογικές <% } else { %> Αιματολογικές <%}%><br>
        <b>Ημερομηνία:</b> <% out.println(day);%> / <% out.println(month);%> / <% out.println(year);%><br>
        <b>Ώρα:</b> <% out.println(time);%><br>
    </p></li>
    <br><br>
    <a href="cancel.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-right">  <b> Προβολή όλων των ραντεβού </b></span>
    </button>
    </a>
    <% } else { %>
        <div class="alert alert-danger text-center" role="alert">
            <b>This date is already booked.</b>
        </div>
        <a href="book.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-left">  <b>Πίσω στο κλείσιμο ραντεβού </b></span>
    </button>
    </a>
    <% } %>
<%
}
%>
<!--Body-->
    
<body style="text-align:center">
    <br>
    
    
    </body>
 <%}%>
    <!--footer-->
    <%@ include file="footer.jsp" %>

</body>
</html>