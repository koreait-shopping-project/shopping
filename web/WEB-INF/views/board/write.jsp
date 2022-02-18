<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="titleVal" value="상품 사용 후기" />
<c:set var="actionVal" value="/board/write" />
<c:set var="submitVal" value="WRITE" />
<c:set var="iboardVal" value="0" />
<c:set var="icategoryVal" value="${param.icategory}" />
<c:if test="${requestScope.data != null && requestScope.data.iboard > 0}">
    <c:set var="titleVal" value="수정" />
    <c:set var="actionVal" value="/board/mod" />
    <c:set var="submitVal" value="MOD" />
    <c:set var="iboardVal" value="${requestScope.data.iboard}" />
    <c:set var="icategoryVal" value="0" />
</c:if>
<div>
    <h1 class="tx-a-center font-size-20 p-b-20">${titleVal}</h1>
    <form action="${actionVal}" method="post">
        <input type="hidden" name="iboard" value="${iboardVal}">
        <input type="hidden" name="icategory" value="${icategoryVal}">
        <table>
            <th scope="row">제목</th>
            <td><input type="text" name="title" value="<c:out value='${requestScope.data.title}'/>"></td>
        </table>
        <div>
            <textarea name="ctnt"><c:out value="${requestScope.data.ctnt}" /></textarea>
        </div>
        <div><input type="submit" value="${submitVal}"></div>
    </form>
</div>