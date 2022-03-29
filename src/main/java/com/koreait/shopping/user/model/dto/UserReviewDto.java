package com.koreait.shopping.user.model.dto;

import com.koreait.shopping.user.model.entity.UserReviewEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserReviewDto extends UserReviewEntity {
    private String writerNm;
    private int ipurchased;
}
