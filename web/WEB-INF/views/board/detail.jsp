<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="data"
     data-icategory="${data.icategory}"
     data-iboard="${data.iboard}"
     data-nm="${sessionScope.loginUser.nm}"
     data-iuser="${sessionScope.loginUser.iuser}"></div>
<div>
    <a href="/board/detail?iboard=${requestScope.prevNext.previboard}" class="${requestScope.prevNext.previboard == 0 ? 'invisibility' : ''}">이전글</a>
    <a href="/board/detail?iboard=${requestScope.prevNext.nextiboard}" class="${requestScope.prevNext.nextiboard == 0 ? 'invisibility' : ''}">다음글</a>
</div>
<table>
    <tr>
        <th scope="row">글 번호</th>
        <td>${requestScope.data.iboard}</td>
    </tr>
    <tr>
        <th scope="row">제목</th>
        <td>${requestScope.data.title}</td>
    </tr>
    <tr>
        <th scope="row">작성자</th>
        <td>${requestScope.data.writerNm}</td>
    </tr>
</table>
<div><c:out value="${data.ctnt}" /></div>
<c:if test="${sessionScope.loginUser.iuser == data.iuser}">
    <div>
        <button id="modBtn">수정</button>
        <button id="delBtn">삭제</button>
    </div>
</c:if>
