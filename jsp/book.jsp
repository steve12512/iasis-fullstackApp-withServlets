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
    <title>IASIS - Book</title>
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
            <li><a href="book.jsp" class="glyphicon glyphicon-book active">Κλείσιμο ραντεβού</a></li>
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
            <h1> Κλείστε ένα ραντεβού</h1><br>
            <form action="bookController.jsp" method="POST">
                

                <label for="exam">Διαθέσιμες Εξετάσεις:</label>
					
						<select class="form" name="exam_name">
				  			<option value="default"> -- -- </option>
				  			<option value="Kardiologikes">ΚΑΡΔΙΟΛΟΓΙΚΕΣ</option>
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

                <label for="time">Διαθέσιμες ώρες:</label>
                           
                        <select class="form" name="time">
                            <option value="default"> -- --</option>
                            <option value="9:00">9:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="12:00">12:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                        </select>

                <br><br>

                <div>
                    <div>
                      <button type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-ok"></span> Submit
                      </button> 
                      <button type="reset" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> Cancel
                      </button>              
                    </div>
                </div> 
                  

            
    
            </form>
        </div>
    </body>
<%}%>
    <!--footer-->
    <%@ include file="footer.jsp" %>

</body>
</html>