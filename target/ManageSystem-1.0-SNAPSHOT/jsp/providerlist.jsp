<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp" %>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Supplier Info</span>
    </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath}/jsp/provider.do">
            <input name="method" value="query" type="hidden">
            <span>ID: </span>
            <input name="queryProCode" type="text" value="${queryProCode }">

            <span>Name: </span>
            <input name="queryProName" type="text" value="${queryProName }">

            <input value="Search" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath }/jsp/provideradd.jsp">Add provider</a>
        </form>
    </div>

    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">ID</th>
            <th width="20%">Name</th>
            <th width="10%">Contact</th>
            <th width="10%">Phone</th>
            <th width="10%">Fax</th>
            <th width="10%">Create time</th>
            <th width="30%">Operate</th>
        </tr>
        <c:forEach var="provider" items="${providerList}" varStatus="status">
            <tr>
                <td>
                    <span>${provider.proCode }</span>
                </td>
                <td>
                    <span>${provider.proName }</span>
                </td>
                <td>
                    <span>${provider.proContact}</span>
                </td>
                <td>
                    <span>${provider.proPhone}</span>
                </td>
                <td>
                    <span>${provider.proFax}</span>
                </td>
                <td>
					<span>
					<fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
                </td>
                <td>
                <span><a class="viewProvider" href="javascript:;"
                         proid=${provider.id } proname=${provider.proName }><img
                        src="${pageContext.request.contextPath }/statics/images/read.png" alt="Inspect"
                        title="Inspect"/></a></span>
                    <span><a class="modifyProvider" href="javascript:;"
                             proid=${provider.id } proname=${provider.proName }><img
                            src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="Modify"
                            title="Modify"/></a></span>
                    <span><a class="deleteProvider" href="javascript:;"
                             proid=${provider.id } proname=${provider.proName }><img
                            src="${pageContext.request.contextPath }/statics/images/schu.png" alt="Delete" title="Delete"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</section>

<div class="zhezhao"></div>
<div class="remove" id="removeProv">
    <div class="removerChid">
        <h2>Tips</h2>
        <div class="removeMain">
            <p>Are you sure you want to delete this supplier?</p>
            <a href="#" id="yes">Yes</a>
            <a href="#" id="no">No</a>
        </div>
    </div>
</div>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/providerlist.js"></script>