<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
    <c:set var="titleVal" value="공지사항" />
    <c:set var="notIn" value="글이 없습니다."/>
    <c:choose>
        <c:when test="${requestScope.icategory == 2}">
            <c:set var="titleVal" value="상품 Q/A" />
            <c:set var="notIn" value="글이 없습니다."/>
        </c:when>
        <c:when test="${requestScope.icategory == 3}">
            <%-------- cart -----------%>
            <c:set var="titleVal" value="Cart" />
            <div class="tx-a-center m-b-30">${titleVal}</div>
            <form id="cartForm">
                <table>
                    <thead>
                    <tr>
                        <th><input id="allCheck" type="checkbox" onclick="allChk(this);"></th>
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
                    <c:forEach var="item" items="${requestScope.cart}">
                        <tr>
                            <td><input name="RowCheck" type="checkbox" value="${item.icart}"/></td>
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
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" value="${item.sm}"><c:out value="${item.sm}"/>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.sm}" pattern="#,###"/>원</td>
                            </c:if>

                            <c:if test="${item.md !=0 && item.md != null}">
                                <td>md<input hidden name="size" value="md"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" value="${item.md}"><c:out value="${item.md}"/>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.md}" pattern="#,###"/>원</td>
                            </c:if>

                            <c:if test="${item.lg !=0 && item.xl != null}">
                                <td>lg<input hidden name="size" value="lg"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" value="${item.lg}"><c:out value="${item.lg}"/>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.lg}" pattern="#,###"/>원</td>
                            </c:if>

                            <c:if test="${item.xl !=0 && item.xl != null}">
                                <td>xl<input hidden name="size" value="xl"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" value="${item.xl}"><c:out value="${item.xl}"/>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.xl}" pattern="#,###"/>원</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${sessionScope.loginUser == null}">
                    <c:set var="notIn" value="장바구니가 비어있습니다."/>
                    <div class="tx-a-center p-tb-20">${notIn}</div>
                </c:if>
            </form>
            <div><input type="button" value="선택삭제" onclick="itemDel()"></div>
            <div><input type="button" value="선택주문" onclick="order()"></div>
            <%----------------------------------------------------------------------------%>
        </c:when>
    </c:choose>
    <%----------------------%>
    <div>
        <c:choose>
            <c:when test="${requestScope.icategory != 3}">
                <c:choose>
                    <c:when test="${fn:length(requestScope.list) == 0}">
                        <table>
                            <tr class="tx-a-center">
                                <th width="15%">Products</th>
                                <th width="65%">Title</th>
                                <th width="20%">Writer</th>
                            </tr>
                        </table>
                        ${notIn}
                    </c:when>
                    <c:otherwise>
                        <table>
                            <c:choose>
                                <c:when test="${requestScope.icategory == 1}">
                                    <tr class="tx-a-center">
                                        <th width="15%"></th>
                                        <th width="65%">Title</th>
                                        <th width="20%">Writer</th>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr class="tx-a-center">
                                        <th width="15%">Products</th>
                                        <th width="65%">Title</th>
                                        <th width="20%">Writer</th>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.icategory == 1}">
                                    <c:forEach items="${requestScope.list}" var="item">
                                        <tr class="record" data-iboard="${item.iboard}">
                                            <td class="tx-a-center">${item.notice}</td>
                                            <td><c:out value="${item.title}"/></td>
                                            <td class="tx-a-center">${item.writerNm}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${requestScope.list}" var="item">
                                        <tr class="record" data-iboard="${item.iboard}">
                                            <td class="tx-a-center">${item.iboard}</td>
                                            <td><c:out value="${item.title}"/></td>
                                            <td class="tx-a-center">${item.writerNm}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </table>
                    </c:otherwise>
                </c:choose>
                <div id="go_write">
                    <c:choose>
                        <c:when test="${requestScope.icategory == 1 && sessionScope.loginUser.admin_flag == true}">
                            <a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a>
                        </c:when>
                        <c:when test="${requestScope.icategory == 2 && sessionScope.loginUser != null}">
                            <a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a>
                        </c:when>
                    </c:choose>
                </div>

                <div>페이징이다</div>
                <div id="list_search_wrap">
                    <form action="/board/list/${requestScope.icategory}" method="get" id="list_search_frm">
                        <span class="color-gray">검색어</span>
                        <select name="searchType">
                            <option value="1" ${requestScope.searchType == 1 ? 'selected' : ''}>제목</option>
                            <option value="2" ${requestScope.searchType == 2 ? 'selected' : ''}>내용</option>
                            <option value="3" ${requestScope.searchType == 3 ? 'selected' : ''}>글쓴이</option>
                        </select>
                        <input type="search" name="searchText">
                        <input class="bc-black color-white" type="submit" value="찾기">
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="">
                    ${notIn}
                </c:if>
                <div>
                    <a href="">전체상품주문</a>
                    <a href="">선택상품주문</a>
                    <div>총합계 가격</div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

