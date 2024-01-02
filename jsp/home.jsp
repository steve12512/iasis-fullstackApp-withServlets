<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Home</title>
</head>
<body>
    

    <!--navbar-->
    <%
		if (session.getAttribute("customerObj2022") != null) {
	%>
    <a href="home.jsp">
        <img src="iasis.png" class="logo">
    </a>
    <nav>
        <div class='heading'>
            <h4>ΙΑΣΙΣ: Η διαγνωση ειναι η επιστημη μας.</h4>
        </div>
        <ul class='nav-links'>
            <li><a href="home.jsp" class="glyphicon glyphicon-home active"> Home</a></li>
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

    <div class="body-text"><h1>This is a Home Page</h1></div>

    <body style="text-align:center">
        <br>

        <h2>Welcome <code><%=customer.getName() %> <%=customer.getSurname() %></code></h2>



    </body>
    <%
    } else {
    %>
        <a href="home.jsp">
            <img src="iasis.png" class="logo">
        </a>
        <nav>
            <div class='heading'>
                <h4>ΙΑΣΙΣ: Η διαγνωση ειναι η επιστημη μας.</h4>
            </div>
            <ul class='nav-links'>
                <li><a href="home.jsp" class="glyphicon glyphicon-home active"> Home</a></li>
                <li><a href="book.jsp" class="glyphicon glyphicon-book">Κλείσιμο ραντεβού</a></li>
                <li><a href="cancel.jsp" class="glyphicon glyphicon-trash">Ακύρωση ραντεβού</a></li>
                <li><a href="history.jsp" class="glyphicon glyphicon-list-alt">Εμφάνιση αποτελεσμάτων (Ιστορικο)</a></li>
                <li><a href="exam.jsp" class="glyphicon glyphicon-pencil">Υποβολή νέας εξέτασης (Μόνο για Γραμματεία)</a></li>
            </ul>
        </nav>
    
    <div class="body-text"><h1>This is a Home Page</h1></div>
    
    
    <!--Body-->
    
    <body style="text-align:center">
    <br>
    
    <form action="log_in.jsp">
        <p>Έχετε ήδη λογαριασμό;</p>
        <button type="submit" class="btn glyphicon glyphicon-log-in btn-info">
            <b>Σύνδεση</b>
        </button>
    </form>
    <br>
    <form action="sign_up.jsp">
        <p>Δεν έχετε λογαριασμό;</p>
        <button type="submit" class="btn glyphicon glyphicon-user btn-info">
            <b>Εγγραφή</b>
        </button>
    </form>
    <div class="alert alert-dark" role="alert">
        <strong>Credentials Γραμματείας: </strong>
        <li>Username: <b>doctor</b></li>
        <li>Password: <b>doc1234</b></li>
    
</div>
    <%
} 
%>


    </body>


    <%@ include file="footer.jsp" %>

</body>
</html>