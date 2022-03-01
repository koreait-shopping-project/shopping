<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="tx-a-center">
    <h1 class="font-size-20 bold p-b-30">회원정보 수정</h1>
    <div class="font-size-16 bold p-b-20">비밀번호 확인</div>
    <div class="tx-a-center display-i-b m-b-20" style="width: 255px;">${sessionScope.loginUser.uid} 님의 회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해 주세요.</div>
    <form action="/user/checkpw" method="post" id="checkpw_frm" class="tx-a-center">
        <Strong class="color-red font-size-16">${requestScope.msg}</Strong>
        <div class="m-b-20">
            <input type="hidden" name="uid" value="${sessionScope.loginUser.uid}">
            <div class="w-100p">
                <span class="bold">비밀번호</span>
                <span>
                    <input class="bolder w-200 m-l-10" type="password" name="upw" id="upw">
                </span>
            </div>
        </div>
        <input class="bolder-s bc-black color-white" type="submit" value=" 확인" id="checkpw_submit">
    </form>
</div>