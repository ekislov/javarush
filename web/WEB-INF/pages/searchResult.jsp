<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="include/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Результат поиска</title>
</head>
<body>

<div class="col-xl- mx-4">
<h1>Результат поиска</h1>
<a href="/home?id=${id}&page=${page}" class="btn btn-primary my-3">Вернуться</a>
<table class="table table-striped table-bordered">
	<thead>
	<tr>
		<th>Название</th>
		<th>Автор</th>
		<th>ISBN</th>
		<th>Описание</th>
		<th>Год написания</th>
		<th>Прочитана?</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${books}" var="book">
		<tr>
			<td><c:out value="${book.title}" /></td>
			<td><c:out value="${book.author}" /></td>
			<td><c:out value="${book.isbn}" /></td>
			<td><c:out value="${book.description.length()>20 ? book.description.substring(0,20)+='...'  : book.description}" /></td>
			<td><c:out value="${book.printYear}" /></td>
			<td><c:out value="${book.readAlready ? 'Да' : 'Нет'}" /></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

</body>
</html>