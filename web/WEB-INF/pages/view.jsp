<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="include/header.jsp" %>
    <title>Информация о книге</title>
</head>
<body>
<div class="col-xl- mx-4">
    <h1>Информация о книге</h1>

    <table class="table table-striped table-bordered">
        <tr>
            <td>Название</td>
            <td>${bookAttribute.title}</td>
        </tr>
        <tr>
            <td>Автор</td>
            <td>${bookAttribute.author}</td>
        </tr>
        <tr>
            <td>Описание</td>
            <td>${bookAttribute.description}</td>
        </tr>
        <tr>
            <td>ISBN</td>
            <td>${bookAttribute.isbn}</td>
        </tr>
        <tr>
            <td>Год выпуска</td>
            <td>${bookAttribute.printYear}</td>
        </tr>
        <tr>
            <td>Прочитана?</td>
            <td>${book.readAlready ? 'Да' : 'Нет'}</td>
        </tr>
    </table>

    <a href="/read?id=${id}&page=${page}" class="btn btn-primary my-2">Вернуться</a>
</div>
</body>
</html>
