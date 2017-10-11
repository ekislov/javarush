<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="include/header.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Книги</title>
</head>
<body>

<div class="col-xl- mx-4">
    <div class="page-header">
        <h1>Книги</h1>
        <form action="/search" method="get" class="form-inline">
            <input name="title" id="inputEmail" class="form-control" />
            <input type="submit" value="Искать" class="btn btn-info ml-3" />
        </form>
        <div class="my-1"><a href="/add?page=${page}">Добавить</a></div>
    </div>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Название</th>
            <th>Автор</th>
            <th>ISBN</th>
            <th>Описание</th>
            <th>Год написания</th>
            <th>Прочитана?</th>
            <th colspan="3"></th>
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
                <td><a href="/view?id=${book.id}&page=${page}">Прочитать</a></td>
                <td><a href="/edit?id=${book.id}&page=${page}">Редактировать</a></td>
                <td><a href="/delete?id=${book.id}&page=${page}">Удалить</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="navbar-default navbar-fixed-bottom  mb-3">
        <c:if test="${page > 1}">
        <a href="/?page=${page-1}" class="btn btn-secondary">Предыдущая</a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
            <c:when test="${page == i.index}">
                <span class="btn btn-primary">${i.index}</span>
            </c:when>
            <c:otherwise>
                <a href="/?page=${i.index}" class="btn btn-secondary">${i.index}</a>
            </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${page + 1 <= maxPages}">
        <a href="/?page=${page+1}" class="btn btn-secondary">Следующая</a>
        </c:if>
    </div>

</div>

</body>
</html>