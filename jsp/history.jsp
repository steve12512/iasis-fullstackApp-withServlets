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
FeedbackService feedbackServ = new FeedbackService();
List<Feedback> feedbacks = feedbackServ.getFeedbacks();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Ιστορικό</title>
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
            <li><a href="book.jsp" class="glyphicon glyphicon-book ">Κλείσιμο ραντεβού</a></li>
            <li><a href="cancel.jsp" class="glyphicon glyphicon-trash">Ακύρωση ραντεβού</a></li>
            <li><a href="history.jsp" class="glyphicon glyphicon-list-alt active">Εμφάνιση αποτελεσμάτων (Ιστορικο)</a></li>
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

<div class="form">
            <h1> Αναζητήστε την γνωμάτευση για το ραντεβού σας</h1><br>
            <form action="history_Controller.jsp" method="POST">
                

                <label for="exam">Επιλέξτε την εξέταση που πραγματοποιήσατε:</label>
					
						<select class="form" name="exam_name">
				  			<option value="default"> -- -- </option>
				  			<option value="Kardiologikes">ΚΑΡΔΙΟΛΟΓΙΚΗ</option>
				  			<option value="Pneumonologikes">ΠΝΕΥΜΟΝΟΛΟΓΙΚΕΣ</option>
				  			<option value="Aimatologikes">ΑΙΜΑΤΟΛΟΓΙΚΕΣ</option>
						</select>
                <br><br>


                <label for="day">Επιλέξτε ημερομηνία:(Μέρα/Μήνα/Έτος)</label>
                           
                <select class="form" name="day">
				  			<option value="default"> -- -- </option>
				  		<%
						for (int i=1; i<=31; i++) {
						%>

						<option value="<%=i%>"><%out.println(i);%></option>
						<%
						}
						%>
				</select>

                <select class="form" name="month">
                        <option value="default"> -- -- </option>
                <%
                for (int i=1; i<=12; i++) {
                %>
                <option value="<%=i%>"><%out.println(i);%></option>
                <%
                }
                %>
                </select>

                <select class="form" name="year">
                <option value="default"> -- -- </option>
                <%
                for (int i=2023; i<=2032; i++) {
                %>
                <option value="<%=i%>"><%out.println(i);%></option>
                <%
                }
                %>
                </select>

                <br><br>
                <% String show_all; %>
                

                <br>

                <div>
                    <div>
                      <button type="submit" class="btn btn-success" name = "submit1">    
                        <span class="glyphicon glyphicon-ok"></span> Submit
                      </button> 
                      <button type="reset" class="btn btn-danger" name = "cancel">  
                        <span class="glyphicon glyphicon-remove"></span> Cancel
                      </button>              
                    </div>
                </div> 
                  

                <br><br>
                <button type="submit" button class = "btn glyphicon glyphicon-list btn-info" name = "submit2">  
                 
            <b>Εμφάνιση όλων των εξετάσεων</b>
            </a> </button>
        </form>





<%}%>
        </div>
    </body>
        <%@ include file="footer.jsp" %>

</body>


</html>