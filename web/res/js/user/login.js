{
    const login_frm = document.querySelector('#login_frm'); // login from
    const login_submit_btn = document.querySelector('#login_submit'); // login btn

    // enter 누를 시 login 버튼 이벤트 실행
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

    //================================카카오 로그인===================================
    kakaoLoginElem = document.querySelector('#kakaologin');
    kakaoLoginElem.addEventListener('click', ()=> {
        kakaoLogin();
    });

    Kakao.init("1cdf5191c92e44feb67b46c6a6586582");

    function kakaoLogin() {
        Kakao.Auth.login({
            scope: 'account_email',
            success: function (authObj) {
                console.log(authObj);
                Kakao.API.request({
                    url:'/v2/user/me',
                    success: res => {
                        const account_email = res.kakao_account.email;
                        const social = 'kakao';
                        const param = {
                            'email' : account_email
                        }
                        // const gender = res.kakao_account.gender;
                        // const birthday = res.kakao_account.birthday;
                        myFetch.get('/user/selSocial', data => {
                            switch (data.result) {
                                case 1:
                                    window.location.href = `/user/join?social=${social}&email=${account_email}`;
                                    break;
                                case 0:
                                    window.location.href = '/user/main'
                                    break;
                            }
                        }, param);
                    }
                });
                // window.location.href="/board/main"
            },
        });
    }

    kakaoLogoutElem = document.querySelector('#kakaologout');
    kakaoLogoutElem.addEventListener('click', ()=> {
        kakaoLogout();
    });
    function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
            console.log('Not logged in,');
            return;
        }
        Kakao.Auth.logout(function (response) {
            alert(response + 'logout');
            window.location.href = '/user/login'
        });
    }

    kakaosecessionElem = document.querySelector('#kakaosecession');
    kakaosecessionElem.addEventListener('click', ()=> {
        secession();
    });
    function secession() {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(response) {
                console.log(response);
                //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                window.location.href='/'
            },
            fail: function(error) {
                console.log('탈퇴 미완료')
                console.log(error);
            },
        });
    }

    //================================구글 로그인===================================
    googleLoginElem = document.querySelector('#googleLogout');
    googleLoginElem.addEventListener('click', () => {
        signOut();
    });
    //처음 실행하는 함수
    function init() {
        gapi.load('auth2', function () {
            gapi.auth2.init();
            options = new gapi.auth2.SigninOptionsBuilder();
            options.setPrompt('select_account');
            // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
            options.setScope('email https://www.googleapis.com/auth/userinfo.email');
            // 인스턴스의 함수 호출 - element에 로그인 기능 추가
            // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
            gapi.auth2.getAuthInstance().attachClickHandler('googleLogin', options, onSignIn, onSignInFailure);
        });
    }

    function onSignIn(googleUser) {
        const profile = googleUser.getBasicProfile();
        const email = profile.getEmail();
        const social = 'google'
        const param = {
            'email' : email
        }
        // window.location.href="/user/join?email=" + email;
        // console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        // console.log('Name: ' + profile.getName());
        // console.log('Image URL: ' + profile.getImageUrl());
        myFetch.get('/user/selSocial', data => {
            switch (data.result) {
                case 1:
                    window.location.href = `/user/join?social=${social}&email=${email}`;
                    break;
                case 0:
                    window.location.href = '/user/main'
                    break;
            }
        }, param);
    }

    function onSignInFailure(t) {
        console.log(t);
    }

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
    }

    googleLoginElem = document.querySelector('#secession');
    googleLoginElem.addEventListener('click', () => {
        revokeAccess();
    });

    function revokeAccess() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.disconnect().then(function () {
            console.log('탈퇴');
        });
    }
}