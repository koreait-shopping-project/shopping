<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    마이페이지
</div>
<div>
    <c:choose>
        <c:when test="${sessionScope.loginUser != null}">
            <a href="/user/checkpw">회원 정보 수정</a>
        </c:when>
    </c:choose>
</div>
