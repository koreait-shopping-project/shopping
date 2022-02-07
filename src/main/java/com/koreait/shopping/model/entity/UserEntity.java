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
    private String email;
    private String birth;
    private String location;
    private String recommendation;//추천인
    private int isemailconsent;//이메일수신동의
    private int issmsconsent;//sms수신동의
    private String joindate;//회원가입날짜
    private String moddate;//개인정보수정날짜


}
