package com.koreait.shopping;

import com.koreait.shopping.user.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.Date;

@Component
public class UserUtils {
    @Autowired
    private HttpSession hs;

    public void setLoginUser(UserEntity entity) {
        hs.setAttribute(Const.LOGIN_USER, entity);
    }

    public UserEntity getLoginUser() {
        return (UserEntity) hs.getAttribute(Const.LOGIN_USER);
    }

    // 로그인이 안되어있다면 return 0
    public int getLoginUserPk() {
        return getLoginUser() == null ? 0 : getLoginUser().getIuser();
    }

    public String getRandomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8',
                '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
                'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
                'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
                's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!',
                '@', '#', '$', '%', '^', '&'
        };
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());
        int idx = 0;
        int len = charSet.length;
        for (int i = 0; i < size; i++) {
            idx = (int) (len * Math.random());
            idx = sr.nextInt(len);
            // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }
        return sb.toString();
    }
}
