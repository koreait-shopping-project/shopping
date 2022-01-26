<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div class="container-outer">
    <div class="container-inner">
        <div>회원가입</div>
        <form action="/user/join" method="post">
            <div style="display: flex; justify-content: space-between">
                <h3>기본정보</h3>
                <p>*필수입력사항</p>
            </div>
            <div>
                <table>
                    <!--colgroup : 테이블에서 서식 지정을 위해 하나이상의 열을 그룹으로 묶을때 사용 http://www.tcpschool.com/html-tags/colgroup-->
                    <colgroup>
                        <col class="w-150">
                        <col class="w-auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="display-b-f-l">아이디*</th>
                        <td><input class="display-b-f-l" type="text" name="uid" ></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">비밀번호*</th>
                        <td><input class="display-b-f-l" type="password" name="upw"></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">비밀번호 확인*</th>
                        <td><input class="display-b-f-l" type="password" name="upw-check"></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">이름*</th>
                        <td><input class="display-b-f-l" type="text" name="nm"></td>
                    </tr>

                    <tr>
                        <th class="display-b-f-l">일반전화</th>
                        <td>
                            <input class="display-b-f-l" type="text" name="hnum">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">휴대전화*</th>
                        <td>
                            <input class="display-b-f-l" type="text" name="ph">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">주소</th>
                        <td>
                            <input class="display-b-f-l" type="text" name="addr">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">성별*</th>
                        <td>
                            <label class="display-b-f-l"><input type="radio" name="gender" value="1">남성</label>
                            <label class="display-b-f-l"><input type="radio" name="gender" value="2">여성</label>
                        </td>
                    </tr>
                    <th class="display-b-f-l">이메일*</th>
                    <td><input class="display-b-f-l" type="text" name="email" ></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <div style="display: flex; justify-content: space-between">
                    <h3>추가정보</h3>
                </div>
                <div>
                    <table>
                        <colgroup>
                            <col class="w-150">
                            <col class="w-auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th class="display-b-f-l">생년월일*</th>
                            <td><input class="display-b-f-l" type="text" name="birth"></td>
                        </tr>
                        <tr>
                            <th class="display-b-f-l">지역</th>
                            <td>
                                <select name="location" id="location">
                                    <option value="basic">지역</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="display-b-f-l">추천인 아이디</th>
                            <td><input class="display-b-f-l" type="text" name="recommendation"></td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="display: flex; justify-content: space-between">
                        <h3>약관</h3>
                    </div>
                    <div>
                        <label class="display-b-f-l">
                            <input name="agree" type="checkbox">
                            <span>이메일수신 동의(선택), sms수신 동의(선택)에 모두 동의합니다.</span>
                        </label>
                    </div>
                </div>
                <div>
                    <span class="display-b-f-l">[선택]이메일수신 동의</span>
                    <label>
                        <textarea readonly style="width: 100%; height:100px; resize: none;">할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</textarea>
                    </label>
                </div>

                <div>
                    <label class="display-b-f-l">
                        <span>이메일수신에 동의하십니까?</span>
                        <input id="emailconsent" name="agree" type="checkbox">동의함
                    </label>
                </div>
                <br>
                <div>
                    <span class="display-b-f-l">[선택]sms수신 동의</span>
                    <label>
                        <textarea readonly style="width: 100%; height:100px; resize: none;">할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</textarea>
                    </label>
                </div>

                <div>
                    <label class="display-b-f-l">
                        <span>[선택]sms수신에 동의하십니까?</span>
                        <input id="smsconsent" name="agree" type="checkbox"> 동의함
                    </label>
                </div>
            </div>
            <br>
            <div>
                <input type="submit" value="회원가입">
            </div>

        </form>
    </div>

</div>