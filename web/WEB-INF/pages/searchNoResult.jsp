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
<span>По вашему запросу ничего не найдено</span>
<a href="/home?id=${id}&page=${page}" class="btn btn-primary my-3" >Вернуться</a>
</div>

</body>
</html>