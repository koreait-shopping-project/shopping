<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<div>
    <div class="text-aline-center m-20 font-size-30">회원 정보 수정</div>
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
                    <td><input class="display-b-f-l" type="text" name="uid" id="uid" value="${sessionScope.loginUser.uid}" readonly></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">현재 비밀번호</th>
                    <td><input class="display-b-f-l" type="password" name="current_upw" id="current_upw" ></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">새 비밀번호</th>
                    <td><input class="display-b-f-l" type="password" name="new_upw" id="new_upw" ></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">새 비밀번호 확인</th>
                    <td><input class="display-b-f-l" type="password" id="new_upw_check" ></td>
                </tr>
                <tr>
                    <th class="display-b-f-l">이름*</th>
                    <td><input class="display-b-f-l" type="text" name="nm" id="nm" value="${sessionScope.loginUser.nm}" readonly></td>
                </tr>

                <tr>
                    <th class="display-b-f-l">일반전화</th>
                    <td>
                        <input class="display-b-f-l" type="text" name="hnum" id="hnum" maxlength="11" value="${sessionScope.loginUser.hnum}">
                    </td>
                </tr>
                <tr>
                    <th class="display-b-f-l">휴대전화*</th>
                    <td>
                        <input class="display-b-f-l" type="text" name="ph" id="ph" maxlength="11" value="${sessionScope.loginUser.ph}">
                    </td>
                </tr>
                <tr>
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
                    <th class="display-b-f-l">주소</th>
                    <td>
                        <input type="text" id="sample4_postcode" name="post_num" placeholder="우편번호" value="${sessionScope.loginUser.post_num}">
                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                        <input type="text" id="sample4_roadAddress" name="load_nm" placeholder="도로명주소" class="w-350" value="${sessionScope.loginUser.load_nm}">
                        <br>
                        <input type="text" id="sample4_jibunAddress" name="lot_addr" placeholder="지번주소" value="${sessionScope.loginUser.lot_addr}">
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소" value="${sessionScope.loginUser.detail_addr}">
                        <input type="text" id="sample4_extraAddress" name="ref" placeholder="참고항목" value="${sessionScope.loginUser.ref}">
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    </td>
                </tr>
                <th class="display-b-f-l">이메일*</th>
                <td><input class="display-b-f-l email" type="text" name="email" id="email" value="${sessionScope.loginUser.email}" data-email="${sessionScope.loginUser.email}"><div><input class="h-25 m-l-5" type="button" value="email-check" id="email-btn-chk"><span id="email-chk-msg"></span></div></td>
                </tr>
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
                        <th class="display-b-f-l">생년월일*</th>
                        <td><input class="display-b-f-l" type="text" name="birth" maxlength="6" id="birth" value="${sessionScope.loginUser.birth}"></td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l">지역</th>
                        <td>
                            <select name="location" id="location">
                                <option value=" " ></option>
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
                        <td><input class="display-b-f-l" type="text" name="recommendation" value="${sessionScope.loginUser.recommendation}"></td>
                    </tr>
                    </tbody>
                </table>

        <div class="text-aline-center m-20 font-size-20">
            <input type="submit" value="회원 정보 수정" id="modify_submit">
            <a href="/board/main"><input type="button" value="취소" id="modify_cancel"></a>
            <input type="button" value="탈퇴" id="delete">
        </div>
    </form>
</div>