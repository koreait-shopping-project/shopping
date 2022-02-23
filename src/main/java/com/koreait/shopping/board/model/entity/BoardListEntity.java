package com.koreait.shopping.board.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardListEntity {
    private int iboard;
    private int icategory;
    private int iuser;
    private String title;
    private String ctnt;
    private String notice;
    private String rdt;
}
