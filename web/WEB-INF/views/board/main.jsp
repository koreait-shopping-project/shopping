<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<article id="main_wrap">
    <section id="slider_wrap">
        <ul id="slider">
            <c:forEach var="i" begin="1" end="9">
                <li class="slider_item"><div></div></li>
            </c:forEach>
        </ul>
        <div class="btns" id="next">
            <i class="fa fa-arrow-right"></i>
        </div>
        <div class="btns" id="prev">
            <i class="fa fa-arrow-left"></i>
        </div>
        <div id="counter"></div>
        <div id="pagination_wrap">
            <ul></ul>
        </div>
    </section>
</article>