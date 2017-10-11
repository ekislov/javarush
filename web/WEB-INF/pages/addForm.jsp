<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="include/header.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Добавление новой книги</title>
</head>
<body>

<div class="col-xl- mx-4">
<h1>Добавление новой книги</h1>

<form:form method="POST" modelAttribute="bookEntity" action="checkAdd" class="form-signin">
    <table>
        <tr>
            <td>Название:</td>
            <td><form:input path="title" cssClass="form-control"/></td>
            <td><form:errors path="title" cssStyle="color: red"/></td>
        </tr>

        <tr>
            <td>Автор:</td>
            <td><form:input path="author" cssClass="form-control"/></td>
            <td><form:errors path="author" cssStyle="color: red"/></td>
        </tr>

        <tr>
            <td>ISBN:</td>
            <td><form:input path="isbn" cssClass="form-control"/></td>
            <td><form:errors path="isbn" cssStyle="color: red"/></td>
        </tr>

        <tr>
            <td>Описание:</td>
            <td><form:input path="description" cssClass="form-control"/></td>
            <td><form:errors path="description" cssStyle="color: red"/></td>
        </tr>

        <tr>
            <td>Год выпуска:</td>
            <td><form:input path="printYear" cssClass="form-control"/></td>
            <td><form:errors path="printYear" cssStyle="color: red"/></td>
        </tr>

    </table>

    <input type="submit" value="Добавить" class="btn btn-primary my-1" />
</form:form>
</div>

</body>
</html>