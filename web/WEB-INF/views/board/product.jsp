<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="pageUnit_wrap">
    <select id="pageUnit" name="pageUnit">
        <option value="10" <c:if test="${SearchVo.pageUnit == 10}">selected="selected"</c:if>>10개씩보기</option>
        <option value="15" <c:if test="${SearchVo.pageUnit == 15}">selected="selected"</c:if>>15개씩보기</option>
        <option value="20" <c:if test="${SearchVo.pageUnit == 20}">selected="selected"</c:if>>20개씩보기</option>
        <option value="25" <c:if test="${SearchVo.pageUnit == 25}">selected="selected"</c:if>>25개씩보기</option>
        <option value="30" <c:if test="${SearchVo.pageUnit == 30}">selected="selected"</c:if>>30개씩보기</option>
    </select>
</div>
<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            상품 목록이 없습니다.
        </c:when>
        <c:otherwise>
            <div id="product_list">
            <c:forEach items="${requestScope.list}" var="item" begin="1" end="15">
                <a id="product_item_link" href="/board/productdetail/${item.iboard}">
                    <img src="${item.img_url_big}">
                    <p>${item.title}</p>
                    <p class="bold"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
                    <c:if test="${item.gender == 1}"><p>남성용</p></c:if>
                    <c:if test="${item.gender == 2}"><p>여성용</p></c:if>
                    <c:if test="${item.gender == 3}"><p>공용</p></c:if>
                </a>
            </c:forEach>
            </div>
            <div id="page_container">
                <ul id="pagingul"></ul>
            </div>
        </c:otherwise>
    </c:choose>
</div>