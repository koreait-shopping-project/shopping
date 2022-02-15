package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardDto;
import com.koreait.shopping.board.model.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;

    public List<BoardVo> selBoardList(BoardDto dto) {
        System.out.println(dto.getBrand());
        return mapper.selBoardList(dto);
    }
}

