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

String exam_name = request.getParameter("exam_name");
String day = request.getParameter("day");
String month = request.getParameter("month");
String year = request.getParameter("year");
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
    <div class="body-text"><h1>Ιστορικό ραντεβού</h1></div>
    





<%
if (request.getParameter("submit2") != null) {
%>

    <br>
        <h2 style="text-align:center">Όλα τα πραγματοποιημένα ραντεβού σας:</h2>
        <br>

     <table class="table table-bordered table-condensed table-hover">
        <tr class="info">
            <th>Εξέταση</th>
            <th>Ημερομηνία</th>
            <th>Γνωμάτευση</th>
        </tr>
        <%
        for (Feedback fb: feedbacks) {
            if (fb.getUsername().equals(customer.getUsername()) ) {
            
        
        %>
        <tr>
            <td><%if (fb.getExam_name().equals("Kardiologikes")) { %> Καρδιολογικές <% } else if (fb.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογικές <% } else { %> Αιματολογικές <%}%></td>
            <td><%=fb.getDay() %> / <%=fb.getMonth() %> / <%=fb.getYear() %></td>
            <td><a href="ShowDetails.jsp?examNameAtt=<%= fb.getExam_name()%>&dayAtt=<%= fb.getDay()%>&monthAtt=<%=fb.getMonth() %>&yearAtt=<%=fb.getYear() %>&detailsAtt=<%=fb.getDetails() %>" button class="deletebtn">Λεπτομερής Γνωμάτευση</button></td>
        </tr>



<%
        }   
    }
%>




    </table>


<% } else { %>

<h2 style="text-align:center">Το ραντεβού το οποίο αναζητείτε:</h2>
        <br>

     <table class="table table-bordered table-condensed table-hover">
        <tr class="info">
            <th>Εξέταση</th>
            <th>Ημερομηνία</th>
            <th>Γνωμάτευση</th>
        </tr>



        <% if (exam_name.equals("default")) {

             for (Feedback fb: feedbacks) {
                if (fb.getUsername().equals(customer.getUsername()) ) {
                    if (fb.getDay().equals(day) && fb.getMonth().equals(month) && fb.getYear().equals(year)) {
        %> 

        <tr>
            <td><%if (fb.getExam_name().equals("Kardiologikes")) { %> Καρδιολογική <% } else if (fb.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογική <% } else { %> Αιματολογική <%}  %></td>
            <td><%=fb.getDay() %> / <%=fb.getMonth() %> / <%=fb.getYear() %></td>
            <td><a href="ShowDetails.jsp?examNameAtt=<%= fb.getExam_name()%>&dayAtt=<%= fb.getDay()%>&monthAtt=<%=fb.getMonth() %>&yearAtt=<%=fb.getYear() %>&detailsAtt=<%=fb.getDetails() %>" button class="deletebtn">Λεπτομερής Γνωμάτευση</button></td>
        </tr>







                <%   }
                    }
                }
            }else {
                if (day.equals("default") || month.equals("default") || year.equals("default")) {
                    for (Feedback fb: feedbacks) {
                                        if (fb.getUsername().equals(customer.getUsername()) ) {
                                             if (fb.getExam_name().equals(exam_name)){
            %>



         <tr>
            <td><%if (fb.getExam_name().equals("Kardiologikes")) { %> Καρδιολογική <% } else if (fb.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογική <% } else { %> Αιματολογική <%}  %></td>
            <td><%=fb.getDay() %> / <%=fb.getMonth() %> / <%=fb.getYear() %></td>
            <td><a href="ShowDetails.jsp?examNameAtt=<%= fb.getExam_name()%>&dayAtt=<%= fb.getDay()%>&monthAtt=<%=fb.getMonth() %>&yearAtt=<%=fb.getYear() %>&detailsAtt=<%=fb.getDetails() %>" button class="deletebtn">Λεπτομερής Γνωμάτευση</button></td>
        </tr>



                 
                
            <% }
                 }
            }  
        }
     }
        %>





        <% if (!exam_name.equals("default") && !month.equals("default") && !day.equals("default") && !year.equals("default")) {

        for (Feedback fb: feedbacks) {
            
            if (fb.getUsername().equals(customer.getUsername()) ) {

                if (fb.getDay().equals(day) && fb.getMonth().equals(month) && fb.getYear().equals(year) && fb.getExam_name().equals(exam_name)) {

            


        %>
        <tr>
            <td><%if (fb.getExam_name().equals("Kardiologikes")) { %> Καρδιολογική <% } else if (fb.getExam_name().equals("Pneumonologikes")) { %> Πνευμονολογική <% } else { %> Αιματολογική <%}  %></td>
            <td><%=fb.getDay() %> / <%=fb.getMonth() %> / <%=fb.getYear() %></td>
            <td><a href="ShowDetails.jsp?examNameAtt=<%= fb.getExam_name()%>&dayAtt=<%= fb.getDay()%>&monthAtt=<%=fb.getMonth() %>&yearAtt=<%=fb.getYear() %>&detailsAtt=<%=fb.getDetails() %>" button class="deletebtn">Λεπτομερής Γνωμάτευση</button></td>
        </tr>

    <%
                }
            }
            }
    }
}
    %>

</table>

<%@ include file="footer.jsp" %>
    
</body>
</html>