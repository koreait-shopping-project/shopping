package com.koreait.shopping.board.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardEntity {
    private int iboard;
    private String title;
    private String brand;
    private String imgUrl;
    private int price;
    private int categorynum;
    private int gender;
    private int color;
    private int hits;
//    private String rdt;
//    private String mdt;
}
