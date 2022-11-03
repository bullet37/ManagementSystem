<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>User Management >> User modify</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/jsp/user.do">
            <input type="hidden" name="method" value="modifyexe">
            <input type="hidden" name="uid" value="${user.id }"/>
            <div>
                <label for="userName">Name: </label>
                <input type="text" name="userName" id="userName" value="${user.userName }">
                <font color="red"></font>
            </div>
            <div>
                <label >Gender: </label>
                <select name="gender" id="gender">
                    <c:choose>
                        <c:when test="${user.gender == 1 }">
                            <option value="1" selected="selected">Male</option>
                            <option value="2">Female</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">Male</option>
                            <option value="2" selected="selected">Female</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div>
                <label >Birthday: </label>
                <input type="text" Class="Wdate" id="birthday" name="birthday" value="${user.birthday }"
                       readonly="readonly" onclick="WdatePicker();">
                <font color="red"></font>
            </div>

            <div>
                <label >Phone: </label>
                <input type="text" name="phone" id="phone" value="${user.phone }">
                <font color="red"></font>
            </div>
            <div>
                <label >Address: </label>
                <input type="text" name="address" id="address" value="${user.address }">
            </div>
            <div>
                <label >Role: </label>
                <input type="hidden" value="${user.userRole}" id="rid" />
                <select name="userRole" id="userRole"></select>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="button" name="save" id="save" value="Save" />
                <input type="button" id="back" name="back" value="Back"/>
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/usermodify.js"></script>