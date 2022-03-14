<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <div class="tx-a-center m-b-30 bold font-size-20">
        My Page
    </div>
    <div class="tx-a-center font-size-20 color-black">
        <c:choose>
            <c:when test="${sessionScope.loginUser != null}">
                <div>
                    <ui>
                        <li><a href="/user/purchased">주문내역</a></li>
                        <li><a href="/user/checkpw">회원정보</a></li>
                    </ui>
                </div>
            </c:when>
        </c:choose>
    </div>
</div>

