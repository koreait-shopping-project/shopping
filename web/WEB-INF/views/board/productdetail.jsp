<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="detail_container">
    <section id="detail_img_wrap">
        <img src="${requestScope.detail.img_url_big}">
    </section>
    <section id="detail_wrap">
        <table id="detail_table">
            <tr>
                <th>브랜드</th>
                <td>${requestScope.detail.brand}</td>
            </tr>
            <tr>
                <th>제품명</th>
                <td>${requestScope.detail.title}</td>
            </tr>
            <tr>
                <th>분류</th>
                <td>${requestScope.detail.subcategorynm}</td>
            </tr>
            <tr>
                <th>가격</th>
                <td><span class="bold letter-spacing-0125rem"><fmt:formatNumber value="${requestScope.detail.price}" pattern="#,###"/>원</span></td>
            </tr>
            <tr>
                <th>구분</th>
                <td>
                    <c:if test="${requestScope.detail.gender == 1}">남성용</c:if>
                    <c:if test="${requestScope.detail.gender == 2}">여성용</c:if>
                    <c:if test="${requestScope.detail.gender == 3}">공용</c:if>
                </td>
            </tr>
        </table>

        <div id="detail_box_wrap">
            <select id="colorbox">
                <option value="" selected disabled>컬러선택</option>
                <c:forEach var="item" items="${requestScope.data}">
                    <option value="${item.color}">
                        <c:if test="${item.color == 1}">
                            흰색
                        </c:if>
                        <c:if test="${item.color == 2}">
                            검정
                        </c:if>
                        <c:if test="${item.color == 3}">
                            회색
                        </c:if>
                    </option>
                </c:forEach>
            </select>
            <select id="sizebox">
                <option value="" selected disabled>사이즈선택</option>
            </select>
        </div>

        <form method="post" id="frmSubmit">
            <div id="purchase_wrap" style="position: relative;" data-price="${requestScope.detail.price}">
                <ul id="selected_items">
                    <c:set var="color" value="${color}"/>
                    <c:choose>
                        <c:when test="${color == 1}">
                            흰색
                        </c:when>
                        <c:when test="${color == 2}">
                            검정
                        </c:when>
                        <c:when test="${color == 3}">
                            회색
                        </c:when>
                    </c:choose>
                </ul>
                <input id="data" name="iboard" type="hidden" value="${requestScope.detail.iboard}" data-iboard="${requestScope.detail.iboard}">
                <input id="iuser" name="iuser" type="hidden" value="${requestScope.iuser}" data-iuser="${requestScope.iuser}">
            </div>
            <div id="allPrice">total : 0</div>
            <input type="submit" value="바로구매" onclick="submitBtn('order')">
            <input type="submit" value="장바구니 담기" onclick="submitBtn('cart')">
            <span>
                <c:if test="${sessionScope.loginUser != null}">
                    <!-- 좋아요 -->
                    <i id="like_icon" class="pointer fa-2x far fa-heart"></i>
                </c:if>
            </span>
        </form>


    </section>
</div>
<!------------------------------------------------------------리뷰------------------------------------------------------------>
<div>
    <table class="w-100p h-200" style="border: 1px solid #c1c1c1">
        <div class="p-b-20 p-t-30">구매후기</div>
        <tr>
            <td rowspan="2" width="40%" style="border-right: 1px solid #c1c1c1">
                <div class="leftTop">구매 만족도</div>
                ★★★★★
            </td>
            <td width="30%" style="border-right: 1px solid #c1c1c1">
                <div class="leftTop">사이즈</div>
                <div class="m-w-170">
                    <div class="display-i-b">큼</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">보통</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">작음</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
            </td>
            <td>
                <div class="leftTop">밝기</div>
                <div class="m-w-170">
                    <div class="display-i-b">밝음</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">보통</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">어두움</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
            </td>
        </tr>
        <tr>
            <td width="30%" style="border-right: 1px solid #c1c1c1">
                <div class="leftTop">색감</div>
                <div class="m-w-170">
                    <div class="display-i-b">선명</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">보통</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">흐림</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
            </td>
            <td width="30%">
                <div class="leftTop">두께감</div>
                <div class="m-w-170">
                    <div class="display-i-b">두꺼움</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">보통</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
                <div class="m-w-170">
                    <div class="display-i-b">얇음</div>
                    <div class="display-i-b">50%</div>
                    <progress value="50" max="100" style="height: 5px; width: 100%;"></progress>
                </div>
            </td>
        </tr>
    </table>
<div>test</div>
    <c:forEach var="item" items="${requestScope.review}">
    <div>
        <input type="hidden" name="iboard" value="${requestScope.iboard}">
        <div>${item.uid}</div>
        <div>${item.tall}</div>
        <div>${item.weight}</div>
        <div><img src="${item.img_url_big}" alt="product"></div>
        <div>${item.title}</div>
        <c:if test="${item.color == 1}">
            <div>흰색</div>
        </c:if>
        <c:if test="${item.color == 2}">
            <div>검은색</div>
        </c:if>
        <c:if test="${item.color == 3}">
            <div>회색</div>
        </c:if>
        <c:if test="${item.sm != 0}">
            <div>small</div>
        </c:if>
        <c:if test="${item.md != 0}">
            <div>medium</div>
        </c:if>
        <c:if test="${item.lg != 0}">
            <div>large</div>
        </c:if>
        <c:if test="${item.xl != 0}">
            <div>x-large</div>
        </c:if>
        <div>별점 : ${item.rating}</div>
        <div>평가 글 : ${item.ctnt}</div>
    </div>
    </c:forEach>
</div>