<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
    <c:set var="titleVal" value="주문내역" />
    <div class="tx-a-center m-b-30">${titleVal}</div>
        <table>
            <thead>
            <tr>
                <th width="5%"></th>
                <th width="20%">상품 이미지</th>
                <th width="25%">상품명</th>
                <th width="10%">판매가</th>
                <th width="10%">컬러</th>
                <th width="10%">사이즈</th>
                <th width="15%">수량</th>
                <th width="10%">주문금액</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${requestScope.purchased}">
                <tr id="purchase_wrap" data-price="${requestScope.detail.price}">
                    <td><a href="/user/review?iboard=${item.iboard}"><button class="bolder-sm">Review</button></a></td>
                    <td><img src="${item.img_url_big}" style="width: 100%; min-width: 120px; max-width: 200px;"></td>
                    <td><c:out value="${item.title}"/></td>
                    <td><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</td>
                    <td><c:choose>
                        <c:when test="${item.color == 1}">흰색</c:when>
                        <c:when test="${item.color == 2}">검정색</c:when>
                        <c:when test="${item.color == 3}">회색</c:when></c:choose>
                    </td>

                    <c:if test="${item.sm !=0 && item.sm != null}">
                        <td>sm<input hidden name="size" value="sm"></td>
                        <td class="upDown">
                            <input type="hidden" value="${item.sm}">
                            <span class="nowNum"><c:out value="${item.sm}"/></span>
                        </td>
                        <td><fmt:formatNumber value="${item.price * item.sm}" pattern="#,###"/>원</td>
                    </c:if>

                    <c:if test="${item.md !=0 && item.md != null}">
                        <td>md<input hidden name="size" value="md"></td>
                        <td class="upDown">
                            <input type="hidden" value="${item.md}">
                            <span class="nowNum"><c:out value="${item.md}"/></span>
                        </td>
                        <td><fmt:formatNumber value="${item.price * item.md}" pattern="#,###"/>원</td>
                    </c:if>

                    <c:if test="${item.lg !=0 && item.xl != null}">
                        <td>lg<input hidden name="size" value="lg"></td>
                        <td class="upDown">
                            <input type="hidden" value="${item.lg}">
                            <span class="nowNum"><c:out value="${item.lg}"/></span>
                        </td>
                        <td><fmt:formatNumber value="${item.price * item.lg}" pattern="#,###"/>원</td>
                    </c:if>

                    <c:if test="${item.xl !=0 && item.xl != null}">
                        <td>xl<input hidden name="size" value="xl"></td>
                        <td class="upDown">
                            <input type="hidden" value="${item.xl}">
                            <span class="nowNum"><c:out value="${item.xl}"/></span>
                        </td>
                        <td><fmt:formatNumber value="${item.price * item.xl}" pattern="#,###"/>원</td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${sessionScope.loginUser == null}">
            <c:set var="notIn" value="주문내역이 비어있습니다."/>
        <div class="tx-a-center p-tb-20">${notIn}</div>
        </c:if>

</div>