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
    private String postnum;//우편번호
    private String loadnm;//도로명주소
    private String lotaddr;//지번주소
    private String detailaddr;//상세주소
    private String ref;//상세항목
    private int gender;
    private String email;
    private String birth;
    private String location;
    private String recommendation;//추천인
    private boolean isemailconsent;//이메일수신동의
    private boolean issmsconsent;//sms수신동의
    private String joindate;//회원가입날짜
    private String moddate;//개인정보수정날짜


    private String joindata;
    private String profileimg;
    private String cardinfo;
    private String rdt;
    private String mdt;
}
