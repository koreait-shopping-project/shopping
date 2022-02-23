<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="/user/review" method="post">
    <!-- 별점 -->
    <em>별점을 매겨주세요</em>
    <div class="m-t-20">
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
            <em>밝기</em>
            <div class="radio-wrap">
                <input type="radio" id="choice1" value="4" name="answer0">
                <label for="choice1">커요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice2" value="5" name="answer0">
                <label for="choice2">보통이에요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice3" value="6" name="answer0">
                <label for="choice3">작아요</label>
            </div>
        </li>
        <li>
            <em>밝기</em>
            <div class="radio-wrap">
                <input type="radio" id="choice4" value="7" name="answer1">
                <label for="choice4">밝아요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice5" value="8" name="answer1">
                <label for="choice5">보통이에요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice6" value="9" name="answer1">
                <label for="choice6">어두워요</label>
            </div>
        </li>
        <li>
            <em>색감</em>
            <div class="radio-wrap">
                <input type="radio" id="choice7" value="10" name="answer2">
                <label for="choice7">선명해요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice8" value="11" name="answer2">
                <label for="choice8">보통이에요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice9" value="12" name="answer2">
                <label for="choice9">선명해요</label>
            </div>
        </li>
        <li>
            <em>두께감</em>
            <div class="radio-wrap">
                <input type="radio" id="choice10" value="13" name="answer3">
                <label for="choice10">두꺼워요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice11" value="14" name="answer3">
                <label for="choice11">보통이에요</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice12" value="15" name="answer3">
                <label for="choice12">얇아요</label>
            </div>
        </li>
    </ul>
    <h2>신체정보</h2>
    <ul>
        <li>
            <em>성별</em>
            <div class="radio-wrap">
                <input type="radio" id="choice13" value="1" name="gender">
                <label for="choice13">남성</label>
            </div>
            <div class="radio-wrap">
                <input type="radio" id="choice14" value="2" name="gender">
                <label for="choice14">여성</label>
            </div>
        </li>
        <li>
            <em>키</em>
            <input type="number" name="tall">
            <span>cm</span>
        </li>
        <li>
            <em>몸무게</em>
            <input type="number" name="weight">
            <span>kg</span>
        </li>
    </ul>
    <label>상품에 대한 평가를 20자 이상 작성해 주세요</label>
    <textarea id="ctnt" name="ctnt"></textarea>
    <button type="submit" value="등록"></button>
</form>
