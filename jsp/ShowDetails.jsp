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

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>IASIS - Γνωμάτευση</title>
</head>
<body>
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

    <body>
        <div class="form">

            <h1> Λεπτομερής Γνωμάτευση </h1>
            <%
            String examNameAtt = request.getParameter("examNameAtt");
            String dayAtt = request.getParameter("dayAtt");
            String monthAtt = request.getParameter("monthAtt");
            String yearAtt = request.getParameter("yearAtt");
            String detailsAtt = request.getParameter("detailsAtt");
            %>
            <br><br>


            <div class="panel panel-warning">
                <div class="panel-heading">
                  <h3 class="panel-title"><b>Εξέταση:</b><%if (examNameAtt.equals("Kardiologikes")) { %> Καρδιολογικές <% } else if (examNameAtt.equals("Pneumonologikes")) { %> Πνευμονολογικές <% } else { %> Αιματολογικές <%}%><br>
                    <b>Ημερομηνία:</b> <% out.println(dayAtt);%> / <% out.println(monthAtt);%> / <% out.println(yearAtt);%><br></h3>
                </div>
                <div class="panel-body">
                    <code><%=detailsAtt%></code>
                </div>
              </div>

           

            <a href="history.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-left">  <b>Πίσω στο Ιστορικό </b></span>
    </button>
    </a>
        </div>
        
    </body>

    <!--footer-->
    <%}%>
    <%@ include file="footer.jsp" %>

</body>
</html>