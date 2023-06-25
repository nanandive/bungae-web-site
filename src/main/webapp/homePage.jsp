<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>홈으로 이동하기</title>
<style>
	body {
		position: relative;
	}

	a {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,50%);
		color: red;
		font-size: 20px;
		text-decoration: none;
	}
	
	a:visited {
		color: red;
	}
	
	a:hover {
		color: red;
	}
	
	a:active {
		color: red;
	}
</style>
</head>
<body>
<a href="index.do">번개장터 홈으로 이동</a>
</body>
</html>
