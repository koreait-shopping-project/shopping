package com.koreait.shopping.user.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserReviewEntity {
    private int ireview;
    private int iboard;
    private int iuser;
    private int rating;
    private int answer0;
    private int answer1;
    private int answer2;
    private int answer3;
    private int gender;
    private String tall;
    private String weight;
    private String ctnt;
    private boolean prom_agree_flag;//홍보 컨텐츠 동의
    private boolean inf_agree_flag;//정보 수집 동의
}
