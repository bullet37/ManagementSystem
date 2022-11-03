<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Supplier Info >> Add Supplier</span>
    </div>
    <div class="providerAdd">
        <form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/jsp/provider.do">
            <input type="hidden" name="method" value="add">

            <div class="">
                <label for="proCode">ID: </label>
                <input type="text" name="proCode" id="proCode" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="proName">Name: </label>
                <input type="text" name="proName" id="proName" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="proContact">Contact: </label>
                <input type="text" name="proContact" id="proContact" value="">
                <font color="red"></font>

            </div>
            <div>
                <label for="proPhone">Phone: </label>
                <input type="text" name="proPhone" id="proPhone" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="proAddress">Address: </label>
                <input type="text" name="proAddress" id="proAddress" value="">
            </div>
            <div>
                <label for="proFax">Fax: </label>
                <input type="text" name="proFax" id="proFax" value="">
            </div>
            <div>
                <label for="proDesc">Description: </label>
                <input type="text" name="proDesc" id="proDesc" value="">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/provideradd.js"></script>
