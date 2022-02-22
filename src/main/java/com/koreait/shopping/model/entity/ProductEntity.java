package com.koreait.shopping.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductEntity {
    private int iboard;
    private String title;
    private String ctnt;
    private int icategory;
    private int isubcategory;
    private int iuser;
    private int hits;
    private int isdel;
    private String rdt;
    private String mdt;
    private String lastip;
}
