<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="titleVal" value="공지사항" />
<c:choose>
    <c:when test="${requestScope.icategory == 2}">
        <c:set var="titleVal" value="상품 Q/A" />
    </c:when>
    <c:when test="${requestScope.icategory == 3}">
        <c:set var="titleVal" value="Cart" />
    </c:when>
</c:choose>
<div>${titleVal}</div>
<div>
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            글이 없습니다.
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>No</th>
                    <th>Title</th>
                    <th>Writer</th>
                </tr>
                <c:forEach items="${requestScope.list}" var="item">
                    <tr class="record" data-iboard="${item.iboard}">
                        <td>${item.iboard}</td>
                        <td><c:out value="${item.title}"/></td>
                        <td>${item.writerNm}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <div>
        <c:if test="${sessionScope.loginUser != null}">
            <a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a>
        </c:if>
    </div>
</div>
