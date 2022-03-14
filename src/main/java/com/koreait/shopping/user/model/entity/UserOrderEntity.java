package com.koreait.shopping.user.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserOrderEntity {
    private int iorder;
    private String oname;
    private String oemail;
    private String ofirsthnum;
    private String osecondhnum;
    private String othirdhnum;
    private String ofirstph;
    private String osecondph;
    private String othirdph;
    private String opost_num;
    private String oload_nm;
    private String olot_addr;
    private String odetail_addr;
    private String oref;
    private String rname;
    private String rpost_num;
    private String rload_nm;
    private String rlot_addr;
    private String rdetail_addr;
    private String rref;
    private String rfirsthnum;
    private String rsecondhnum;
    private String rthirdhnum;
    private String rfirstph;
    private String rsecondph;
    private String rthirdph;
    private String msg;
    private int pay_method;
    private boolean payagent_agree_flag;
    private String buy_date;
}
