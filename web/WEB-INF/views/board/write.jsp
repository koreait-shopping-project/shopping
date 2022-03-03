<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="titleVal" value="글쓰기" />
<c:set var="actionVal" value="/board/write" />
<c:set var="submitVal" value="글쓰기"/>
<c:set var="iboardVal" value="0" />
<c:set var="icategoryVal" value="${param.icategory}" />
<c:if test="${requestScope.data != null && requestScope.data.iboard > 0}">
    <c:set var="titleVal" value="수정" />
    <c:set var="actionVal" value="/board/mod" />
    <c:set var="submitVal" value="수정" />
    <c:set var="iboardVal" value="${requestScope.data.iboard}" />
    <c:set var="icategoryVal" value="0" />
</c:if>
<%
    //비정상적인 경로 접근시 차단
    String strReferer = request.getHeader("referer");
    if(strReferer == null){
%>
<script language="javascript">
    alert("비정상적인 접근입니다.");
    document.location.href="/";
</script>
<%
        return;
    }
%>
<div>
    <div id="data"
         data-icategory="${data.icategory}"
         data-iboard="${data.iboard}"
         data-nm="${sessionScope.loginUser.nm}"
         data-iuser="${sessionScope.loginUser.iuser}">
    </div>

    <h1 class="tx-a-center font-size-12 p-b-20">${titleVal}</h1>
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
            <a href="javascript:history.back()"><span><input class="bolder-p b-radius bc-black color-white m-10" type="button" value="취소"></span></a>
        </div>
    </form>
</div>