<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="pageUnit_wrap">
    <select id="pageUnit" name="pageUnit">
        <option value="10" <c:if test="${SearchVo.pageUnit == 10}">selected="selected"</c:if>>10개씩보기</option>
        <option value="15" <c:if test="${SearchVo.pageUnit == 15}">selected="selected"</c:if>>15개씩보기</option>
        <option value="20" <c:if test="${SearchVo.pageUnit == 20}">selected="selected"</c:if>>20개씩보기</option>
        <option value="25" <c:if test="${SearchVo.pageUnit == 25}">selected="selected"</c:if>>25개씩보기</option>
        <option value="30" <c:if test="${SearchVo.pageUnit == 30}">selected="selected"</c:if>>30개씩보기</option>
    </select>
</div>
<div id="product_item_grid">
    <c:choose>
        <c:when test="${fn:length(requestScope.list) == 0}">
            상품 목록이 없습니다.
        </c:when>
        <c:otherwise>
            <div id="product_list">
            <c:forEach items="${requestScope.list}" var="item">
                <a id="product_item_link" href="/board/productdetail/${item.iboard}">
                    <img src="${item.img_url_big}">
                    <p>${item.title}</p>
                    <p class="bold"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
                    <c:if test="${item.gender == 1}"><p>남성용</p></c:if>
                    <c:if test="${item.gender == 2}"><p>여성용</p></c:if>
                    <c:if test="${item.gender == 3}"><p>공용</p></c:if>
                </a>
            </c:forEach>
            </div>
            <div id="page_container">
                <ul id="pagingul"></ul>
            </div>
        </c:otherwise>
    </c:choose>
    <div align="center">
        <!-- pagination -->
        <ul class="pagination">
            <!-- 이전 -->
            <c:choose>
                <c:when test="${pageMaker.prev} ">
                    <a href="/notice/noticeList.do${pageMaker.makeSearch(pageMaker.startPage-1)}" class="paginate_button previous">
                        이전
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="/notice/noticeList.do${pageMaker.makeSearch(pageMaker.startPage-1) }" class="paginate_button previous">
                        이전
                    </a>
                </c:otherwise>
            </c:choose>

            <!-- 페이지 번호 -->
            <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <a href="/notice/noticeList.do${pageMaker.makeSearch(idx)}">

                        ${idx}

                </a>
            </c:forEach>

            <!-- 이후 -->
            <c:choose>
                <c:when test="${pageMaker.next}">
                    <a href="/notice/noticeList.do${pageMaker.makeSearch(pageMaker.endPage+1)}" class="paginate_button next">
                        다음
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="/notice/noticeList.do${pageMaker.makeSearch(pageMaker.endPage+1)}" class="paginate_button next disabled">
                        다음
                    </a>
                </c:otherwise>
            </c:choose>
            <span class="current">22/33</span></ul>
    </div>
</div>