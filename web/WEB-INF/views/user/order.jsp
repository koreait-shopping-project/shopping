<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
    <div>
        <div class="tx-a-center font-size-20 h-50 bc-black color-white">Order</div>
        <hr>
        <div>
            <form action="/user/order" method="post">
                <table>
                    <div>주문 정보</div>
                    <tr>
                        <th class="display-b-f-l font-size-12 w-90">주문자*</th>
                        <td class="">
                            <input class="display-b-f-l bolder w-100p" type="text" name="oname" id="oname">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">이메일*</th>
                        <td>
                            <input class="display-b-f-l bolder w-100p" type="text" name="oemail" id="oemail" value="${param.email}" <c:if test="${param.social != null}" >readonly</c:if>>
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">일반전화</th>
                        <td>
                            <select class="w-20p" name="ofirsthnum" id="ofirsthnum">
                                <option></option>
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
                            <input class="bolder-p w-20p" type="text" name="osecondhnum" id="osecondhnum" maxlength="4">
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="othirdhnum" id="othirdhnum" maxlength="4">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">휴대전화*</th>
                        <td>
                            <select class="w-20p" name="ofirstph" id="ofirstph">
                                <option></option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="osecondph" id="osecondph" maxlength="4">
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="othirdph" id="othirdph" maxlength="4">
                        </td>
                    </tr>

                    <tr>
                        <!--카카오 우편주소 API-->
                        <th class="display-b-f-l font-size-12">주소*</th>
                        <td>
                            <input class="bolder-p" type="text" id="sample4_postcode" name="opost_num" placeholder="우편번호">
                            <input class="font-size-12 bolder-c" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                            <br>
                            <input class="bolder" type="text" id="sample4_roadAddress" name="oload_nm" placeholder="도로명주소" class="w-350">
                            <br>
                            <input class="bolder-a" type="text" id="sample4_jibunAddress" name="olot_addr" placeholder="지번주소">
                            <span id="guide" style="color:#999;display:none"></span>
                            <br>
                            <input class="bolder-a" type="text" id="sample4_detailAddress" name="odetail_addr" placeholder="상세주소">
                            <br>
                            <input class="bolder-a" type="text" id="sample4_extraAddress" name="oref" placeholder="참고항목">
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        </td>
                    </tr>
                </table>
                <hr>
                <table>
                    <div>배송지</div>
                    <tr>
                        <th class="display-b-f-l font-size-12 w-90">받는사람*</th>
                        <td>
                            <input class="display-b-f-l bolder w-100p" type="text" name="rname" id="rname">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">일반전화</th>
                        <td>
                            <select class="w-20p" name="rfirsthnum" id="rfirsthnum">
                                <option></option>
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
                            <input class="bolder-p w-20p" type="text" name="rsecondhnum" id="rsecondhnum" maxlength="4">
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="rthirdhnum" id="rthirdhnum" maxlength="4">
                        </td>
                    </tr>
                    <tr>
                        <th class="display-b-f-l font-size-12">휴대전화*</th>
                        <td>
                            <select class="w-20p" name="rfirstph" id="rfirstph">
                                <option></option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="rsecondph" id="rsecondph" maxlength="4">
                            <span>-</span>
                            <input class="bolder-p w-20p" type="text" name="rthirdph" id="rthirdph" maxlength="4">
                        </td>
                    </tr>

                    <tr>
                        <!--카카오 우편주소 API-->
                        <th class="display-b-f-l font-size-12">주소*</th>
                        <td>
                            <input class="bolder-p" type="text" id="sample5_postcode" name="rpost_num" placeholder="우편번호">
                            <input class="font-size-12 bolder-c" type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기">
                            <br>
                            <input class="bolder" type="text" id="sample5_roadAddress" name="rload_nm" placeholder="도로명주소" class="w-350">
                            <br>
                            <input class="bolder-a" type="text" id="sample5_jibunAddress" name="rlot_addr" placeholder="지번주소">
                            <span id="rguide" style="color:#999;display:none"></span>
                            <br>
                            <input class="bolder-a" type="text" id="sample5_detailAddress" name="rdetail_addr" placeholder="상세주소">
                            <br>
                            <input class="bolder-a" type="text" id="sample5_extraAddress" name="rref" placeholder="참고항목">
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        </td>
                    </tr>
                </table>
                <hr>
                <div id="msg_container">
                    <select class="m-b-10" name="msg" id="msg" onchange="changeSelect()">
                        <option value="메세지 선택(선택사항)">메세지 선택(선택사항)</option>
                        <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
                        <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                        <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
                        <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
                        <option value="택배함에 보관해 주세요.">택배함에 보관해 주세요.</option>
                        <option value="직접 입력" id="self">직접 입력 <input class="display-b w-100p" type="hidden" id="self_input"></option>
                    </select>

                </div>
                <hr>
                <div>주문상품</div>
                <%----------------------------------------상품-----------------------------------------------%>
                    <table>
                        <thead>
                        <tr>
                            <th>상품 이미지</th>
                            <th>상품명</th>
                            <th>판매가</th>
                            <th>컬러</th>
                            <th>사이즈</th>
                            <th>수량</th>
                            <th>주문금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${requestScope.checked}">
                            <tr>
                                <td><img src="${item.img_url_big}" style="width: 10%; height: 10%;"></td>
                                <td><c:out value="${item.title}"/></td>
                                <td><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</td>
                                <td><c:choose>
                                    <c:when test="${item.color == 1}">흰색</c:when>
                                    <c:when test="${item.color == 2}">검정색</c:when>
                                    <c:when test="${item.color == 3}">회색</c:when></c:choose>
                                </td>

                                <c:if test="${item.sm !=0 && item.sm != null}">
                                    <td>sm</td>
                                    <td><input type="hidden" value="${item.sm}"><c:out value="${item.sm}"/></td>
                                    <td><fmt:formatNumber value="${item.price * item.sm}" pattern="#,###"/>원</td>
                                </c:if>

                                <c:if test="${item.md !=0 && item.md != null}">
                                    <td>md</td>
                                    <td><c:out value="${item.md}"/></td>
                                    <td><fmt:formatNumber value="${item.price * item.md}" pattern="#,###"/>원</td>
                                </c:if>

                                <c:if test="${item.lg !=0 && item.xl != null}">
                                    <td>lg</td>
                                    <td><input type="hidden" value="${item.lg}"><c:out value="${item.lg}"/></td>
                                    <td><fmt:formatNumber value="${item.price * item.lg}" pattern="#,###"/>원</td>
                                </c:if>

                                <c:if test="${item.xl !=0 && item.xl != null}">
                                    <td>xl</td>
                                    <td><input type="hidden" value="${item.xl}"><c:out value="${item.xl}"/></td>
                                    <td><fmt:formatNumber value="${item.price * item.xl}" pattern="#,###"/>원</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                <%----------------------------------------------------------------------------%>
                <hr>
                <div>결제수단</div>
                <label class="w-auto">
                    <input type="radio" name="pay_method" id="card" value="1">카드결제
                </label>
                <label class="w-auto">
                    <input type="radio" name="pay_method" id="banktransfer" value="2">무통장 입금
                </label>

                <div>
                    <table class="hidden" id = cardtable>
                        <tr>
                            <th class="display-b-f-l font-size-12 w-90">카드선택*</th>
                            <td>
                                <select class="w-200" name="cardchoice" id="cardchoice">
                                    <option value="신한">신한카드</option>
                                    <option value="하나">하나카드</option>
                                    <option value="우리">우리카드</option>
                                    <option value="KB">KB국민카드</option>
                                    <option value="롯데">롯데카드</option>
                                    <option value="삼성">삼성카드</option>
                                    <option value="현대">현대카드</option>
                                    <option value=NH>NH카드</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>할부기간*</th>
                            <td>
                                <select class="w-200" name="Installment" id="Installment">
                                    <option value="일시불">일시불</option>
                                    <option value="2개월(무이자)">2개월(무이자)</option>
                                    <option value="3개월(무이자)">3개월(무이자)</option>
                                    <option value="4개월(무이자)">4개월(무이자)</option>
                                    <option value="5개월(무이자)">5개월(무이자)</option>
                                    <option value="6개월(무이자)">6개월(무이자)</option>
                                    <option value="7개월(무이자)">7개월(무이자)</option>
                                    <option value="8개월">8개월</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <table class="hidden" id="banktransfertable">
                        <tr>
                            <th class="display-b-f-l font-size-12 w-90">입금은행*</th>
                            <td>
                                <select class="w-200" name="bank" id="bank">
                                    <option value="">선택해주세요.</option>
                                    <option value="농협">농협123456789-10 주현진</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>입금자명*</th>
                            <td>
                                <input class="w-200" name="payername" id="payername" type="text">
                            </td>
                        </tr>
                    </table>
                    <hr>
                    <label>
                        <input type="checkbox" name="payagent_agree_flag">[필수]결제대행서비스 약관 동의
                    </label>
                </div>
                <hr>
                <input class="tx-a-center w-100p h-50 font-size-20 bc-black color-white" type="submit" value="0000 원 결제하기">
            </form>
        </div>
    </div>


</div>


