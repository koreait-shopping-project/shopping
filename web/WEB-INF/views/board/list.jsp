<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="titleVal" value="공지사항" />
<c:set var="notIn" value="글이 없습니다."/>
<c:choose>
    <c:when test="${requestScope.icategory == 2}">
        <c:set var="titleVal" value="상품 Q/A" />
        <c:set var="notIn" value="글이 없습니다."/>
    </c:when>
    <c:when test="${requestScope.icategory == 3}">
        <c:set var="titleVal" value="Cart" />
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
                            <th width="10%">Products</th>
                            <th width="75%">Title</th>
                            <th width="15%">Writer</th>
                        </tr>
                    </table>
                    ${notIn}
                </c:when>
                <c:otherwise>
                    <table>
                        <c:choose>
                            <c:when test="${requestScope.icategory == 1}">
                                <tr class="tx-a-center">
                                    <th width="10%"></th>
                                    <th width="75%">Title</th>
                                    <th width="15%">Writer</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr class="tx-a-center">
                                    <th width="10%">Products</th>
                                    <th width="75%">Title</th>
                                    <th width="15%">Writer</th>
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
            <div>검색이다</div>
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
