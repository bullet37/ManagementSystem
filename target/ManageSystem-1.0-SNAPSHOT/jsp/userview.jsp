<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>User Management >> User info</span>
    </div>
    <div class="providerView">
        <p><strong>ID: </strong><span>${user.userCode }</span></p>
        <p><strong>Name: </strong><span>${user.userName }</span></p>
        <p><strong>Gender: </strong>
            <span>
            		<c:if test="${user.gender == 1 }">Male</c:if>
					<c:if test="${user.gender == 2 }">Female</c:if>
				</span>
        </p>
        <p><strong>Birthday: </strong><span>${user.birthday }</span></p>
        <p><strong>Phone: </strong><span>${user.phone }</span></p>
        <p><strong>Address: </strong><span>${user.address }</span></p>
        <p><strong>Role: </strong><span>${user.userRoleName}</span></p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="Back" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/userview.js"></script>
