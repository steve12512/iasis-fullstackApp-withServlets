<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <meta http-equiv="refresh" content="2;url=home.jsp" />
    <title>ΙΑΣΙΣ - Αποσύνδεση</title>
</head>

<body style="text-align:center">
<br><br><br>
    <div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιηθηκε με επιτυχία</div>		



    <%@ include file="footer.jsp" %>
</body>
</html>

