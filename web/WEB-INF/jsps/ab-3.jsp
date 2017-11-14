<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    List<Integer> number = new ArrayList<Integer>();
    for(int i=0; i<1000;i++)
        number.add(i);



%>
<c:set var = "listnumbers" value = "<%=number%>"/>
<c:set var = "text" value ="мое имя будет Сашок"/>

<?xml version="1.0" encoding="ISO-8859-1"?>
<DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach var ="n" items="${requestScope.at}">

    ${n.toString}
    <br>
    ${n.id}
    <br>

    <br>
    ${n.name}
    <br>

    <br>
    ${n.fam}
    <br>

    <br>
    ${n.mail}
    <br>

    <br>
    ${n.password}
    <br>
</c:forEach>


<hr>


My page


</body>
</html>
</DOCTYPE>