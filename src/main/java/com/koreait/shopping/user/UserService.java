package com.koreait.shopping.user;

import com.koreait.shopping.UserUtils;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.entity.UserReviewEntity;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        if (!entity.getSocial().equals("general")) {
            System.out.println("social :" + entity.getSocial());
            String[] uid = entity.getEmail().split("@");
            System.out.println("uid : " + uid[0]);
            entity.setUid(uid[0]);
            entity.setUpw(utils.getRandomPassword(15));
        }
        UserEntity copyEntity = new UserEntity();//객체 복사
        BeanUtils.copyProperties(entity, copyEntity);//깊은 복사

        //비밀번호 암호화
        String hashPw = BCrypt.hashpw(entity.getUpw(), BCrypt.gensalt());
        copyEntity.setUpw(hashPw);//복사된 값에 비밀번호 암호화
        utils.setLoginUser(entity);
        return mapper.insUser(copyEntity);
    }

    public int review(UserReviewEntity entity) {

        entity.setIboard(utils.getLoginUserPk());
        entity.setIuser(utils.getLoginUserPk());
        System.out.println("entity : " + entity);
        return mapper.insReview(entity);
    }

    //소셜 로그인시 이메일 체크
    public int selSocial(UserEntity entity) {
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
        if (!BCrypt.checkpw(entity.getUpw(), dbUser.getUpw())) {
            return 2; // 비밀번호 틀림
        }
        return 1;
    }

    public int modify(UserDto dto) {
        dto.setIuser(utils.getLoginUserPk());
        UserEntity dbUser = mapper.selMdUser(dto);
        if(!BCrypt.checkpw(dto.getCurrentupw(), dbUser.getUpw()))       {
            return 2;
        }
        String hashedPw = BCrypt.hashpw(dto.getUpw(), BCrypt.gensalt());
        dto.setUpw(hashedPw);
        return mapper.updUserPw(dto);
    }

    public List<BoardProductDto> checkedCart(UserEntity entity) {
        return mapper.checkedCart(entity);
    }
}
