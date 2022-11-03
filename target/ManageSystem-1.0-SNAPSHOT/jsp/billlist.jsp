<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp" %>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Order Management</span>
    </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath }/jsp/bill.do">
            <input name="method" value="query" class="input-text" type="hidden">
            <span>Product Name: </span>
            <input name="queryProductName" type="text" value="${queryProductName }">

            <span>Provider ID: </span>
            <select name="queryProviderId">
                <c:if test="${providerList != null }">
                    <option value="0">--Plese select--</option>
                    <c:forEach var="provider" items="${providerList}">
                        <option
                                <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
                                value="${provider.id}">${provider.proName}</option>
                    </c:forEach>
                </c:if>
            </select>

            <span>Is paid: </span>
            <select name="queryIsPayment">
                <option value="0">--Plese select--</option>
                <option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>Paid</option>
                <option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>Unpaid</option>
            </select>

            <input value="Search" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath }/jsp/billadd.jsp">Add order</a>
        </form>
    </div>

    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">Order ID</th>
            <th width="20%">Product Name</th>
            <th width="10%">Supplier</th>
            <th width="10%">Total Price</th>
            <th width="10%">Is Paid</th>
            <th width="10%">Create Time</th>
            <th width="30%">Operate</th>
        </tr>
        <c:forEach var="bill" items="${billList }" varStatus="status">
            <tr>
                <td>
                    <span>${bill.billCode }</span>
                </td>
                <td>
                    <span>${bill.productName }</span>
                </td>
                <td>
                    <span>${bill.providerName}</span>
                </td>
                <td>
                    <span>${bill.totalPrice}</span>
                </td>
                <td>
					<span>
						<c:if test="${bill.isPayment == 1}">Paid</c:if>
						<c:if test="${bill.isPayment == 2}">Unpaid</c:if>
					</span>
                </td>
                <td>
					<span>
					<fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
                </td>
                <td>
                    <span><a class="viewBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img
                            src="${pageContext.request.contextPath }/statics/images/read.png" alt="Inspect" title="Inspect"/></a></span>
                    <span><a class="modifyBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img
                            src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="Modify" title="Modify"/></a></span>
                    <span><a class="deleteBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img
                            src="${pageContext.request.contextPath }/statics/images/schu.png" alt="Delete" title="Delete"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</section>

<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>Tips</h2>
        <div class="removeMain">
            <p>Are you sure you want to delete this order?</p>
            <a href="#" id="yes">Yes</a>
            <a href="#" id="no">No</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billlist.js"></script>
