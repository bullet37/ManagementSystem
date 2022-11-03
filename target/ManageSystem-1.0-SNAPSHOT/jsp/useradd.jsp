<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>User Management  >> Add user</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/jsp/user.do">
            <input type="hidden" name="method" value="add">

            <div>
                <label for="userCode">ID: </label>
                <input type="text" name="userCode" id="userCode" value="">

                <font color="red"></font>
            </div>
            <div>
                <label for="userName">Name: </label>
                <input type="text" name="userName" id="userName" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="userPassword">Password: </label>
                <input type="password" name="userPassword" id="userPassword" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="ruserPassword">Confirm password:</label>
                <input type="password" name="ruserPassword" id="ruserPassword" value="">
                <font color="red"></font>
            </div>
            <div>
                <label >Gender: </label>
                <select name="gender" id="gender">
                    <option value="1" selected="selected">Male</option>
                    <option value="2">Female</option>
                </select>
            </div>
            <div>
                <label for="birthday">Birthday: </label>
                <input type="text" Class="Wdate" id="birthday" name="birthday"
                       readonly="readonly" onclick="WdatePicker();">
                <font color="red"></font>
            </div>
            <div>
                <label for="phone">Phone: </label>
                <input type="text" name="phone" id="phone" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="address">Address: </label>
                <input name="address" id="address"  value="">
            </div>
            <div>
                <label >Role: </label>
                <select name="userRole" id="userRole"></select>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="button" name="add" id="add" value="Save" >
                <input type="button" id="back" name="back" value="Back" >
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/useradd.js"></script>
