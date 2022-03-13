<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            검색하신 상품 목록이 없습니다.
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
        </c:otherwise>
    </c:choose>
</div>
<div class="pageInfo_wrap" >
    <ul class="pageInfo_area">
        <!-- 이전페이지 버튼 -->
        <c:if test="${pageMaker.prev}">
            <li class="pageInfo_btn previous"><a href="/board/prsearch?pageNum=${pageMaker.startPage - 1}&title=${requestScope.title}">Prev</a></li>
        </c:if>

        <!-- 각 번호 페이지 버튼 -->
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="pageInfo_btn num"><a href="/board/prsearch?pageNum=${num}&title=${requestScope.title}">${num}</a></li>
        </c:forEach>

        <!-- 다음페이지 버튼 -->
        <c:if test="${pageMaker.next}">
            <li class="pageInfo_btn next"><a href="/board/prsearch?pageNum=${pageMaker.endPage + 1}&title=${requestScope.title}">Next</a></li>
        </c:if>
    </ul>
</div>