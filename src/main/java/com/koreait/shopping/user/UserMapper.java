package com.koreait.shopping.user;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;

import com.koreait.shopping.user.model.entity.UserReviewEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    int insUser(UserEntity entity);
    UserEntity selUser(UserEntity entity);
    UserEntity selMdUser(UserDto dto);
    int updUserPw(UserEntity entity);
    UserEntity selSocial(UserEntity entity);
    int insReview (UserReviewEntity entity);
    List<BoardProductDto> checkedCart(UserEntity entity);

}
