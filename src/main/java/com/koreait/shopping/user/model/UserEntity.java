package com.koreait.shopping.user.model;

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
    private String social;
    private String post_num;//우편번호
    private String load_nm;//도로명주소
    private String lot_addr;//지번주소
    private String detail_addr;//상세주소
    private String ref;//상세항목
    private int gender;
    private String email;
    private String birth;
    private String location;
    private String recommendation;//추천인
    private boolean admin_flag;//관리자
    private boolean email_agree_flag;//이메일수신동의
    private boolean sms_agree_flag;//sms수신동의
    private String join_date;//회원가입날짜
    private String mod_date;//개인정보수정날짜
}
