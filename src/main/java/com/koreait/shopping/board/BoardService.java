package com.koreait.shopping.board;

import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.model.dto.ProductDto;
import com.koreait.shopping.model.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;
    @Autowired
    private UserUtils userUtils;

    public int insBoard(BoardListEntity entity) {
        try {
            entity.setIuser(userUtils.getLoginUserPk());
            return mapper.insBoard(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<BoardListVo> selBoardList(BoardListDto dto) {
        return mapper.selBoardList(dto);
    }

    public BoardListVo selBoard(BoardListVo vo) {
        System.out.println(vo.getIboard());
        System.out.println(userUtils.getLoginUserPk());

        return mapper.selBoardDetail(vo);
    }

    public int updBoard(BoardListEntity entity) {
        try {
            entity.setIuser(userUtils.getLoginUserPk());
            return mapper.updBoard(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public BoardPrevNextVo BoardPrevNext(BoardListVo vo) {
        return mapper.selPrevNext(vo);
    }

    public int delBoard(BoardListEntity entity) {
        entity.setIuser(userUtils.getLoginUserPk());
        return mapper.delBoard(entity);
    }

    public List<BoardProductVo> selProductList(BoardProductDto dto) {
        return mapper.selProductList(dto);
    }

    public BoardProductEntity selProductDetail(BoardProductVo vo) {
        return mapper.selProductDetail(vo);
    }

    public List<BoardProductVo> selDetailList(BoardProductVo vo) { return mapper.selDetailList(vo); }

    public int updProductDetail(BoardProductVo vo) {return mapper.updProductDetail(vo);}

    public int insCart(BoardProductVo vo) {return mapper.insCart(vo);}

    public BoardProductVo selSize(BoardProductVo vo) {
        return mapper.selSize(vo);
    }

    public List<BoardProductVo> searchProductList (BoardProductEntity entity) {
        System.out.println(entity.getTitle());
        return mapper.searchProductList(entity);
    }
    public List<ProductVo> selProductListRecord(ProductDto dto){
        int startIdx = (dto.getCurrentPage() - 1) * dto.getRecordCount();
        if(startIdx < 0){
            startIdx = 0;
        }
        dto.setStartIdx(startIdx);
        return mapper.selProductListRecord(dto);
    }
}