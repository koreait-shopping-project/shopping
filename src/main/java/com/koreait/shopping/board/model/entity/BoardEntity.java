package com.koreait.shopping.board.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardEntity {
    private int iboard;
    private String title;
    private String brand;
    private String img_url;
    private int price;
    private int category_num;
    private int gender;
}
