{
    let emailChkState = 2; //0: 아이디 사용 불가능, 1:아이디 사용가능, 2: 체크 안함

    const modFrmElem = document.querySelector('#mod_frm');
    const idRegex = /^([a-zA-Z0-9]{4,15})$/;//대소문자 + 숫자 조합 4~15글자
    const pwRegex = /^([a-zA-Z0-9!@_]{4,20}$)/;//대소문자 + 숫자 조합 4~15글자
    const nmRegex = /^([가-힣]{2,10})$/; //한글 2~10자 조합 (영어, 특수기호X)
    const firstphRegex = /^([0-9]{3})$/;
    const secondphRegex = /^([0-9]{4})$/;
    const thirdphRegex = /^([0-9]{4})$/;
    const emailRegex = /^(?=.{8,50}$)([0-9a-z_]{4,})@([0-9a-z][0-9a-z\-]*[0-9a-z]\.)?([0-9a-z][0-9a-z\-]*[0-9a-z])\.([a-z]{2,15})(\.[a-z]{2})?$/;
    const birthRegex = /^([0-9]{6})$/;
    const msg1 = '아이디는 대소문자, 숫자조합으로 4~15자 이상 되어야합니다.';
    const msg2 = '이메일 형식을 확인해주세요. Ex) abc123@examle.com';

    //회원 정보 수정에서 본인 이메일 중복아니게 하기 위한 작업
    const currentEmailElem = document.querySelector('.email');

    //이메일 체크 메세지
    const setEmailChkMsg = (data) => {
        emailChkState = data.result; // 0 or 1

        const emailChkMsgElem = modFrmElem.querySelector('#email-chk-msg');

        //회원 정보 수정에서 본인 이메일 중복아니게 하기 위한 작업, 보류
        //
        // if (emailVal === currentEmail) {
        //     alert(emailVal);
        //     alert(currentEmail);
        //     data.result = 1;
        // }

        switch (data.result) {
            case 0:
                emailChkMsgElem.innerHTML = `<span style="color: red">사용 중인 이메일입니다.</span>`;
                break;
            case 1:
                emailChkMsgElem.innerHTML = `<span style="color: blue">사용 가능한 이메일입니다.</span>`;
                break;
        }

    }

    if (modFrmElem) {
        modFrmElem.addEventListener('submit', (e) => {

            const uid = modFrmElem.uid.value;
            const currentupw = modFrmElem.currentupw.value;
            const upw = modFrmElem.upw.value;
            const upwcheck = modFrmElem.upwcheck.value;
            const nm = modFrmElem.nm.value;
            const firstph = modFrmElem.firstph.value;
            const secondph = modFrmElem.secondph.value;
            const thirdph = modFrmElem.thirdph.value;
            const email = modFrmElem.email.value;
            const birth = modFrmElem.birth.value;

            if (!idRegex.test(uid)) {
                alert('아이디는 대소문자, 숫자조합으로 4~20자 되어야 합니다.');
                e.preventDefault();
                document.querySelector('#uid').scrollIntoView();
            } else if (!pwRegex.test(currentupw)) {
                alert('현재 비밀번호를 입력해주세요.');
                e.preventDefault();
                document.querySelector('#currentupw').scrollIntoView();
            } else if (!pwRegex.test(upw)) {
                alert('수정 할 비밀번호는 대소문자, 숫자, !, @, _ 조합으로 4~100자 되어야합니다.');
                e.preventDefault();
                document.querySelector('#upw').scrollIntoView();
            } else if (upw !== upwcheck) {
                alert('수정할 비밀번호 확인을 확인해주세요.');
                e.preventDefault();
                document.querySelector('#upwcheck').scrollIntoView();
            } else if (!nmRegex.test(nm)) {
                alert('이름은 한글 조합으로 2~10자 여야합니다.');
                e.preventDefault();
                document.querySelector('#nm').scrollIntoView();
            } else if (!firstphRegex.test(firstph)) {
                alert('휴대전화 앞자리를 선택해주세요.');
                e.preventDefault();
                document.querySelector('#firstph').scrollIntoView();
            } else if (!secondphRegex.test(secondph)) {
                alert('휴대전화 두번째 자리를 입력해주세요.');
                e.preventDefault();
                document.querySelector('#secondph').scrollIntoView();
            } else if (!thirdphRegex.test(thirdph)) {
                alert('휴대전화 세번째 자리를 입력해주세요.');
                e.preventDefault();
                document.querySelector('#firstph').scrollIntoView();
            } else if (!emailRegex.test(email)) {
                alert('이메일 형식을 확인해주세요. Ex) abc123@examle.com');
                e.preventDefault();
                document.querySelector('#email').scrollIntoView();
            } else if (!birthRegex.test(birth)) {
                alert('생년월일 6자리를 확인해주세요. Ex) 880101');
                e.preventDefault();
                document.querySelector('#birth').scrollIntoView();
            } else {
                alert('회원 정보가 수정되었습니다.');
            }
        });

        //누른키에서 손 땔때 발생(이메일)
        modFrmElem.email.addEventListener('keyup', () => {
            const emailChkMsgElem = modFrmElem.querySelector('#email-chk-msg');
            emailChkMsgElem.innerText = '';
            emailChkState = 2;
        });

        const emailBtnChkElem = modFrmElem.querySelector('#email-btn-chk');
        if (emailBtnChkElem) {
            //이메일 중복 체크 버튼
            emailBtnChkElem.addEventListener('click', () => {
                const emailVal = modFrmElem.email.value;
                if (!emailRegex.test(emailVal)) {
                    alert(msg2);
                    return;
                }
                myFetch.get(`/user/emailChk`, (data) => {
                    setEmailChkMsg(data);
                }, { 'email' : emailVal});
            });
        }
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