<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%--<div id="main_container">--%>
<%--    <ul id="slider">--%>
<%--        <c:forEach var="item" begin="1" end="5">--%>
<%--            <li id="slider_item">--%>
<%--                <div>${item}</div>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--    </ul>--%>
<%--</div>--%>

<div id="sub_main">
    <article id="main_wrap">
        <section id="slider_wrap">
            <ul id="slider">
                <c:forEach var="item" begin="1" end="5">
                    <li class="slider_item">
                        <div>${item}</div>
                    </li>
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
</div>