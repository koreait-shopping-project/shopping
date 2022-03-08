<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/decoupled-document/ckeditor.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="data"
     data-icategory="${data.icategory}"
     data-iboard="${data.iboard}"
     data-nm="${sessionScope.loginUser.nm}"
     data-iuser="${sessionScope.loginUser.iuser}">
</div>
<form action="/user/review" method="post" id="reviewFrm">
    <!-- 별점 -->
    <input type="hidden" value="${requestScope.list}">
    <hr style="margin-bottom: -10px">
    <em class="p-b-20 bold">별점을 매겨주세요</em>
    <div class="m-t-20 display-i-b p-b-20">
        <div class="star-rating space-x-4 mx-auto">
            <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
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
    <label class="bold">상품에 대한 평가를 20자 이상 작성해 주세요</label>
    <table class="w-100p">
        <tr class="bolder-top bolder-right bolder-left">
            <th scope="row" class="tx-a-center" style="border-right: 1px solid #c1c1c1">제목</th>
            <td><input class="w-all" style="border: none" type="text" name="title" value="<c:out value='${requestScope.data.title}'/>"></td>
        </tr>
        <tr>
            <td colspan="2">
                    <textarea id="editor" name="ctnt">
                        ${requestScope.data.ctnt}
                    </textarea >
            </td>
        </tr>
    </table>
    <div class="bold">
        <label>
            <input type="checkbox" id="all" onclick="selectAll(this)">전체 동의하기
        </label>
        <label>
            <input type="checkbox" name="prom_agree_flag" id="prom_agree_flag" onclick="unselect(this)">작성된 후기는 무신사 홍보 콘텐츠로 사용할 수 있습니다.(필수)
        </label>
        <label>
            <input type="checkbox" name="inf_agree_flag" onclick="unselect(this)">보다 나은 후기 서비스 제공을 위해 성별/키/몸무게 정보 수집•이용에 동의합니다.(선택)
        </label>
    </div>
    <input class="bolder-p b-radius bc-black color-white m-10" type="submit" value="등록">
</form>
