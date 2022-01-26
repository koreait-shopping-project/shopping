{
    let idChkState = 2; //0: 아이디 사용 불가능, 1:아이디 사용가능, 2: 체크 안함

    const joinFrmElem = document.querySelector('#join_frm');
    const idRegex = /^([a-zA-Z0-9]{4,15})$/;//대소문자 + 숫자 조합 4~15글자
    const pwRegex = /^([a-zA-Z0-9!@_]{4,20}$)/;//대소문자 + 숫자 조합 4~15글자
    const nmRegex = /^([가-힣]{2,10})$/; //한글 2~10자 조합 (영어, 특수기호X)
    const phRegex = /^([0-9]{11})$/;
    const emailRegex = /^(?=.{8,50}$)([0-9a-z_]{4,})@([0-9a-z][0-9a-z\-]*[0-9a-z]\.)?([0-9a-z][0-9a-z\-]*[0-9a-z])\.([a-z]{2,15})(\.[a-z]{2})?$/;
    const birthRegex = /^([0-9]{6})$/;

    if (joinFrmElem) {
        joinFrmElem.addEventListener('submit', (e) => {

            const uid = joinFrmElem.uid.value;
            const upw = joinFrmElem.upw.value;
            const upwChk = joinFrmElem.upw_check.value;
            const nm = joinFrmElem.nm.value;
            const ph = joinFrmElem.ph.value;
            const email = joinFrmElem.email.value;
            const birth = joinFrmElem.birth.value;

            if (!idRegex.test(uid)) {
                alert('아이디는 대소문자, 숫자조합으로 4~20자 되어야 합니다.');
                e.preventDefault();
            } else if (!pwRegex.test(upw)) {
                alert('비밀번호는 대소문자, 숫자, !, @, _ 조합으로 4~100자 되어야합니다.');
                e.preventDefault();
            } else if (upw !== upwChk) {
                alert('비밀번호 확인을 확인해주세요.');
                e.preventDefault();
            } else if (!nmRegex.test(nm)) {
                alert('이름은 한글 조합으로 2~10자 여야합니다.');
                e.preventDefault();
            } else if (!phRegex.test(ph)) {
                alert('010 포함, - 없이 11자리를 입력해주세요.');
                e.preventDefault();
            } else if (!emailRegex.test(email)) {
                alert('이메일 형식을 확인해주세요. Ex) abc123@examle.com');
                e.preventDefault();
            } else if (!birthRegex.test(birth)) {
                alert('생년월일 6자리를 확인해주세요.');
                e.preventDefault();
            }
        })
    }
    //하기는 했는데 아직 이해못함
    //https://hianna.tistory.com/433
    function checkSelectAll(checkbox)  {
        const agreeall
            = document.querySelector('input[name="agreeall"]');

        if(checkbox.checked === false)  {
            agreeall.checked = false;
        }
    }

    function selectAll(selectAll)  {
        const checkboxes
            = document.getElementsByName('agree');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
    }
}

{
    //카카오 우편주소 검색 API
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
}