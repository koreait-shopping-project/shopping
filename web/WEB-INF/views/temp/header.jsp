<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<tiles:importAttribute name="menuList"/>
<tiles:importAttribute name="subMenuList"/>
<c:set var="currentPagePath" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="splitURI" value="${fn:split(currentPagePath, '/')}"/>
<c:set var="lastPath" value="${splitURI[fn:length(splitURI) - 1]}"/>
<header id="header">
    <meta name ="google-signin-client_id" content="883718995298-74pl9d4vsao303ogt1dhiv9mki93nffc.apps.googleusercontent.com">
    <a href="/"><b class="pointer">grandetoile</b></a>
    <div id="submenu_wrap">
        <div><a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
            shop
        </a></div>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">shop menu</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <hr>
            <div class="offcanvas-body" id="offcanvas_submenu_body">
                <c:forEach items="${subMenuList}" var="item">
                    <div class="${lastPath == ''.concat(item.isubcategory) ? 'menu_selected' : ''}">
                        <a href="/board/product/${item.isubcategory}">${item.subcategorynm}</a>
                    </div>
                </c:forEach>
                <c:if test="${sessionScope.loginUser != null}">
                <p id="mypage_wrap">
                    <span><a href="/user/mypage">마이페이지</a></span>
                    <span><a href="/user/logout">로그아웃</a></span>
                </p>
                </c:if>
            </div>
        </div>
    </div>
    <div id="menu_wrap">
        <c:choose>
            <c:when test="${sessionScope.loginUser == null}">
                <div id="login"><a href="/user/login">login</a></div>
                <div id="join"><a href="/user/join">join</a></div>
            </c:when>
            <c:otherwise>
                <div><a href="/user/logout">logout</a></div>
            </c:otherwise>
        </c:choose>
        <div><a class="pointer" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">search</a></div>
        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
            <div class="offcanvas-header" id="offcanvas_search_header">
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" id="offcanvas_search_body">
                <form action="" method="post" id="search_frm">
                    <input class="form-control" id="search_input" type="search">
                    <input id="search_submit" type="submit" value="검색">
                </form>
                <p class="search_press">Press Enter to Search</p>
            </div>
        </div>
        <c:forEach items="${menuList}" var="item">
            <div class="${lastPath == ''.concat(item.icategory) ? 'menu_selected' : ''}">
                <a href="/board/list/${item.icategory}">${item.categorynm}</a>
            </div>
        </c:forEach>
    </div>
</header>