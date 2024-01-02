<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Σύνδεση</title>
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
        </ul>
    </nav>
    <div class="body-text"><h1> Σύνδεση χρήστη </h1></div>

    <body>
        <p style="text-align:center">
            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>

            <form method="POST" action="loginController.jsp">
				<br>
				
				<div class="form group">
					
				
					<!----Username -->
					<label for="username"><b>Username</b></label>
					<div>
				  		<input type="text" id="username" name="username" placeholder="Username" required>
					</div>
				
					<br>

					<!-- Password -->
					<label for="password"><b>Password</b></label>
					<br>
					<div>
				  		<input type="password" id="Password" name="password" placeholder="password" required>
					</div>
	
					<br><br>
					<!-- Buttons -->
					<div>
						<div>
                            <button class="btn btn-lg btn-primary" type="submit"><b>Σύνδεση</b></button>
						</div>
					</div>
				</div>
			</form>
        
        </p>
    </body>
    </div>
	<!--footer-->
    <%@ include file="footer.jsp" %>
</body>
</html>