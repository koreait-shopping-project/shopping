<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
    <c:set var="titleVal" value="공지사항" />
    <c:set var="notIn" value="글이 없습니다."/>
    <c:choose>
        <c:when test="${requestScope.icategory == 1}">
            <c:set var="notIn" value="글이 없습니다."/>
            <div>
                <div class="tx-a-center m-b-30">${titleVal}</div>
                <table>
                    <tr class="tx-a-center">
                        <th width="15%"></th>
                        <th width="65%">Title</th>
                        <th width="20%">Writer</th>
                    </tr>
                    <c:forEach items="${requestScope.list}" var="item">
                        <tr class="record" data-iboard="${item.iboard}">
                            <td class="tx-a-center">공지</td>
                            <td style="text-align: left;"><c:out value="${item.title}"/></td>
                            <td class="tx-a-center">${item.writerNm}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:when>
        <c:when test="${requestScope.icategory == 2}">
            <c:set var="titleVal" value="상품 Q/A" />
            <c:set var="notIn" value="글이 없습니다."/>
            <div>
                <div class="tx-a-center m-b-30">${titleVal}</div>
                <table>
                    <tr class="tx-a-center">
                        <th width="15%">Products</th>
                        <th width="65%">Title</th>
                        <th width="20%">Writer</th>
                    </tr>
                    <c:forEach items="${requestScope.list}" var="item">
                        <tr class="record" data-iboard="${item.iboard}">
                            <td class="tx-a-center">${item.iboard}</td>
                            <td style="text-align: left;"><c:out value="${item.title}"/></td>
                            <td class="tx-a-center">${item.writerNm}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:when>
        <c:when test="${requestScope.icategory == 4}">
            <c:set var="titleVal" value="리뷰" />
            <c:set var="notIn" value="글이 없습니다."/>
            <div>
                <div class="tx-a-center m-b-30">${titleVal}</div>
                <table>
                    <tr class="tx-a-center">
                        <th width="15%">Products</th>
                        <th width="65%">Title</th>
                        <th width="20%">Writer</th>
                    </tr>
                    <c:forEach items="${requestScope.review}" var="item">
                        <tr class="record" data-iboard="${item.iboard}">
                            <td class="tx-a-center" >${item.ireview}</td>
                            <td style="text-align: left;"><c:out value="${item.title}"/></td>
                            <td class="tx-a-center" >${item.writerNm}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:when>
        <c:when test="${requestScope.icategory == 3}">
            <%-------- cart -----------%>
            <c:set var="titleVal" value="Cart" />
            <div class="tx-a-center m-b-30">${titleVal}</div>
            <form id="cartForm">
                <table>
                    <thead>
                    <tr>
                        <th><input id="allCheck" type="checkbox" onclick="allChk(this);"></th>
                        <th width="20%">상품 이미지</th>
                        <th width="25%">상품명</th>
                        <th width="10%">판매가</th>
                        <th width="10%">컬러</th>
                        <th width="10%">사이즈</th>
                        <th width="15%">수량</th>
                        <th width="10%">주문금액</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <c:forEach var="item" items="${requestScope.cart}">
                        <tr id="purchase_wrap" data-price="${requestScope.detail.price}">

                            <td><input name="RowCheck" type="checkbox" value="${item.icart}"/></td>
                            <td><a id="product_item_link" href="/board/productdetail/${item.iboard}"><img src="${item.img_url_big}" style="width: 100%; min-width: 120px; max-width: 200px;"></a></td>
                            <td><c:out value="${item.title}"/></td>
                            <td><fmt:formatNumber value="${item.price}" pattern="#,###"/>원<input type="hidden" name="price" value="${item.price}"></td>
                            <td><c:choose>
                                <c:when test="${item.color == 1}">흰색</c:when>
                                <c:when test="${item.color == 2}">검정색</c:when>
                                <c:when test="${item.color == 3}">회색</c:when></c:choose>
                            </td>

                            <c:if test="${item.sm !=0 && item.sm != null}">
                                <td>sm<input hidden name="size" value="sm"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" name="itemNum" value="${item.sm}">
                                    <span class="nowNum"><c:out value="${item.sm}"/></span>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.sm}" pattern="#,###"/>원<input type="hidden" name="price" value="${item.price}"></td>
                            </c:if>

                            <c:if test="${item.md !=0 && item.md != null}">
                                <td>md<input hidden name="size" value="md"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" name="itemNum" value="${item.md}">
                                    <span class="nowNum"><c:out value="${item.md}"/></span>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.md}" pattern="#,###"/>원<input type="hidden" name="price" value="${item.price}"></td>
                            </c:if>

                            <c:if test="${item.lg !=0 && item.xl != null}">
                                <td>lg<input hidden name="size" value="lg"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" name="itemNum" value="${item.lg}">
                                    <span class="nowNum"><c:out value="${item.lg}"/></span>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.lg}" pattern="#,###"/>원<input type="hidden" name="price" value="${item.price}"></td>
                            </c:if>

                            <c:if test="${item.xl !=0 && item.xl != null}">
                                <td>xl<input hidden name="size" value="xl"></td>
                                <td class="upDown">
                                    <span class="numMinusBtn">-</span>
                                    <input type="hidden" name="itemNum" value="${item.xl}">
                                    <span class="nowNum"><c:out value="${item.xl}"/></span>
                                    <span class="numPlusBtn">+</span>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.xl}" pattern="#,###"/>원<input type="hidden" name="price" value="${item.price}"></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${sessionScope.loginUser == null}">
                    <c:set var="notIn" value="장바구니가 비어있습니다."/>
                    <div class="tx-a-center p-tb-20">${notIn}</div>
                </c:if>
            </form>
            <div id="allPrice">0</div>
            <div id="itemOrderBtn">
                <input type="button" value="선택삭제" onclick="itemDel()">
                <input type="button" value="선택주문" onclick="order()">
            </div>
        </c:when>
    </c:choose>
    <div id="go_write">
        <c:choose>
            <c:when test="${requestScope.icategory == 1 && sessionScope.loginUser.admin_flag == true}">
                <a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a>
            </c:when>
            <c:when test="${requestScope.icategory == 2 && sessionScope.loginUser != null}">
                <a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a>
            </c:when>
        </c:choose>
    </div>
    <div id="write_search_wrap">
        <div id="list_search_wrap">
            <form action="/board/list/${requestScope.icategory}" method="get" id="list_search_frm">
                <span class="color-gray">검색어</span>
                <select name="searchType">
                    <option value="1" ${requestScope.searchType == 1 ? 'selected' : ''}>제목</option>
                    <option value="2" ${requestScope.searchType == 2 ? 'selected' : ''}>내용</option>
                    <option value="3" ${requestScope.searchType == 3 ? 'selected' : ''}>글쓴이</option>
                </select>
                <input type="search" name="searchText" value="">
                <input class="bc-black color-white" type="submit" value="찾기">
                <c:choose>
                    <c:when test="${requestScope.icategory == 1 && sessionScope.loginUser.admin_flag == true}">
                        <button type="button" class="btn btn-dark"><a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a></button>
                    </c:when>
                    <c:when test="${requestScope.icategory == 2 && sessionScope.loginUser != null}">
                        <button type="button" class="btn btn-dark"><a href="/board/write?icategory=${requestScope.icategory}">글쓰기</a></button>
                    </c:when>
                </c:choose>
            </form>

        </div>
    </div>
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
            <!-- 이전페이지 버튼 -->
            <c:if test="${pageMaker.prev}">
                <li class="pageInfo_btn previous"><a href="/board/list/${requestScope.icategory}?pageNum=${pageMaker.startPage}">Prev</a></li>
            </c:if>

            <!-- 각 번호 페이지 버튼 -->
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="pageInfo_btn num"><a href="/board/list/${requestScope.icategory}?pageNum=${num}">${num}</a></li>
            </c:forEach>

            <!-- 다음페이지 버튼 -->
            <c:if test="${pageMaker.next}">
                <li class="pageInfo_btn next"><a href="/board/list/${requestScope.icategory}?pageNum=${pageMaker.endPage}">Next</a></li>
            </c:if>
        </div>
    </div>
</div>