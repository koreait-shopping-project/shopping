package com.koreait.shopping.user;

import com.koreait.shopping.UserUtils;

import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.entity.UserOrderEntity;
import com.koreait.shopping.user.model.entity.UserPurchasedEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
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
        dbUser.setSocial(null);
        dbUser.setGender(0);
        dbUser.setJoin_date(null);
        dbUser.setMod_date(null);
        dbUser.setJoin_date(null);
        dbUser.setMod_date(null);
        utils.setLoginUser(dbUser);
        return 1;
    }

    public int join(UserEntity entity) {
        if (!entity.getSocial().equals("general")) {
            String[] uid = entity.getEmail().split("@");
            entity.setUid(uid[0]);
            entity.setUpw(utils.getRandomPassword(15));
        }
        UserEntity copyEntity = new UserEntity();//객체 복사
        BeanUtils.copyProperties(entity, copyEntity);//깊은 복사

        //비밀번호 암호화
        String hashPw = BCrypt.hashpw(entity.getUpw(), BCrypt.gensalt());
        copyEntity.setUpw(hashPw);//복사된 값에 비밀번호 암호화
        return mapper.insUser(copyEntity);
    }

    public int review(UserReviewDto dto) {
        dto.setIuser(utils.getLoginUserPk());
        return mapper.insReview(dto);
    }

    public int selReview(UserReviewDto dto) {
        dto.setIuser(utils.getLoginUserPk());
        return mapper.selReview(dto);
    }

    public int order(UserOrderEntity entity) {
        return mapper.insOrder(entity);
    }

    public List<BoardProductVo> selPurchased(UserReviewDto entity) {
        entity.setIuser(utils.getLoginUserPk());
        return mapper.selPurchased(entity);
    }

    public List<BoardProductVo> selPurchased2(UserPurchasedEntity entity) {
        entity.setIuser(utils.getLoginUserPk());
        return mapper.selPurchased2(entity);
    }


    //소셜 로그인시 이메일 체크
    public int selSocial(UserEntity entity) {
        UserEntity result = mapper.selSocial(entity);
        return result == null ? 1 : 0;
    }

    //소셜 로그인
    public int loginSocial(UserEntity entity) {
        UserEntity result = mapper.selSocial(entity);
        UserEntity dbUser = mapper.selSocial(entity);
        dbUser.setUpw(null);
        dbUser.setSocial(null);
        dbUser.setGender(0);
        dbUser.setJoin_date(null);
        dbUser.setMod_date(null);
        dbUser.setJoin_date(null);
        dbUser.setMod_date(null);
        utils.setLoginUser(dbUser);
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

    public List<BoardProductVo> checkedCart(UserEntity entity) {
        return mapper.checkedCart(entity);
    }

    public int updProductDetail(BoardProductVo vo) {return mapper.updProductDetail(vo);}
}
