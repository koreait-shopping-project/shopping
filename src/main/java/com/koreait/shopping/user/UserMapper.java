package com.koreait.shopping.user;

import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;

import com.koreait.shopping.user.model.entity.UserOrderEntity;
import com.koreait.shopping.user.model.entity.UserPurchasedEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    int insUser(UserEntity entity);
    int insReview (UserReviewDto entity);
    int insOrder(UserOrderEntity entity);
    UserEntity selUser(UserEntity entity);
    UserEntity selMdUser(UserDto dto);
    int selReview(UserReviewDto dto);
    int updUserPw(UserEntity entity);
    UserEntity selSocial(UserEntity entity);
    List<BoardProductVo> checkedCart(UserEntity entity);
    List<BoardProductVo> selPurchased(UserReviewDto entity);
    List<BoardProductVo> selPurchased2(UserPurchasedEntity entity);
    int updProductDetail(BoardProductVo vo);

}
