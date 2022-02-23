<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="detail_container">
    <section id="detail_img_wrap">
        <img src="${requestScope.detail.img_url_big}">
    </section>
    <section id="detail_wrap">
        <p>브랜드 : ${requestScope.detail.brand}</p>
        <p>제품명 : ${requestScope.detail.title}</p>
        <p>분류 : ${requestScope.detail.category_num}</p>
        <p class="bold"><fmt:formatNumber value="${requestScope.detail.price}" pattern="#,###"/>원</p>
        <c:if test="${requestScope.detail.gender == 1}"><p>남성용</p></c:if>
        <c:if test="${requestScope.detail.gender == 2}"><p>여성용</p></c:if>
        <c:if test="${requestScope.detail.gender == 3}"><p>공용</p></c:if>
        <div id="detail_colorbox_wrap">
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

            <form action="/board/purchase" method="post" id="purchase_frm">
                <div id="purchase_wrap">
                    <%--   선택한 아이템 뜨게 --%>
                    <ul id="selected_item">
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
        </div>
    </section>
</div>