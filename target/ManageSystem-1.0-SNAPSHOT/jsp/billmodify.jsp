<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Order Management >> Add order</span>
    </div>
    <div class="providerAdd">
        <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
            <input type="hidden" name="method" value="modifysave">
            <input type="hidden" name="id" value="${bill.id }">
            <div class="">
                <label for="billCode">ID: </label>
                <input type="text" name="billCode" id="billCode" value="${bill.billCode }" readonly="readonly">
            </div>
            <div>
                <label for="productName">Name: </label>
                <input type="text" name="productName" id="productName" value="${bill.productName }">
                <font color="red"></font>
            </div>
            <div>
                <label for="productUnit">Unit: </label>
                <input type="text" name="productUnit" id="productUnit" value="${bill.productUnit }">
                <font color="red"></font>
            </div>
            <div>
                <label for="productCount">Amount: </label>
                <input type="text" name="productCount" id="productCount" value="${bill.productCount }">
                <font color="red"></font>
            </div>
            <div>
                <label for="totalPrice">Total price: </label>
                <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice }">
                <font color="red"></font>
            </div>
            <div>
                <label for="providerId">Supplier: </label>
                <input type="hidden" value="${bill.providerId }" id="pid" />
                <select name="providerId" id="providerId">
                </select>
                <font color="red"></font>
            </div>
            <div>
                <label >Is paid: </label>
                <c:if test="${bill.isPayment == 1 }">
                    <input type="radio" name="isPayment" value="1" checked="checked">Unpaid
                    <input type="radio" name="isPayment" value="2" >Paid
                </c:if>
                <c:if test="${bill.isPayment == 2 }">
                    <input type="radio" name="isPayment" value="1">Unpaid
                    <input type="radio" name="isPayment" value="2" checked="checked">Paid
                </c:if>
            </div>
            <div class="providerAddBtn">
                <input type="button" name="save" id="save" value="Save">
                <input type="button" id="back" name="back" value="Back" >
            </div>
        </form>
    </div>

</div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billmodify.js"></script>
