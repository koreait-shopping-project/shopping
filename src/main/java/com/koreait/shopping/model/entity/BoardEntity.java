package com.koreait.shopping.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardEntity {
    private int iboard;
    private String title;
    private String ctnt;
    private String img;
    private String rdt;
    private String mdt;
    private int hits;
}
