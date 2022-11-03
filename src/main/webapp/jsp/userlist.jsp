<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>User Management </span>
    </div>
    <div class="query">
        <form method="get" action="${pageContext.request.contextPath }/jsp/user.do">
            <input name="method" value="query" class="input-text" type="hidden">
            <span>Name: </span>
            <input name="queryname" class="input-text"	type="text" value="${queryUserName }">

            <span>Role: </span>
            <select name="queryUserRole">
                <c:if test="${roleList != null }">
                    <option value="0">--Please select--</option>
                    <c:forEach var="role" items="${roleList}">
                        <option <c:if test="${role.id == queryUserRole }">selected="selected"</c:if>
                                value="${role.id}">${role.roleName}</option>
                    </c:forEach>
                </c:if>
            </select>

            <input type="hidden" name="pageIndex" value="1"/>
            <input	value="Search" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath}/jsp/useradd.jsp" >Add user</a>
        </form>
    </div>

    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">ID</th>
            <th width="20%">Name</th>
            <th width="10%">Gender</th>
            <th width="10%">Age</th>
            <th width="10%">Phone</th>
            <th width="10%">Role</th>
            <th width="30%">Operate</th>
        </tr>
        <c:forEach var="user" items="${userList }" varStatus="status">
            <tr>
                <td>
                    <span>${user.userCode }</span>
                </td>
                <td>
                    <span>${user.userName }</span>
                </td>
                <td>
							<span>
								<c:if test="${user.gender==1}">Male</c:if>
								<c:if test="${user.gender==2}">Female</c:if>
							</span>
                </td>
                <td>
                    <span>${user.age}</span>
                </td>
                <td>
                    <span>${user.phone}</span>
                </td>
                <td>
                    <span>${user.userRoleName}</span>
                </td>
                <td>
                    <span><a class="viewUser" href="javascript:;" userid=${user.id } username=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/read.png" alt="Inspect" title="Inspect"/></a></span>
                    <span><a class="modifyUser" href="javascript:;" userid=${user.id } username=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="Modify" title="Modify"/></a></span>
                    <span><a class="deleteUser" href="javascript:;" userid=${user.id } username=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/schu.png" alt="Delete" title="Delete"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
    <c:import url="rollpage.jsp">
        <c:param name="totalCount" value="${totalCount}"/>
        <c:param name="currentPageNo" value="${currentPageNo}"/>
        <c:param name="totalPageCount" value="${totalPageCount}"/>
    </c:import>
</div>
</section>


<div class="zhezhao"></div>
<div class="remove" id="removeUser">
    <div class="removerChid">
        <h2>Tips</h2>
        <div class="removeMain">
            <p>Are you sure you want to delete this user?</p>
            <a href="#" id="yes">Yes</a>
            <a href="#" id="no">No</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/userlist.js"></script>
