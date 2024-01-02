<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="Java_Omadikh.*,java.util.*" %>


<%
String name = request.getParameter("name");
String surname = request.getParameter("surname");
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirm= request.getParameter("confirm");
String age = request.getParameter("age");
int x = 0;
boolean exist=false;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>ΙΑΣΙΣ - Έλεγχος</title>
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

    <body style="text-align:center">
    <div class="body-text">
        <h1>Έλεγχος στοιχείων εγγραφής</h1>
    </div>
    <br>
    
    <%
        
    if (name.length() < 3 || surname.length() < 3 || username.length() < 3 || password.length() < 5 || password.equals(confirm) == false || age.equals("default")) {
    %> 
    <li class="list-group-item list-group-item-danger">
        <p style="color: rgb(133, 64, 64);"></p>
    <div class="page-header">
        <h2>Εσφαλμένη υποβολή στοιχείων. Δοκιμάστε ξανά και προσέξτε:</h2>
    </div>
    <br>
    
    <%  
        if (name.length() < 3){
            x = x + 1;
            out.println(x + ". Το όνομα πρέπει να αποτελείται απο τουλάχιστον 3 χαρακτήρες");
        }
    %> <br>
                    
    <%
        if (surname.length() < 3){
            x = x + 1;
            out.println(x + ". Το επίθετο πρέπει να αποτελείται απο τουλάχιστον 3 χαρακτήρες");
        }
    %> <br>

    <%
        if (username.length() < 3){
            x = x + 1;
            out.println(x + ". Το username πρέπει να αποτελείται απο τουλάχιστον 3 χαρακτήρες");
        }
    %> <br>   
    <%
        if (password.length() < 5){
            x = x + 1;
            out.println(x + ". Ο κωδικός πρόσβασης πρέπει να αποτελείται απο τουλάχιστον 5 χαρακτήρες");
        }
    %> <br>
    <%    
        if (password.equals(confirm) == false || confirm == null) {
            x = x + 1;
            out.println(x + ". Ο κωδικός και η επιβεβαίωση κωδικού δεν ταιρίαζουν");
        }
    %>
    <br>
    <%
    if (age.equals("default")) {
        x = x + 1;
        out.println(x + ". Επιλέξτε έγκυρη ηλικία");
    }
    %>
    <% x = 0; %>
        </p>
    </li>
    <br><br>
    <a href="sign_up.jsp"
    <button type="button" class="btn btn-info">
        <span class="glyphicon glyphicon-chevron-left"> </span> Πίσω στη φόρμα
    </button>
    </a>
    <%
    } else {
    %>

    <%
    Customer customer = new Customer(name, surname, username, password, age);
    CustomerService custService = new CustomerService();

    try {
        custService.register(customer);
    } catch (Exception e) {
        request.setAttribute("message", e.getMessage());
        exist=true;
    }

    %>
    <% if (exist == false) { %>
    <br>
    <li class="list-group-item list-group-item-success"><p style="color: rgb(24, 114, 36);">
        <div class="page-header">
            <h2>Έγκυρη υποβολή στοιχείων!</h2>
        </div>
        <b>Όνομα:</b> <% out.println(name);%><br>
        <b>Επίθετο:</b> <% out.println(surname);%><br>
        <b>Username:</b> <% out.println(username);%><br>
        <b>Ηλικία:</b> <% out.println(age);%><br>
    </p></li>
    <br><br>
    <a href="log_in.jsp"
    <button type="button" class="btn btn-info">
        Σύνδεση <span class="glyphicon glyphicon-log-in"> </span>
    </button>
    </a>
    <% } else { %>
        <div class="alert alert-danger text-center" role="alert">
            <b>Username already exists!</b>
        </div>
        <a href="sign_up.jsp"
    <button type="button" class="btn btn-info">
       <span class="glyphicon glyphicon-chevron-left">  <b>Πίσω στη φόρμα </b></span>
    </button>
    </a>
    <% } %>
    <!--Body-->
    
   
    <br>    
    </body>


<%
}
%>



    <!--footer-->
    <%@ include file="footer.jsp" %>


</body>
</html>