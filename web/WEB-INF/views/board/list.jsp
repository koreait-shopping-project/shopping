<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <c:if test="${fn:length(requestScope.list) == 0}">
        글이 없습니다.
    </c:if>
</div>
