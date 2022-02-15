{
    const checkpwFrm = document.querySelector('#checkpw_frm'); // checkpw from
    const checkpw_submit_btn = document.querySelector('#checkpw_submit'); // checkpw btn
    const dbupw = checkpwFrm.querySelector('#upw');

    // enter 하면 checkpw 버튼 이벤트 실행
    checkpw_submit_btn.addEventListener('enter', () => {
        checkpwBtnEvent();
    });

    const checkpwBtnEvent = () => {
        if (checkpw_frm) {
            checkpw_submit_btn.addEventListener('click', e => {
                const upw = checkpw_frm.upw.value; // password input value
                if (upw === '') {
                    alert('비밀번호를 입력해주세요!');
                    e.preventDefault();
                }
            });
        }
    }
    checkpwBtnEvent();
}