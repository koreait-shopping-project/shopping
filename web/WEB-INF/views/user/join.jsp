<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <div class="text-aline-center m-20 font-size-30">회원가입</div>
    <form action="/user/join" method="post" id="join_frm">
        <hr>
        <div style="display: flex; justify-content: space-between">
            <h3 class="font-size-20">기본정보</h3>
            <p>*필수입력사항</p>
        </div>
        <div>
            <table>
                <!--colgroup : 테이블에서 서식 지정을 위해 하나이상의 열을 그룹으로 묶을때 사용 http://www.tcpschool.com/html-tags/colgroup-->
                <colgroup>
                    <col class="w-200">
                    <col class="w-auto">
                </colgroup>
                <tbody>
                <tr>
                    <th class="display-b-f-l">아이디*</th>
                    <td><input class="display-b-f-l" type="text" name="uid" id="uid" ><div><input class="h-25" type="button" value="id-check" id="id-btn-chk"><span id="id-chk-msg"></span></div></td>
                </tr>

                <tr>
                    <th class="display-b-f-l">비밀번호*</th>
                    <td><input class="display-b-f-l" type="password" name="upw" id="upw"></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">비밀번호 확인*</th>
                    <td><input class="display-b-f-l" type="password" id="upw_check" id="upw-check"></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">이름*</th>
                    <td><input class="display-b-f-l" type="text" name="nm" id="nm"></td>
                </tr>

                <tr>
                    <th class="display-b-f-l">일반전화</th>
                    <td>
                        <input class="display-b-f-l" type="text" name="hnum" id="hnum">
                    </td>
                </tr>
                <tr>
                    <th class="display-b-f-l">휴대전화*</th>
                    <td>
                        <input class="display-b-f-l" type="text" name="ph" id="ph">
                    </td>
                </tr>
                <tr>
                    <!--카카오 우편주소 API-->
                    <th class="display-b-f-l">주소</th>
                    <td>
                        <input type="text" id="sample4_postcode" name="postnum" placeholder="우편번호">
                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                        <input type="text" id="sample4_roadAddress" name="loadnm" placeholder="도로명주소" class="w-350">
                        <br>
                        <input type="text" id="sample4_jibunAddress" name="lotaddr" placeholder="지번주소">
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="sample4_detailAddress" name="detailaddr" placeholder="상세주소">
                        <input type="text" id="sample4_extraAddress" name="ref" placeholder="참고항목">
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    </td>
                </tr>
                <tr>
                    <th class="display-b-f-l">성별*</th>
                    <td>
                        <label class="display-b-f-l m-r-10"><input type="radio" name="gender" value="1" checked>남성</label>
                        <label class="display-b-f-l"><input type="radio" name="gender" value="2">여성</label>
                    </td>
                </tr>
                <th class="display-b-f-l">이메일*</th>
                <td><input class="display-b-f-l" type="text" name="email" id="email"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div>
            <hr>
            <div style="display: flex; justify-content: space-between">
                <h3 class="font-size-20">추가정보</h3>
            </div>
            <div>
                <table>
                    <colgroup>
                        <col class="w-200">
                        <col class="w-auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="display-b-f-l">생년월일*</th>
                        <td><input class="display-b-f-l" type="text" name="birth" id="birth"></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">지역</th>
                        <td>
                            <select name="location" id="location">
                                <option value=""></option>
                                <option value="경기">경기</option>
                                <option value="서울">서울</option>
                                <option value="인천">인천</option>
                                <option value="강원">강원</option>
                                <option value="충남">충남</option>
                                <option value="충북">충북</option>
                                <option value="대전">대전</option>
                                <option value="경북">경북</option>
                                <option value="경남">경남</option>
                                <option value="대구">대구</option>
                                <option value="부산">부산</option>
                                <option value="울산">울산</option>
                                <option value="전북">전북</option>
                                <option value="전남">전남</option>
                                <option value="광주">광주</option>
                                <option value="제주">제주</option>
                                <option value="해외">해외</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">추천인 아이디</th>
                        <td><input class="display-b-f-l" type="text" name="recommendation"></td>
                    </tr>
                    </tbody>
                </table>
                <hr>
                <div style="display: flex; justify-content: space-between">
                    <h3 class="font-size-20 m-b-10">약관</h3>
                </div>
                <div>
                    <label class="display-b-f-l">
                        <input type="checkbox" value="agreeall" onclick="selectAll(this)">
                        <span>이메일수신 동의(선택), sms수신 동의(선택)에 모두 동의합니다.</span>
                    </label>
                </div>

            </div>
            <br>
            <div>
                <span class="display-b m-t-10 w-100">[선택]이메일수신 동의</span>
                <label>
                    <textarea readonly class="m-tb-10 w" style="height:100px;">할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</textarea>
                </label>
            </div>

            <div>
                <label class="display-b">
                    <span>이메일수신에 동의하십니까?</span>
                    <input type="checkbox" name="isemailconsent" id="agree" value="email" onclick="checkSelectAll(this)">동의함
                </label>
            </div>
            <br>
            <div>
                <span class="display-b m-b-10">[선택]sms수신 동의</span>
                <label>
                    <textarea readonly style="width: 100%; height:100px; resize: none;">할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</textarea>
                </label>
            </div>
            <div>
                <label class="display-b-f-l">
                    <span>[선택]sms수신에 동의하십니까?</span>
                    <input type="checkbox" name="issmsconsent" value="sms" onclick="checkSelectAll(this)"> 동의함
                </label>
            </div>
        </div>
        <br>
        <div class="text-aline-center m-20 font-size-20">
            <input type="submit" value="회원가입" id="join_submit">
        </div>
    </form>
</div>