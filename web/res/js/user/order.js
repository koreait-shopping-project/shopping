{
    const frmSubmitElem = document.querySelector('#frmSubmit');
    const nmRegex = /^([가 -힣]{2,10})$/; //`한글 2~10자 조합 (영어, 특수기호X)
    const firstphRegex = /^([0-9]{3})$/;
    const secondphRegex = /^([0-9]{4})$/;
    const thirdphRegex = /^([0-9]{4})$/;
    const emailRegex = /^(?=.{8,50}$)([0-9a-z_]{4,})@([0-9a-z][0-9a-z\-]*[0-9a-z]\.)?([0-9a-z][0-9a-z\-]*[0-9a-z])\.([a-z]{2,15})(\.[a-z]{2})?$/;
    const postnumRegex = /^([0-9]{5})$/;
    const addRegex = /^([가 -힣]{2,50})$/; //`한글 숫자 50자 이하 조합 (영어, 특수기호X)

    if (frmSubmitElem) {
        frmSubmitElem.addEventListener('submit', (e) => {

            const oname = frmSubmitElem.oname.value;
            const oemail = frmSubmitElem.oemail.value;
            const ofirstph = frmSubmitElem.ofirstph.value;
            const osecondph = frmSubmitElem.osecondph.value;
            const othirdph = frmSubmitElem.othirdph.value;
            const opost_num = frmSubmitElem.sample4_postcode.value;
            const oload_nm = frmSubmitElem.sample4_roadAddress.value;
            const olot_addr = frmSubmitElem.sample4_jibunAddress.value;
            const odetail_addr = frmSubmitElem.sample4_detailAddress.value;
            const oref = frmSubmitElem.sample4_extraAddress.value;
            const rname = frmSubmitElem.rname.value;
            const rfirstph = frmSubmitElem.rfirstph.value;
            const rsecondph = frmSubmitElem.rsecondph.value;
            const rthirdph = frmSubmitElem.rthirdph.value;
            const rpost_num = frmSubmitElem.sample5_postcode.value;
            const rload_nm = frmSubmitElem.sample5_roadAddress.value;
            const rlot_addr = frmSubmitElem.sample5_jibunAddress.value;
            const rdetail_addr = frmSubmitElem.sample5_detailAddress.value;
            const rref = frmSubmitElem.sample5_extraAddress.value;
            const card = frmSubmitElem.card;
            const banktransfer = frmSubmitElem.banktransfer;
            const payagent_agree_flag = frmSubmitElem.payagent_agree_flag;

            if (!nmRegex.test(oname)) {
                alert('[주문]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#oname').scrollIntoView();
            } else if (!emailRegex.test(oemail)) {
                alert('[이메일]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#oemail').scrollIntoView();
            } else if (!firstphRegex.test(ofirstph) || !secondphRegex.test(osecondph) || !thirdphRegex.test(othirdph)) {
                alert('[휴대전화]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#ofirstph').scrollIntoView();
            } else if (!postnumRegex.test(opost_num)) {
                alert('[주소-우편번호]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample4_postcode').scrollIntoView();
            } else if (!addRegex.test(oload_nm)) {
                alert('[주소-도로명]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample4_roadAddress').scrollIntoView();
            } else if (!addRegex.test(olot_addr)) {
                alert('[주소-지번]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample4_jibunAddress').scrollIntoView();
            } else if (!addRegex.test(odetail_addr)) {
                alert('[주소-상세]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample4_detailAddress').scrollIntoView();
            } else if (!addRegex.test(oref)) {
                alert('[주소-참고항목]주문 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample4_extraAddress').scrollIntoView();
            } else if (!nmRegex.test(rname)) {
                alert('[받는사람]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#rname').scrollIntoView();
            } else if (!firstphRegex.test(rfirstph) || !secondphRegex.test(rsecondph) || !thirdphRegex.test(rthirdph)) {
                alert('[휴대전화]주문자 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#rfirstph').scrollIntoView();
            } else if (!postnumRegex.test(rpost_num)) {
                alert('[주소-우편번호]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample5_postcode').scrollIntoView();
            } else if (!addRegex.test(rload_nm)) {
                alert('[주소-도로명]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample5_roadAddress').scrollIntoView();
            } else if (!addRegex.test(rlot_addr)) {
                alert('[주소-지번]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample5_jibunAddress').scrollIntoView();
            } else if (!addRegex.test(rdetail_addr)) {
                alert('[주소-상세]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample5_detailAddress').scrollIntoView();
            } else if (!addRegex.test(rref)) {
                alert('[주소-참고항목]배송지 정보는 필수 입력 사항입니다.');
                e.preventDefault();
                document.querySelector('#sample5_extraAddress').scrollIntoView();
            } else if (!card.checked && !banktransfer.checked) {
                alert('결제 수단을 선택해주세요.');
                e.preventDefault();
                document.querySelector('#pay_method').scrollIntoView();
            } else if (!payagent_agree_flag.checked) {
                alert('결제대행서비스 약관 동의는 필수 사항입니다.');
                e.preventDefault();
                document.querySelector('#payagent_agree_flag').scrollIntoView();
            }
        })
    }

}



{
    //select 에서 원하는 option 선택시 이벤트 발생
    function changeSelect() {
        const msgElem = document.querySelector('#msg');
        const self_inputElem = document.querySelector('#self_input');

        if (msgElem.options[msgElem.selectedIndex].value === '직접 입력') {
            self_inputElem.type = 'text';
        } else
            self_inputElem.type = 'hidden';
            self_inputElem.value = '';
        }
}
{
    const cardElem = document.querySelector('#card');
    const banktransferElem = document.querySelector('#banktransfer');
    const cardtableElem = document.querySelector('#cardtable');
    const banktransfertableElem = document.querySelector('#banktransfertable');

    if (cardElem) {
        cardElem.addEventListener('click', () => {
            cardtableElem.className = '';
            banktransfertableElem.className = 'hidden';
        })
    } else {
        cardtableElem.className = 'hidden';
        cardtableElem.value = '';
    }

    if (banktransferElem) {
        banktransferElem.addEventListener('click', () => {
            banktransfertableElem.className = '';
            cardtableElem.className = 'hidden';
        })
    } else {
        banktransfertableElem.className = 'hidden';
        banktransfertableElem.value = '';

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

{
    //카카오 우편주소 검색 API
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample5_execDaumPostcode() {
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
                document.getElementById('sample5_postcode').value = data.zonecode;
                document.getElementById("sample5_roadAddress").value = roadAddr;
                document.getElementById("sample5_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample5_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample5_extraAddress").value = '';
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

{
    function purchaseBtn() {
        const form = document.querySelector(`#frmSubmit`);
        form.addEventListener('submit', function () {
            window.removeEventListener("beforeunload", listener);
        })
    }
    const listener = () => {
        let icart = "";
        const item = document.getElementsByName("RowCheck");
        let indexid = false;
        for (let i = 0; i < item.length; i++) {
            if (item[i]) {
                if (indexid) {
                    icart = icart + '_';
                }
                icart = icart + item[i].value;
                indexid = true;
            }
        }
        myFetch.put(`/board/unselected/${icart}`);
    }
    window.addEventListener("beforeunload", listener);
}

{
    document.onkeydown = function () {
        if (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82) || event.keyCode ==116) {
            event.keyCode = 0;
            event.cancelBubble = true;
            event.returnValue = false;
        }
    }
}