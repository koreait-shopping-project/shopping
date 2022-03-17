<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<c:if test="${sessionScope.loginUser == null}">
    <c:set var="tag" value="/user/login"/>
</c:if>
<c:if test="${sessionScope.loginUser != null}">
    <c:set var="tag" value="/user/mypage"/>
</c:if>
<footer id="footer">
    <div>
        <ul id="sns">
            <li>
                <a href="https://www.instagram.com/grandetoile_/" target="_blank">
                    <img src="/res/img/footer_instagram.png">
                </a>
            </li>
            <li>
                <a href="https://blog.naver.com/grandetoileshop/" target="_blank">
                    <img src="/res/img/footer_blog.png">
                </a>
            </li>
            <li>
                <a href="http://pf.kakao.com/_vBFsC" target="_blank">
                    <img src="/res/img/footer_kakao.png">
                </a>
            </li>
        </ul>
        <ul id="f_menu">
            <li><a href="#">about</a></li>
            <li><a href="${tag}">my page</a></li>
            <li><a href="#">order</a></li>
            <li><a href="#">agreement</a></li>
            <li><a href="#">privacy</a></li>
            <li><a href="#">guide</a></li>
        </ul>
        <p>
            <span id="developers_title">developers</span><br>
            <span id="developers_people">주현진 | 박재희 | 강지윤 | 이윤석</span><br>
            <span class="uppercase">etoile</span>
            <span>Project.Shopping</span>
            <span>Business Licese. [410-29-99322]</span><br>
            <span>6 PUNGAMSINHEUNG-RO 39BEON-GIL, PUNGAM-DONG, SEO-GU, GWANGJU, KOREA</span><br>
            <span>개인정보관리책임자 <a href="mailto:wogml3270@gmail.com">PARK JAEHEE</a></span><br>
            <span>Copyright &copy; 2022</span>
            <strong>Grandetoile</strong>
        </p>
    </div>
</footer>