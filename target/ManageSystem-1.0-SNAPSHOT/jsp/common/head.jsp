<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Order Management System</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css" />
</head>
<body>
<!--Header -->
<header class="publicHeader">
    <h1>Order Management System</h1>
    <div class="publicHeaderR">
        <p><span>Hello </span><span style="color: #fff21b">${UserSession.userName}</span> , welcome!</p>
        <a href="${pageContext.request.contextPath }/logout.do">Exit</a>
    </div>
</header>

<section class="publicTime">
    <span id="time"></span>
</section>

<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>Check List<span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath }/jsp/bill.do?method=query">Order</a></li>
                <li><a href="${pageContext.request.contextPath }/jsp/provider.do?method=query">Supplier</a></li>
                <li><a href="${pageContext.request.contextPath }/jsp/user.do?method=query">User</a></li>
                <li><a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp">Reset Password</a></li>
                <li><a href="${pageContext.request.contextPath }/logout.do">Exit</a></li>
            </ul>
        </nav>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
