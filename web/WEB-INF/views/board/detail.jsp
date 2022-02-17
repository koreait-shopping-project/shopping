<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="data"
     data-icategory="${data.icategory}"
     data-iboard="${data.iboard}"
     data-nm="${sessionScope.loginUser.nm}"
     data-iuser="${sessionScope.loginUser.iuser}"></div>
<div>
    <a href="/board/detail?iboard=${requestScope.prevNext.previboard}" class="${requestScope.prevNext.previboard == 0 ? 'invisibility' : ''}"><button>이전글</button></a>
    <a href="/board/detail?iboard=${requestScope.prevNext.nextiboard}" class="${requestScope.prevNext.nextiboard == 0 ? 'invisibility' : ''}"><button>다음글</button></a>
</div>
<c:if test="${sessionScope.loginUser.iuser == data.iuser}">
    <table>
        <tr>
            <th scope="row">제목</th>
            <td>${requestScope.data.title}</td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td>${requestScope.data.writerNm}</td>
        </tr>
    </table>
    <div>
        <button id="modBtn">수정</button>
        <button id="delBtn">삭제</button>
    </div>
</c:if>
