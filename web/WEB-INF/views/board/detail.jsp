<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/decoupled-document/ckeditor.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:choose>
    <c:when test="${data.icategory == 1}">
        <c:set var="titleVal" value="공지사항" />
    </c:when>
    <c:when test="${data.icategory == 2}">
        <c:set var="titleVal" value="상품 Q/A" />
    </c:when>
    <c:when test="${data.icategory == 4}">
        <c:set var="titleVal" value="리뷰" />
    </c:when>
</c:choose>
<div class="m-w">
    <div id="data"
         data-icategory="${data.icategory}"
         data-iboard="${data.iboard}"
         data-nm="${sessionScope.loginUser.nm}"
         data-iuser="${sessionScope.loginUser.iuser}">
    </div>
    <div class="tx-a-center m-b-15">${titleVal}</div>
    <div style="position: relative">
        <a href="/board/detail?iboard=${requestScope.prevNext.previboard}" class="${requestScope.prevNext.previboard == 0 ? 'invisibility' : ''}"><button class="bolder-p b-radius bc-black color-white m-10">이전</button></a>
        <a href="/board/detail?iboard=${requestScope.prevNext.nextiboard}" class="${requestScope.prevNext.nextiboard == 0 ? 'invisibility' : ''}"><button class="bolder-p b-radius bc-black color-white m-10">다음</button></a>
        <button class="bolder-p b-radius bc-black color-white m-10" style="position: absolute; right: 0" id="list" >목록</button>
    </div>
    <table>
        <tr>
            <th width="15%" scope="row">제목</th>
            <td class="p-l-10" width="85%">${requestScope.data.title}</td>
        </tr>
        <tr>
            <th width="15%" scope="row">작성자</th>
            <td class=p-l-10 width="85%">${requestScope.data.writerNm}</td>
        </tr>
        <tr>

            <th class="m-10" colspan="2">
<%--                <textarea class="w-all h-all" style="border: none; min-height: 100px;" readonly><c:out value="${data.ctnt}"/></textarea>--%>
                <div>
                    <c:choose>
                        <c:when test="${data.icategory == 4}">
                        <div style="pointer-events: none">
                            <em class="p-b-20 bold">별점</em>
                            <div class="m-t-20 display-i-b p-b-20">
                                <div class="star-rating space-x-4 mx-auto">
                                    <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
                                    <label for="5-stars" class="star pr-4">★</label>
                                    <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                                    <label for="4-stars" class="star">★</label>
                                    <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                                    <label for="3-stars" class="star">★</label>
                                    <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                                    <label for="2-stars" class="star">★</label>
                                    <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                                    <label for="1-star" class="star">★</label>
                                </div>
                            </div>
                            <ul>
                                <li>
                                    <em class="bold">사이즈</em>
                                    <div class="select m-l-20">
                                        <input type="radio" id="choice1" value="4" name="answer0">
                                        <label for="choice1">커요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice2" value="5" name="answer0">
                                        <label for="choice2">보통이에요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice3" value="6" name="answer0">
                                        <label for="choice3">작아요</label>
                                    </div>
                                </li>
                                <li>
                                    <em class="bold">밝기</em>
                                    <div class="select m-l-30">
                                        <input type="radio" id="choice4" value="7" name="answer1">
                                        <label for="choice4">밝아요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice5" value="8" name="answer1">
                                        <label for="choice5">보통이에요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice6" value="9" name="answer1">
                                        <label for="choice6">어두워요</label>
                                    </div>
                                </li>
                                <li>
                                    <em class="bold">색감</em>
                                    <div class="select m-l-30">
                                        <input type="radio" id="choice7" value="10" name="answer2">
                                        <label for="choice7">선명해요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice8" value="11" name="answer2">
                                        <label for="choice8">보통이에요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice9" value="12" name="answer2">
                                        <label for="choice9">선명해요</label>
                                    </div>
                                </li>
                                <li>
                                    <em class="bold">두께감</em>
                                    <div class="select m-l-20">
                                        <input type="radio" id="choice10" value="13" name="answer3">
                                        <label for="choice10">두꺼워요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice11" value="14" name="answer3">
                                        <label for="choice11">보통이에요</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice12" value="15" name="answer3">
                                        <label for="choice12">얇아요</label>
                                    </div>
                                </li>
                            </ul>
                            <hr style="margin-top: -10px; margin-bottom: 25px;">
                            <h2 class="font-size-14 bold m-b-20">신체정보</h2>
                            <ul>
                                <li>
                                    <em class="bold">성별</em>
                                    <div class="select m-l-30">
                                        <input type="radio" id="choice13" value="1" name="gender">
                                        <label for="choice13">남성</label>
                                    </div>
                                    <div class="select">
                                        <input type="radio" id="choice14" value="2" name="gender">
                                        <label for="choice14">여성</label>
                                    </div>
                                </li>
                                <li>
                                    <em class="bold">키</em>
                                    <input class="m-l-40" type="text" name="tall" id="tall">
                                    <span>cm</span>
                                    <span>(ex. 170.0)</span>
                                </li>
                                <li style="margin-bottom: -20px;">
                                    <em class="bold">몸무게</em>
                                    <input class="m-l-20" type="text" name="weight" id="weight">
                                    <span>kg</span>
                                    <span>(ex. 60.0)</span>
                                </li>
                            </ul>
                        </div>
                        </c:when>
                    </c:choose>
                ${data.ctnt}
                </div>
            </th>
        </tr>
    </table>
    <c:if test="${sessionScope.loginUser.iuser == data.iuser}">
        <div class="tx-a-center">
            <button class="bolder-p b-radius bc-black color-white m-10" id="modBtn">수정</button>
            <button class="bolder-p b-radius bc-black color-white m-10" id="delBtn">삭제</button>
        </div>
    </c:if>
    <div><button class="bolder-p b-radius bc-black color-white m-10" id="back" onclick="history.back()">뒤로가기</button></div>

</div>

<div>
    <c:if test="${sessionScope.loginUser != null}">
        <div class="m-t-20 invisibility">
            <form id="cmtFrm">
                <input type="text" name="ctnt">
                <input type="button" id="btn_submit" value="댓글달기">
            </form>
        </div>
    </c:if>
    <div class="m-t-20" id="cmt_list"></div>
</div>