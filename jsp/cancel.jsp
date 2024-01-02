<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>

<%
if (session.getAttribute("customerObj2022") == null) {

	request.setAttribute("message", "You need to login first to access this page");
%>
	<jsp:forward page="log_in.jsp" />
<%
return;
}
%>

<%
Booking_Service bookServ = new Booking_Service();
List<Booking> bookings = bookServ.getBookings();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Ακύρωση ραντεβού</title>
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
            <li><a href="cancel.jsp" class="glyphicon glyphicon-trash active">Ακύρωση ραντεβού</a></li>
            <li><a href="history.jsp" class="glyphicon glyphicon-list-alt">Εμφάνιση αποτελεσμάτων (Ιστορικο)</a></li>
            <li><a href="exam.jsp" class="glyphicon glyphicon-pencil">Υποβολή νέας εξέτασης (Μόνο για Γραμματεία)</a></li>
            <li>
                <%
                Customer customer = (Customer)session.getAttribute("customerObj2022");
                %>
                <p class="navbar-text"><code>Signed in as <b><%=customer.getUsername() %></b></code></p>
            </li>
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
    <div class="body-text"><h1>Τα ραντεβού μου / Ακύρωση ραντεβού</h1></div>
    <br>
    <h2 style="text-align:center">Όλα τα προσεχώς ραντεβού σας:</h2>
    <br>
</body>
<body>
    <table class="table table-bordered table-condensed table-hover">
        <tr class="info">
            <th>Εξέταση</th>
            <th>Ημερομηνία</th>
            <th>Ώρα</th>
            <th>Ακύρωση</th>
        </tr>
        <%
        for (Booking bk: bookings) {
            if (bk.getCustomer_username().equals(customer.getUsername()) ) {
        %>
        <tr>
            <td><%if (bk.getExam_name().equals("Kardiologikes")) { %> Καρδιολογικές <% } else if (bk.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογικές <% } else { %> Αιματολογικές <%}%></td>
            <td><%=bk.getDay() %> / <%=bk.getMonth() %> / <%=bk.getYear() %></td>
            <td><%=bk.getTime() %></td>
            
            <td><a href="cancelController.jsp?examNameAtt=<%= bk.getExam_name()%>&dayAtt=<%= bk.getDay()%>&monthAtt=<%=bk.getMonth() %>&yearAtt=<%=bk.getYear() %>&timeAtt=<%=bk.getTime() %>" button class="deletebtn">Διαγραφή</button></td>
        </tr>
        <%
            }
        }
        %>
    </table>

</body>
<%}%>
<%@ include file="footer.jsp" %>
</html>