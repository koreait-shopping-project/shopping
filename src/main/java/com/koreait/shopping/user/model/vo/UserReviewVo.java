package com.koreait.shopping.user.model.vo;

import com.koreait.shopping.user.model.entity.UserReviewEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserReviewVo extends UserReviewEntity {
    private String uid;
    private int rating;
    private String tall;
    private String weight;
    private String ctnt;
    private String img_url_big;
    private String title;
    private int color;
    private int sm;
    private int md;
    private int lg;
    private int xl;
}
