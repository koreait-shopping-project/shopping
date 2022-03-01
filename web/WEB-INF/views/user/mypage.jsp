<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <div class="tx-a-center m-b-30 bold font-size-20">
        My Page
    </div>
    <div class="tx-a-center font-size-20">
        <c:choose>
            <c:when test="${sessionScope.loginUser != null}">
                <div class="display-i-b p-r-100">
                    <ui>
                        <li><a href="#">구매 목록</a></li>
                        <li><a href="/user/checkpw">회원 정보</a></li>
                    </ui>
                </div>
                <div class="display-i-b">
                    <ui>
                        <li><a href="/user/review">리뷰</a></li>
                        <li><a href="#">Wish List</a></li>
                    </ui>
                </div>




            </c:when>
        </c:choose>
    </div>
</div>

