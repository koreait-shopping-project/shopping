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
                <div data-isubcategory="${item.isubcategory}">
                    <div>${item.brand}</div>
                    <div><c:out value="${item.title}"/></div>
                    <div>${item.price}</div>
                    <div>${item.category_num}</div>
                    <div>${item.gender}</div>
                    <img src="${item.img_url}">
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>