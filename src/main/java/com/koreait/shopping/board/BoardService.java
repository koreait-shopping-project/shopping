package com.koreait.shopping.board;

import com.koreait.shopping.menu.MenuMapper;
import com.koreait.shopping.model.dto.BoardDto;
import com.koreait.shopping.model.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
    @Autowired
    private MenuMapper mapper;

    public List<BoardVo> selBoardList(BoardDto dto) {
        return mapper.selBoardList(dto);
    }
}

