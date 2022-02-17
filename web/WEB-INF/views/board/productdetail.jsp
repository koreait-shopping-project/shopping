<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div>
    <div>브랜드 : ${requestScope.detail.brand}</div>
    <div>제품명 : ${requestScope.detail.title}</div>
    <div>가격 : ${requestScope.detail.price}</div>
    <div>카테고리 : ${requestScope.detail.category_num}</div>
    <div>성별 :  ${requestScope.detail.gender}</div>
    <img src="${requestScope.detail.img_url}">

</div>
<div id="data" data-iboard="${requestScope.detail.iboard}">
</div>

<%--<c:forEach items="${requestScope.color}" var="item">--%>
<%--    <div>색상 : ${item.color}</div>--%>
<%--    <div>스몰 : ${item.sm}</div>--%>
<%--    <div>미디움 : ${item.md}</div>--%>
<%--    <div>라지 : ${item.lg}</div>--%>
<%--    <div>엑스라지 : ${item.xl}</div>--%>
<%--</c:forEach>--%>

    <select name="colorbox" id="colorbox">
        <option>컬러선택</option>
        <c:forEach var="item" items="${requestScope.color}">
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
    <select name="size" id="selecbox">

    </select>

<%--    <select name="size">--%>
<%--        <option>사이즈선택</option>--%>
<%--        <option value="1">${item.color}</option>--%>
<%--        <option value="2">검정색</option>--%>
<%--        <option value="3">회색</option>--%>
<%--    </select>--%>

<div>
    <c:if test="${sessionScope.loginUser != null}">
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
    </c:if>
</div>