package com.koreait.shopping.board.like;

import com.koreait.shopping.Const;
import com.koreait.shopping.board.model.entity.BoardLikeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/board/like")
public class BoardLikeController {

    @Autowired BoardLikeService service;

    @PostMapping
    public Map<String, Integer> insBoardLike(@RequestBody BoardLikeEntity entity) {
        Map<String, Integer> result = new HashMap<>();
        result.put(Const.RESULT, service.insBoardLike(entity));
        return result;
    }

    @GetMapping("/{iboard}")
    public Map<String, Integer> isLike(@PathVariable int iboard) {
        BoardLikeEntity dbEntity = service.selBoardLike(iboard);
        Map<String, Integer> result = new HashMap<>();
        result.put(Const.RESULT, dbEntity == null ? 0 : 1);
        return result;
    }

    @DeleteMapping("/{iboard}")
    public Map<String, Integer> delBoardLike(@PathVariable int iboard) {
        Map<String, Integer> result = new HashMap<>();
        result.put(Const.RESULT, service.delBoardLike(iboard));
        return result;
    }
}
