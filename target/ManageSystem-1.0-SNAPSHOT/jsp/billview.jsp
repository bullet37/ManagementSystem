<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Order Management >> Order info</span>
    </div>
    <div class="providerView">
        <p><strong>ID: </strong><span>${bill.billCode }</span></p>
        <p><strong>Name: </strong><span>${bill.productName }</span></p>
        <p><strong>Unit: </strong><span>${bill.productUnit }</span></p>
        <p><strong>Number: </strong><span>${bill.productCount }</span></p>
        <p><strong>Total price: </strong><span>${bill.totalPrice }</span></p>
        <p><strong>Supplier: </strong><span>${bill.providerName }</span></p>
        <p><strong>Is paid: </strong>
            <span>
         		<c:if test="${bill.isPayment == 1}">Paid</c:if>
				<c:if test="${bill.isPayment == 2}">Unpaid</c:if>
			</span>
        </p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="Back" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billview.js"></script>
