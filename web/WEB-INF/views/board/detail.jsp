<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:choose>
    <c:when test="${data.icategory == 1}">
        <c:set var="titleVal" value="공지사항" />
    </c:when>
    <c:when test="${data.icategory == 2}">
        <c:set var="titleVal" value="상품 Q/A" />
    </c:when>
</c:choose>
<div class="m-w">
    <div id="data"
         data-icategory="${data.icategory}"
         data-iboard="${data.iboard}"
         data-nm="${sessionScope.loginUser.nm}"
         data-iuser="${sessionScope.loginUser.iuser}">
    </div>
    <div class="tx-a-center m-b-15">${titleVal}</div>
    <div>
        <a href="/board/detail?iboard=${requestScope.prevNext.previboard}" class="${requestScope.prevNext.previboard == 0 ? 'invisibility' : ''}">이전글</a>
        <a href="/board/detail?iboard=${requestScope.prevNext.nextiboard}" class="${requestScope.prevNext.nextiboard == 0 ? 'invisibility' : ''}">다음글</a>
    </div>
    <table>
        <tr>
            <th width="15%" scope="row">제목</th>
            <td class="p-l-10" width="85%">${requestScope.data.title}</td>
        </tr>
        <tr>
            <th width="15%" scope="row">작성자</th>
            <td class=p-l-10 width="85%">${requestScope.data.writerNm}</td>
        </tr>
        <tr>
            <th class="m-10" colspan="2"><c:out value="${data.ctnt}"/></th>
        </tr>
    </table>
    <div ></div>
    <c:if test="${sessionScope.loginUser.iuser == data.iuser}">
        <div class="tx-a-center">
            <button class="bolder-p b-radius bc-black color-white m-10" id="modBtn">수정</button>
            <button class="bolder-p b-radius bc-black color-white m-10" id="delBtn">삭제</button>
        </div>
    </c:if>
</div>

