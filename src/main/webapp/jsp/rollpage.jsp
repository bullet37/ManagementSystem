<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="page-bar">
    <ul class="page-num-ul clearfix">
        <li>${param.totalCount } Logs &nbsp;&nbsp; ${param.currentPageNo }/${param.totalPageCount }Pages</li>
        <c:if test="${param.currentPageNo > 1}">
            <a href="javascript:page_nav(document.forms[0],1);">Front page</a>
            <a href="javascript:page_nav(document.forms[0],${param.currentPageNo-1});">Previous page</a>
        </c:if>
        <c:if test="${param.currentPageNo < param.totalPageCount }">
            <a href="javascript:page_nav(document.forms[0],${param.currentPageNo+1 });">Next page</a>
            <a href="javascript:page_nav(document.forms[0],${param.totalPageCount });">Last page</a>
        </c:if>
        &nbsp;&nbsp;
    </ul>
    <span class="page-go-form"><label>Jump to</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />Page
	     <button type="button" class="page-btn" onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/rollpage.js"></script>
</html>
