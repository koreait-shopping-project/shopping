package com.koreait.shopping.user;

import com.koreait.shopping.UserUtils;
import com.koreait.shopping.user.model.UserEntity;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper mapper;
    @Autowired
    private UserUtils utils;

    public int login(UserEntity entity) {
        UserEntity dbUser = null;
        try {
            dbUser = mapper.selUser(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // 알 수 없는 에러
        }
        if (dbUser == null) { // 아이디 없음
            return 2;
        } else if (!BCrypt.checkpw(entity.getUpw(), dbUser.getUpw())) {
            return 3; // 비밀번호 틀림
        }
        dbUser.setUpw(null);
        dbUser.setJoin_date(null);
        dbUser.setMod_date(null);
        utils.setLoginUser(dbUser);
        return 1;
    }

    public int join(UserEntity entity) {
        UserEntity copyEntity = new UserEntity();//객체 복사
        BeanUtils.copyProperties(entity, copyEntity);//깊은 복사

        //비밀번호 암호화
        String hashPw = BCrypt.hashpw(entity.getUpw(), BCrypt.gensalt());
        copyEntity.setUpw(hashPw);//복사된 값에 비밀번호 암호화
        return mapper.insUser(copyEntity);
    }

    //소셜 로그인시 이메일 체크
    public int selSocial(UserEntity entity) {
        System.out.println(entity.getEmail());
        UserEntity result = mapper.selSocial(entity);
        return result == null ? 1 : 0;
    }

    //아이디 중복 체크
    public int idChk(String uid) {
        UserEntity entity = new UserEntity();
        entity.setUid(uid);

        UserEntity result = mapper.selUser(entity);

        return result == null ? 1 : 0;
    }

    //이메일 중복 체크
    public int emailChk(UserEntity entity) {
        UserEntity result = mapper.selUser(entity);
        return result == null ? 1 : 0;
    }

    //비밀번호 확인(회원 정보 수정 진입)
    public int checkpw(UserEntity entity) {
        UserEntity dbUser = null;
        try {
            dbUser = mapper.selUser(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // 알 수 없는 에러
        }
        if (BCrypt.checkpw(entity.getUpw(), dbUser.getUpw())) {
            return 1; // 비밀번호 맞음
        }
        return 2;
    }
}
