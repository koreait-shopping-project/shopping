{
    kakaoLoginElem = document.querySelector('#kakaologin');
    kakaoLoginElem.addEventListener('click', ()=> {
        kakaoLogin();
    });

    Kakao.init("1cdf5191c92e44feb67b46c6a6586582");

    function kakaoLogin() {
        Kakao.Auth.login({
            scope: 'account_email, gender, birthday',
            success: function (authObj) {
                console.log(authObj);
                Kakao.API.request({
                    url:'/v2/user/me',
                    success: res => {
                        const account_email = res.kakao_account.email;
                        const gender = res.kakao_account.gender;
                        const birthday = res.kakao_account.birthday;
                        console.log(account_email);
                        console.log(gender);
                        console.log(birthday);
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
            window.location.href='/user/kakaologin'
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
    };
}