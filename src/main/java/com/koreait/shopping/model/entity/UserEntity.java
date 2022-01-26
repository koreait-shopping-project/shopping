package com.koreait.shopping.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserEntity {
    private int iuser;
    private String uid;
    private String upw;
    private String nm;
    private String hnum;
    private String ph;
    private String addr;
    private int gender;
    private String joindata;
    private String profileimg;
    private String cardinfo;
}
