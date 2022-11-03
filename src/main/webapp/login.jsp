<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Please Login-Order Manage System</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <script>

    </script>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>Order Management System</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="${pageContext.request.contextPath}/login.do" name="actionForm" id="actionForm" method="post">
            <div class="info">${error}</div>
            <div class="inputbox">
                <label>Username：</label>
                <input type="text" class="input-text" id="userCode" name="userCode" placeholder="Please enter your username: " required/>
            </div>
            <div class="inputbox">
                <label>Password：</label>
                <input type="password" id="userPassword" name="userPassword" placeholder="Please enter your password: " required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="Login"/>
                <input type="reset" value="Reset"/>
            </div>
        </form>
    </section>
</section>
</body>
</html>
