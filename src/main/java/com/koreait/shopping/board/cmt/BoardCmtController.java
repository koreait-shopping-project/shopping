package com.koreait.shopping.board.cmt;

import com.koreait.shopping.board.cmt.model.entity.BoardCmtEntity;
import com.koreait.shopping.board.cmt.model.vo.BoardCmtVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/board/cmt")
public class BoardCmtController {

    @Autowired private BoardCmtService service;

    @PostMapping
    public Map<String, Integer> insBoardCmt(@RequestBody BoardCmtEntity entity) {
        Map<String, Integer> result = new HashMap<>();
        result.put("result", service.insBoardCmt(entity));
        return result;
    }

    @GetMapping("/{iboard}")
    public List<BoardCmtVo> selBoardCmtList(@PathVariable int iboard) {
        return service.selBoardCmtList(iboard);
    }

    @PutMapping
    public Map<String, Integer> updBoardCmt(@RequestBody BoardCmtEntity entity) {
        Map<String, Integer> result = new HashMap<>();
        result.put("result", service.updBoardCmt(entity));
        return result;
    }

    @DeleteMapping("/{icmt}")
    public Map<String, Integer> delBoardCmt(@PathVariable int icmt) {
        Map<String, Integer> result = new HashMap<>();
        result.put("result", service.delBoardCmt(icmt));
        return result;
    }
}