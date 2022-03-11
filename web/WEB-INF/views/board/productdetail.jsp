<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="detail_container">
    <section id="detail_img_wrap">
        <img src="${requestScope.detail.img_url_big}">
    </section>
    <section id="detail_wrap">
        <table id="detail_table">
            <tr>
                <th>브랜드</th>
                <td>${requestScope.detail.brand}</td>
            </tr>
            <tr>
                <th>제품명</th>
                <td>${requestScope.detail.title}</td>
            </tr>
            <tr>
                <th>분류</th>
                <td>${requestScope.detail.subcategorynm}</td>
            </tr>
            <tr>
                <th>가격</th>
                <td><span class="bold letter-spacing-0125rem"><fmt:formatNumber value="${requestScope.detail.price}" pattern="#,###"/>원</span></td>
            </tr>
            <tr>
                <th>구분</th>
                <td>
                    <c:if test="${requestScope.detail.gender == 1}">남성용</c:if>
                    <c:if test="${requestScope.detail.gender == 2}">여성용</c:if>
                    <c:if test="${requestScope.detail.gender == 3}">공용</c:if>
                </td>
            </tr>
        </table>

        <div id="detail_box_wrap">
            <select id="colorbox">
                <option value="" selected disabled>컬러선택</option>
                <c:forEach var="item" items="${requestScope.data}">
                    <option value="${item.color}">
                        <c:if test="${item.color == 1}">
                            흰색
                        </c:if>
                        <c:if test="${item.color == 2}">
                            검정
                        </c:if>
                        <c:if test="${item.color == 3}">
                            회색
                        </c:if>
                    </option>
                </c:forEach>
            </select>
            <select id="sizebox">
                <option value="" selected disabled>사이즈선택</option>
            </select>
            <span>
                <c:if test="${sessionScope.loginUser != null}">
                <!-- 좋아요 -->
                    <i id="like_icon" class="fs-30 pointer far fa-heart"></i>
                </c:if>
            </span>
        </div>

        <form method="post" id="frmSubmit">
            <div id="purchase_wrap" style="position: relative;" data-price="${requestScope.detail.price}">
                <ul id="selected_items">
                    <c:set var="color" value="${color}"/>
                    <c:choose>
                        <c:when test="${color == 1}">
                            흰색
                        </c:when>
                        <c:when test="${color == 2}">
                            검정
                        </c:when>
                        <c:when test="${color == 3}">
                            회색
                        </c:when>
                    </c:choose>
                </ul>
                <input id="data" name="iboard" type="hidden" value="${requestScope.detail.iboard}" data-iboard="${requestScope.detail.iboard}">
                <input id="iuser" name="iuser" type="hidden" value="${requestScope.iuser}" data-iuser="${requestScope.iuser}">
            </div>
            <div id="allPrice">total : 0</div>
            <input type="submit" value="바로구매" onclick="submitBtn('order')">
            <input type="submit" value="장바구니 담기" onclick="submitBtn('cart')">
        </form>
    </section>
</div>