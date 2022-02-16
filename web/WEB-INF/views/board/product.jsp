<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div>
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            글이 없습니다.
        </c:when>
        <c:otherwise>
            <c:forEach items="${requestScope.list}" var="item">
                <div>브랜드 : ${item.brand}</div>
                <div>제품명 : ${item.title}</div>
                <div>가격 : ${item.price}</div>
                <div>카테고리 : ${item.category_num}</div>
                <div>성별 : ${item.gender}</div>
                <a href="/board/detail/${item.iboard}"><img src="${item.img_url}"></a>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>