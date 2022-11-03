<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>Your current location: </strong>
        <span>Supplier Info >> Supplier info</span>
    </div>
    <div class="providerView">
        <p><strong>ID: </strong><span>${provider.proCode }</span></p>
        <p><strong>Name: </strong><span>${provider.proName }</span></p>
        <p><strong>Contact: </strong><span>${provider.proContact }</span></p>
        <p><strong>Phone: </strong><span>${provider.proPhone }</span></p>
        <p><strong>Fax: </strong><span>${provider.proFax }</span></p>
        <p><strong>Description: </strong><span>${provider.proDesc}</span></p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="back" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/providerview.js"></script>
