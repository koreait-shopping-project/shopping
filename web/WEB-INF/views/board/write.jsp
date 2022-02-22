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
    <c:set var="submitVal" value="수정" />
    <c:set var="iboardVal" value="${requestScope.data.iboard}" />
    <c:set var="icategoryVal" value="0" />
</c:if>
<div>
    <h1 class="tx-a-center font-size-20 p-b-20">${titleVal}</h1>
    <form action="${actionVal}" method="post">
        <input type="hidden" name="iboard" value="${iboardVal}">
        <input type="hidden" name="icategory" value="${icategoryVal}">
        <table>
            <tr>
                <th scope="row">제목</th>
                <td><input class="w-all" type="text" name="title" value="<c:out value='${requestScope.data.title}'/>"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea class="w-all h-200 font-size-16" name="ctnt"><c:out value="${requestScope.data.ctnt}" /></textarea>
                </td>
            </tr>
        </table>
        <div class="tx-a-center">
            <span><input class="bolder-p b-radius bc-black color-white m-10" type="submit" value="${submitVal}"></span>
            <span><input class="bolder-p b-radius bc-black color-white m-10" type="submit" value="취소"></span>
        </div>
    </form>
</div>