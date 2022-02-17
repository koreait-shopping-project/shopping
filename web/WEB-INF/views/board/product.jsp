<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            상품 목록이 없습니다.
        </c:when>
        <c:otherwise>
            <c:forEach items="${requestScope.list}" var="item">
                <a id="product_item_link" href="/board/productdetail/${item.iboard}">
                    <img src="${item.img_url}">
                    <div>브랜드 : <span>${item.brand}</span></div>
                    <div>제품명 : <span>${item.title}</span></div>
                    <div>가격 : <span>${item.price}</span></div>
                    <div>성별 : <span>${item.gender}</span></div>
                </a>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>