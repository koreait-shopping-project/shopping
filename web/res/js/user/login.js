{
    const login_frm = document.querySelector('#login_frm'); // login from
    const login_submit_btn = document.querySelector('#login_submit'); // login btn

    // enter 하면 login 버튼 이벤트 실행
    login_submit_btn.addEventListener('enter', () => {
        loginBtnEvent();
    });

    const loginBtnEvent = () => {
        if (login_frm) {
            login_submit_btn.addEventListener('click', e => {
                const uid = login_frm.uid.value; // id input value
                const upw = login_frm.upw.value; // password input value
                if (uid === '') {
                    alert('아이디를 입력해주세요!');
                    e.preventDefault();
                } else if (upw === '') {
                    alert('비밀번호를 입력해주세요!');
                    e.preventDefault();
                }
            });
        }
    }
    loginBtnEvent();
}