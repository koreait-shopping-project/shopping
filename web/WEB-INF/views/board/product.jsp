<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<select id="dataPerPage">
    <option value="10">10개씩보기</option>
    <option value="15">15개씩보기</option>
    <option value="20">20개씩보기</option>
</select>
<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            상품 목록이 없습니다.
        </c:when>
        <c:otherwise>
            <c:forEach items="${requestScope.list}" var="item">
                <a id="product_item_link" href="/board/productdetail/${item.iboard}">
                    <img src="${item.img_url_big}">
                    <p>${item.title}</p>
                    <p class="bold"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
                    <c:if test="${item.gender == 1}"><p>남성용</p></c:if>
                    <c:if test="${item.gender == 2}"><p>여성용</p></c:if>
                    <c:if test="${item.gender == 3}"><p>공용</p></c:if>
                </a>
            </c:forEach>
            <ul id="pagingul"></ul>
        </c:otherwise>
    </c:choose>
</div>