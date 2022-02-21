<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div>
    <div>브랜드 : ${requestScope.detail.brand}</div>
    <div>제품명 : ${requestScope.detail.title}</div>
    <div>가격 : ${requestScope.detail.price}</div>
    <div>카테고리 : ${requestScope.detail.category_num}</div>
    <div>성별 :  ${requestScope.detail.gender}</div>
    <img src="${requestScope.detail.img_url_big}">
</div>

    <select id="colorbox">
        <option value="" selected disabled>컬러선택</option>
        <c:forEach var="item" items="${requestScope.data}">
            <option value="${item.color}">
                    <c:if test="${item.color == 1}">
                        흰색
                    </c:if>
                    <c:if test="${item.color == 2}">
                        검정색
                    </c:if>
                    <c:if test="${item.color == 3}">
                        회색
                    </c:if>
            </option>
        </c:forEach>
    </select>
<%--  색깔 해당하는 사이즈만 뜨도록 --%>
<%-- 위에서 색상 선택하면 그 값으로 select 날리게 --%>

    <select id="sizebox">
        <option value="" selected disabled>사이즈선택</option>
    </select>

<form action="/board/purchase" method="post">
    <div>
        <%--   선택한 아이템 뜨게 --%>
        <ul id="selecteditem">
            <c:set var="color" value="${color}"/>
            <c:choose>
                <c:when test="${color == 1}">
                    흰색
                </c:when>
                <c:when test="${color == 2}">
                    검정색
                </c:when>
                <c:when test="${color == 3}">
                    회색
                </c:when>
            </c:choose>
        </ul>
        <input id="data" name="iboard" type="hidden" value="${requestScope.detail.iboard}" data-iboard="${requestScope.detail.iboard}">
    </div>

    <%-- 장바구니 담기 --%>
    <button href="/board/purchase" type="submit">
        장바구니에 담기
    </button>
</form>

<div>
<%--    <c:if test="${sessionScope.loginUser != null}">--%>
        <div class="m-t-20">
            <form id="cmtFrm">
                <div class="star-rating space-x-4 mx-auto">
                    <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                    <label for="5-stars" class="star pr-4">★</label>
                    <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                    <label for="4-stars" class="star">★</label>
                    <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                    <label for="3-stars" class="star">★</label>
                    <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                    <label for="2-stars" class="star">★</label>
                    <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>

                <input type="text" name="ctnt">
                <input type="button" id="btn_submit" value="댓글달기">
            </form>
        </div>
<%--    </c:if>--%>
    <div class="m-t-20" id="cmt_list"></div>
</div>