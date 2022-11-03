<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Order Management >> Add order</span>
    </div>
    <div class="providerAdd">
        <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
            <input type="hidden" name="method" value="add">
            <div class="">
                <label for="billCode">Id: </label>
                <input type="text" name="billCode" class="text" id="billCode" value="">

                <font color="red"></font>
            </div>
            <div>
                <label for="productName">Name: </label>
                <input type="text" name="productName" id="productName" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="productUnit">Unit: </label>
                <input type="text" name="productUnit" id="productUnit" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="productCount">Number: </label>
                <input type="text" name="productCount" id="productCount" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="totalPrice">Total Price: </label>
                <input type="text" name="totalPrice" id="totalPrice" value="">
                <font color="red"></font>
            </div>
            <div>
                <label >Provider: </label>
                <select name="providerId" id="providerId">
                </select>
                <font color="red"></font>
            </div>
            <div>
                <label >Is paid: </label>
                <input type="radio" name="isPayment" value="1" checked="checked">Paid
                <input type="radio" name="isPayment" value="2" >Unpaid
            </div>
            <div class="providerAddBtn">
                <input type="button" name="add" id="add" value="Save">
                <input type="button" id="back" name="back" value="Back" >
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billadd.js"></script>
