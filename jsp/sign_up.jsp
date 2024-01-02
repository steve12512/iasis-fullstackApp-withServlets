<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Εγγραφή</title>
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
    <div class="body-text"><h1>Εγγραφή</h1></div>

    <body>
        <p style="text-align:center">
            <form action="sign_upController.jsp" method="POST">
				<br>
				
				<div class="form group">
					
				
					<!-- name -->
					<label for="name"><b>Όνομα χρήστη</b></label>
					<div>
				  		<input type="text" id="name" name="name" placeholder="Όνομα">
					</div>
				
					<br>

					<!-- surname -->

					<label for="surname"><b>Επίθετο χρήστη</b></label>
					<div>
				  		<input type="text" id="surname" name="surname" placeholder="Επίθετο">
					</div>
				
				 	<br>

                    <!-- Username -->

					<label for="Username"><b>Username</b></label>
					<div>
				  		<input type="text" id="username" name="username" placeholder="Username">
					</div>
				
				 	<br>
				
                    	<!-- password -->

					<label for="password"><b>Κωδικός χρήστη </b></label>
					<div>
				  		<input type="password" id="password" name="password" placeholder="Πληκτρολογήστε τον κωδικό σας">
					</div>
				
				 	<br>

					<label for="password"><b> Επιβεβαίωση κωδικού </b></label>
					<div>
					   <input type="password" id="confirm" name="confirm" placeholder="Επιβεβαιώστε τον κωδικό σας">
					</div>
				 
					<br>

                    	<!-- Ηλικία -->

					<label for="age"><b>Ηλικία χρήστη</b></label>
					<div>
				  		<select class="form" name="age">
						<option value= "default">-- --</option>
						
						<%
						for (int i=18; i<=100; i++) {
						%>

						<option value="<%=i%>"><%out.println(i);%></option>
						<%
						}
						%>
						
					</select>
					</div>
				
				 	<br><br>
				
						<div>
						  <button type="submit" class="btn btn-success btn-lg">
							<span class="glyphicon glyphicon-plus"></span> Δημιουργία νέου χρήστη
						  </button> 
						  <button type="reset" class="btn btn-danger btn-lg">
							<span class="glyphicon glyphicon-remove"></span> Ακύρωση
						  </button>
                          
    
                                     
						</div>
					</div>
				</div>
			</form>
        
        </p>
		<!--footer-->
		<%@ include file="footer.jsp" %>
    

	</body> 
</html>