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
            <c:set var="titleVal" value="Cart" />

            <c:forEach var="item" items="${requestScope.cart}">
                <p><img src="${item.img_url_big}"></p>
                <p>상품명 : <c:out value="${item.title}"/></p>
                <p>판매가 : <c:out value="${item.price}"/></p>
                <span>컬러 : </span>
                <c:choose>
                    <c:when test="${item.color == 1}">
                        흰색
                    </c:when>
                    <c:when test="${item.color == 2}">
                        검정색
                    </c:when>
                    <c:when test="${item.color == 3}">
                        회색
                    </c:when>
                </c:choose>
                <div>사이즈 :
                    <c:if test="${item.sm !=0 && item.sm != null}">
                        <span>sm</span></div><div>수량 : <c:out value="${item.sm}"/>개</div>
                        <div>총가격 : <fmt:formatNumber value="${item.price * item.sm}" pattern="#,###"/>원</div>
                    </c:if>
                    <c:if test="${item.md !=0 && item.md != null}">
                        <span>md</span></div><div>수량 : <c:out value="${item.md}"/>개</div>
                        <div>총가격 : <fmt:formatNumber value="${item.price * item.md}" pattern="#,###"/>원</div>
                    </c:if>
                    <c:if test="${item.lg !=0 && item.xl != null}">
                        <span>lg</span</div>><div>수량 : <c:out value="${item.lg}"/>개</div>
                        <div>총가격 : <fmt:formatNumber value="${item.price * item.lg}" pattern="#,###"/>원</div>
                    </c:if>
                    <c:if test="${item.xl !=0 && item.xl != null}">
                        <span>xl</span></div><div>수량 : <c:out value="${item.xl}"/>개</div>
                        <div>총가격 : <fmt:formatNumber value="${item.price * item.xl}" pattern="#,###"/>원</div>
                    </c:if>
            </c:forEach>

            <c:set var="notIn" value="장바구니가 비어있습니다."/>
        </c:when>
    </c:choose>
    <div class="tx-a-center m-b-30">${titleVal}</div>
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
                <div>
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
                <div class="m-20 font-size-14">
                    <form action="/board/list/${requestScope.icategory}" method="get" >
                        <span>검색어</span>
                        <select name="searchType">
                            <option value="1" ${requestScope.searchType == 1 ? 'selected' : ''}>제목</option>
                            <option value="2" ${requestScope.searchType == 2 ? 'selected' : ''}>내용</option>
                            <option value="3" ${requestScope.searchType == 3 ? 'selected' : ''}>글쓴이</option>
                        </select>
                        <input class="w-200" type="search" name="searchText">
                        <input class="bolder-p b-radius bc-black color-white m-10" type="submit" value="찾기">
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
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>