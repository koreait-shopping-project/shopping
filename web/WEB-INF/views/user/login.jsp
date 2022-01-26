<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div id="login_wrap">
    <h2 class="hidden">Login</h2>
    <form action="/user/login" method="post" id="login_frm">
        <div class="frm_wrap">
            <p class="top_hold">id</p>
            <label><input type="text" name="uid"></label>
            <p class="top_hold">password</p>
            <label><input type="password" name="upw"></label>
            <div class="login_submit_wrap m-t-10">
                <span id="login_submit" class="login_submit pointer">log in</span>
                <a href="/user/join"><span>create account</span></a>
            </div>
            <div class="login_find_wrap p-tb-10">
                <a href=""><span>find id</span></a>
                <a href=""><span>find password</span></a>
            </div>
            <picture class="api_login_btn pointer">
                <img class="kakao_login" src="/res/img/kakao_login_large_narrow.png">
                <img class="naver_login" src="/res/img/naver_login_btnG.png">
                <img class="google_login" src="/res/img/google_login_btn.png">
                <img class="facebook_login" src="/res/img/facebook_login_btn.png">
            </picture>
        </div>
    </form>
</div>