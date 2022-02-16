<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <div class="tx-a-center m-20 font-size-30">회원 정보 수정</div>
    <form action="/user/modify" class="m-w" method="post" id="join_frm">
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
                    <td>
                        <input type="hidden" name="social"
                        <c:choose>
                        <c:when test="${param.social != null}">
                               value="${param.social}"
                        </c:when>
                        <c:otherwise>
                               value="general"
                        </c:otherwise>
                        </c:choose>
                        >
                    </td>
                </tr>
                <c:if test="${param.social == null}">
                    <tr>
                        <th class="display-b-f-l font-size-12">아이디*</th>
                        <td><input class="display-b-f-l bolder" type="text" name="uid" id="uid" value="${sessionScope.loginUser.uid}" readonly></td>
                    </tr>

                    <tr>
                        <th class="display-b-f-l font-size-12">현재 비밀번호*</th>
                        <td><input class="display-b-f-l bolder" type="password" name="currentupw" id="currentupw" ></td>
                    </tr>
                    <span>${msg}</span>
                    <tr>
                        <th class="display-b-f-l font-size-12">새 비밀번호*</th>
                        <td><input class="display-b-f-l bolder" type="password" name="upw" id="upw" ></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">새 비밀번호 확인*</th>
                        <td><input class="display-b-f-l bolder" type="password" name="upwcheck" id="upwcheck" ></td>
                    </tr>
                </c:if>
                <tr>
                    <th class="display-b-f-l font-size-12">이름*</th>
                    <td><input class="display-b-f-l bolder" type="text" name="nm" id="nm" value="${sessionScope.loginUser.nm}"></td>
                </tr>

                <tr>
                    <th class="display-b-f-l font-size-12">일반전화</th>
                    <td>
                        <select name="firsthnum" id="firsthnum">
                            <option >${sessionScope.loginUser.firsthnum}</option>
                            <option value="02">02</option>
                            <option value="051">051</option>
                            <option value="053">053</option>
                            <option value="032">032</option>
                            <option value="062">062</option>
                            <option value="042">042</option>
                            <option value="052">052</option>
                            <option value="044">044</option>
                            <option value="031">031</option>
                            <option value="033">033</option>
                            <option value="043">043</option>
                            <option value="041">041</option>
                            <option value="063">063</option>
                            <option value="061">061</option>
                            <option value="054">054</option>
                            <option value="055">055</option>
                            <option value="065">065</option>
                        </select>
                        <span>-</span>
                        <input class="bolder-p" type="text" name="secondhnum" id="secondhnum" maxlength="4" value="${sessionScope.loginUser.secondhnum}">
                        <span>-</span>
                        <input class="bolder-p" type="text" name="thirdhnum" id="thirdhnum" maxlength="4" value="${sessionScope.loginUser.thirdhnum}">
                    </td>
                </tr>
                <tr>
                    <th class="display-b-f-l font-size-12">휴대전화*</th>
                    <td>
                        <select name="firstph" id="firstph">
                            <option>${sessionScope.loginUser.firstph}</option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        <span>-</span>
                        <input class="bolder-p" type="text" name="secondph" id="secondph" maxlength="4" value="${sessionScope.loginUser.secondph}">
                        <span>-</span>
                        <input class="bolder-p" type="text" name="thirdph" id="thirdph" maxlength="4" value="${sessionScope.loginUser.thirdph}">
                    </td>
                </tr>
                    <th class="display-b-f-l">SMS 수신여부*</th>
                    <td>
                        <label>
                            <input type="checkbox" name="sms_agree_flag"
                            <c:if test="${sessionScope.loginUser.sms_agree_flag == true}">
                                checked
                            </c:if>
                            >
                        </label>
                    </td>
                </tr>
                <tr>
                    <!--카카오 우편주소 API-->
                    <th class="display-b-f-l font-size-12">주소</th>
                    <td>
                        <input class="bolder-p" type="text" id="sample4_postcode" name="post_num" placeholder="우편번호" value="${sessionScope.loginUser.post_num}">
                        <input class="font-size-12 bolder-c b-radius" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                        <br>
                        <input class="bolder" type="text" id="sample4_roadAddress" name="load_nm" placeholder="도로명주소" class="w-350" value="${sessionScope.loginUser.load_nm}">
                        <br>
                        <input class="bolder-a" type="text" id="sample4_jibunAddress" name="lot_addr" placeholder="지번주소" value="${sessionScope.loginUser.lot_addr}">
                        <span id="guide" style="color:#999;display:none"></span>
                        <br>
                        <input class="bolder-a" type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소" value="${sessionScope.loginUser.detail_addr}">
                        <br>
                        <input class="bolder-a" type="text" id="sample4_extraAddress" name="ref" placeholder="참고항목" value="${sessionScope.loginUser.ref}">
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    </td>
                </tr>
                <th class="display-b-f-l font-size-12">이메일*</th>
                <td>
                    <input class="display-b-f-l bolder" type="text" name="email" id="email" value="${sessionScope.loginUser.email}"
                    readonly>
                    <div>
                        <span id="email-chk-msg"></span>
                    </div>
                </td>
                <tr>
                    <th class="display-b-f-l">email 수신여부*</th>
                    <td>
                        <label>
                            <input type="checkbox" name="email_agree_flag"
                            <c:if test="${sessionScope.loginUser.email_agree_flag == true}">
                                   checked
                            </c:if>
                            >
                        </label>
                    </td>
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
                        <th class="display-b-f-l font-size-12">생년월일*</th>
                        <td><input class="display-b-f-l bolder" type="text" name="birth" maxlength="6" id="birth" value="${sessionScope.loginUser.birth}"></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">지역</th>
                        <td>
                            <select class="bolder" name="location" id="location">
                                <option value="">${sessionScope.loginUser.location}</option>
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
                        <th class="display-b-f-l font-size-12">추천인 아이디</th>
                        <td><input class="display-b-f-l bolder" type="text" name="recommendation" value="${sessionScope.loginUser.recommendation}"></td>
                    </tr>
                    </tbody>
                </table>

        <div class="tx-a-center m-20 font-size-20">
            <input class="bolder-s bc-black color-white w-90" type="submit" value="회원 정보 수정" id="modify_submit">
            <a href="/board/main"><input class="bolder-s bc-black color-white w-90" type="button" value="취소" id="modify_cancel"></a>
            <input class="display-b-f-r bolder-s bc-black color-white w-90" type="button" value="탈퇴" id="delete">
        </div>
            </div>
        </div>
    </form>
</div>