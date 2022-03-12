package com.koreait.shopping.board.like;

import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.entity.BoardLikeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardLikeService {
    @Autowired private BoardLikeMapper mapper;
    @Autowired private UserUtils utils;

    public int insBoardLike(BoardLikeEntity entity) {
        entity.setIuser(utils.getLoginUserPk());
        return mapper.insBoardLike(entity);
    }

    public BoardLikeEntity selBoardLike(int iboard) {
        return mapper.selBoardLike(createBoardFavEntity(iboard));
    }

    public int delBoardLike(int iboard) {
        return mapper.delBoardLike(createBoardFavEntity(iboard));
    }

    private BoardLikeEntity createBoardFavEntity(int iboard) {
        BoardLikeEntity entity = new BoardLikeEntity();
        entity.setIboard(iboard);
        entity.setIuser(utils.getLoginUserPk());
        return entity;
    }

    public int selBoardLikeNum(int iboard) {
        return mapper.selBoardLikeNum(iboard);
    }

}
