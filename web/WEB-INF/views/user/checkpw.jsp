<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
    <h1>비밀번호 확인</h1>
    <form action="/user/checkpw" method="post">
        <table>
            <tr>
                <th class="display-b-f-l">비밀번호</th>
                <td><input class="display-b-f-l" type="password" name="upw" id="upw" ></td>
            </tr>
        </table>
        <input type="submit" value="비밀번호 확인">


    </form>
</div>