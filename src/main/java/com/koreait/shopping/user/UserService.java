package com.koreait.shopping.user;

import com.koreait.shopping.UserUtils;
import com.koreait.shopping.model.entity.UserEntity;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired private UserMapper mapper;
    @Autowired private UserUtils utils;

    public int login(UserEntity entity){
        UserEntity dbUser = null;
        try{
            dbUser = mapper.selUser(entity);
        }catch(Exception e){
            e.printStackTrace();
            return 0; // 알 수 없는 에러
        }
        if(dbUser == null){ // 아이디 없음
            return 2;
        }else if(!BCrypt.checkpw(entity.getUpw(), dbUser.getUpw())){
            return 3; // 비밀번호 틀림
        }
        dbUser.setUpw(null);
        dbUser.setRdt(null);
        dbUser.setMdt(null);
        utils.setLoginUser(dbUser);
        return 1;
    }
}
