<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Error</title>
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

    
    <div class="body-text"><h1>This is an error Page</h1></div>
    
    
    <!--Body-->
    
    <body style="text-align:center">
    <br>
    

    
    <div class="row">

        <div class="col-xs-12">

            <h2>Description</h2>

            <% if(exception != null) { %>	                  	
                <p><code><%=exception %></code></p>						
            <% } %>		

        </div>

    </div>

    </body>
    <!--footer-->
    <%@ include file="footer.jsp" %>

</body>
</html>