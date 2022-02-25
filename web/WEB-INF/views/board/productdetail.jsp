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
                <td class="blod"><fmt:formatNumber value="${requestScope.detail.price}" pattern="#,###"/>원</td>
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
                                검정색
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
            </div>
        <form method="post" id="frmSubmit">
            <div id="purchase_wrap">
                <ul id="selected_items">
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
                <input type="hidden" name="uid" value="${sessionScope.loginUser.uid}">
            </div>
            <input type="submit" value="바로구매" href="/board/purchase" onclick="submitBtn('purchase')">
            <input type="submit" value="장바구니" href="/board/cart" onclick="submitBtn('cart')">
        </form>
    </section>
</div>