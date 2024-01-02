<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj2022");
String customer_username = request.getParameter("username");
String exam_name = request.getParameter("exam_name");
String day = request.getParameter("day");
String month = request.getParameter("month");
String year = request.getParameter("year");
String details = request.getParameter("details");
boolean exist1 = false;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Έλεγχος συμπλήρωσης γνωμάτευσης</title>
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
        </ul>
    </nav>

    
    <div class="body-text">
        <h1>Έλεγχος στοιχείων γνωμάτευσης</h1>
    </div>
    <br>

    <%
    if (customer_username.equals("default") || exam_name.equals("default") || day.equals("default") || month.equals("default") || year.equals("default") || details.length() == 0) {
    %>
    <li class="list-group-item list-group-item-danger">
        <p style="color: rgb(133, 64, 64);"></p>
    <div class="page-header">
        <h2>Μη έγκυρη υποβολή πεδίων. Δοκιμάστε ξανά</h2>
    </div>
    </li>
    <br><br>
    <a href="exam.jsp"
    <button type="button" class="btn btn-info">
        <span class="glyphicon glyphicon-chevron-left"> </span> <b>Πίσω στη συμπλήρωση γνωμάτευσης</b>
    </button>
    </a>
    <%
    } else {
    %>
    <%
    Feedback feedback = new Feedback(customer_username, exam_name, day, month, year, details);
    FeedbackService feedbackServ = new FeedbackService();
   

    try {
        feedbackServ.create_feedback(feedback);
       
    } catch (Exception e) {
        request.setAttribute("message", e.getMessage());
        exist1=true;
    }
    %>
    <% if (exist1 == false) { %>
        <br>
    <li class="list-group-item list-group-item-success"><p style="color: rgb(24, 114, 36);">
        <div class="page-header">
            <h2>Έγκυρη υποβολή στοιχείων!</h2>
        </div>
        <b>Username ασθενούς:</b> <% out.println(customer_username);%><br>
        <b>Εξέταση:</b> <%if (feedback.getExam_name().equals("Kardiologikes")) { %> Καρδιολογικές <% } else if (feedback.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογικές <% } else { %> Αιματολογικές <%}%><br>
        <b>Ημερομηνία:</b> <% out.println(day);%> / <% out.println(month);%> / <% out.println(year);%><br>
        <b>Γνωμάτευση:</b> <% out.println(details);%><br>
</p></li>
    <br><br>
    <a href="exam.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-right">  <b> Υποβολή νέας γνωμάτευσης </b></span>
    </button>
    </a>
    <% } else { %>
        <div class="alert alert-danger text-center" role="alert">
            <b>Feedback for this date & exam is already created.</b>
        </div>
        <a href="exam.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-left">  <b>Πίσω στην υποβολή γνωμάτευσης</b></span>
    </button>
    </a>
    <% } %>
<%
}
%>
<body style="text-align:center">
    <br>
</body>

 <!--footer-->
 <%@ include file="footer.jsp" %>

</body>
</html>