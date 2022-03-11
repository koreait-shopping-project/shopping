<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<div id="pageUnit_wrap">--%>
<%--    <select id="pageUnit" name="pageUnit">--%>
<%--        <option value="10" <c:if test="${SearchVo.pageUnit == 10}">selected="selected"</c:if>>10개씩보기</option>--%>
<%--        <option value="15" <c:if test="${SearchVo.pageUnit == 15}">selected="selected"</c:if>>15개씩보기</option>--%>
<%--        <option value="20" <c:if test="${SearchVo.pageUnit == 20}">selected="selected"</c:if>>20개씩보기</option>--%>
<%--        <option value="25" <c:if test="${SearchVo.pageUnit == 25}">selected="selected"</c:if>>25개씩보기</option>--%>
<%--        <option value="30" <c:if test="${SearchVo.pageUnit == 30}">selected="selected"</c:if>>30개씩보기</option>--%>
<%--    </select>--%>
<%--</div>--%>
<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            상품 목록이 없습니다.
        </c:when>
        <c:otherwise>
            <div id="product_list" data-isubcategory="${isubcategory}">
            <c:forEach items="${requestScope.list}" var="item">
                <a id="product_item_link" href="/board/productdetail/${item.iboard}">
                    <img src="${item.img_url_big}">
                    <p>${item.title}</p>
                    <p class="bold"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
                    <c:if test="${item.gender == 1}"><p>남성용</p></c:if>
                    <c:if test="${item.gender == 2}"><p>여성용</p></c:if>
                    <c:if test="${item.gender == 3}"><p>공용</p></c:if>
                <c:forEach items="${requestScope.like}" var="item">
                    <p><i style="color: plum" class="fa-solid fa-2x fa-heart">${item.likeNum}</i></p>
                </a>
                </c:forEach>
            </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="pageInfo_wrap" >
        <ul class="pageInfo_area">
        <!-- 이전페이지 버튼 -->
        <c:if test="${pageMaker.prev}">
            <li class="pageInfo_btn previous"><a href="/board/product/${isubcategory}?pageNum=${pageMaker.startPage - 1}">Prev</a></li>
        </c:if>

        <!-- 각 번호 페이지 버튼 -->
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="pageInfo_btn num"><a href="/board/product/${isubcategory}?pageNum=${num}">${num}</a></li>
        </c:forEach>

        <!-- 다음페이지 버튼 -->
        <c:if test="${pageMaker.next}">
            <li class="pageInfo_btn next"><a href="/board/product/${isubcategory}?pageNum=${pageMaker.endPage + 1}">Next</a></li>
        </c:if>
        </ul>
    </div>
</div>