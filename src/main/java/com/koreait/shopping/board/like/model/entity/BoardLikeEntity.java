package com.koreait.shopping.board.like.model.entity;


import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BoardLikeEntity {
    private int iboard;
    private int iuser;
    private String rdt;
    private int likeNum;
}
