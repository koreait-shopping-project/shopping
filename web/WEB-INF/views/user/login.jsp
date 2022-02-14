<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div id="login_wrap">
    <h2 class="hidden">Login</h2>
    <form action="/user/login" method="post" id="login_frm">
        <div class="frm_wrap">
            <Strong class="color-red font-size-16">${requestScope.msg}</Strong>
            <p class="top_hold">id</p>
            <label><input type="text" name="uid"></label>
            <p class="top_hold">password</p>
            <label><input type="password" name="upw"></label>
            <div class="login_submit_wrap m-t-10">
                <button type="submit" id="login_submit" class="login_submit pointer">log in</button>
                <a href="/user/join"><span>create account</span></a>
            </div>
            <div class="login_find_wrap p-tb-10">
                <a href=""><span>find id</span></a>
                <a href=""><span>find password</span></a>
            </div>
            <div class="api_login_btn" id="kakaologin">
                <div class="kakao_login pointer">
                    <span class="font-size-18 bold">Login with Kakao</span>
                </div>
                <div class="google_login pointer">
                    <span class="font-size-18 bold color-black">Login With Google</span>
                </div>
            </div>
        </div>
    </form>
</div>