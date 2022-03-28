package com.koreait.shopping.board.model.vo;

import com.koreait.shopping.user.model.entity.UserReviewEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDetailVo extends UserReviewEntity {
    private double avgRating;
}
