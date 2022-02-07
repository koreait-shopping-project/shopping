<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<tiles:importAttribute name="menuList"/>
<c:set var="currentPagePath" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="splitURI" value="${fn:split(currentPagePath, '/')}"/>
<c:set var="lastPath" value="${splitURI[fn:length(splitURI) - 1]}"/>
<header id="header">
    <a href="/"><b class="pointer">grandetoile</b></a>
    <c:forEach items="${menuList}" var="item">
        <div class="${lastPath == ''.concat(item.icategory) ? 'menu-selected' : ''}">
            <a href="/board/list/${item.icategory}">${item.categorynm}</a>
        </div>
    </c:forEach>
</header>