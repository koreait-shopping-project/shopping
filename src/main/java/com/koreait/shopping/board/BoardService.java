package com.koreait.shopping.board;

import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
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

    /* 게시물 총 갯수 */
    public int getTotal(int isubctegory) {
        return mapper.getTotal(isubctegory);
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

    public List<BoardProductVo> selProductList(Criteria cri) {
        return mapper.selProductList(cri);
    }

    public BoardProductEntity selProductDetail(BoardProductVo vo) {
        return mapper.selProductDetail(vo);
    }

    public List<BoardProductVo> selDetailList(BoardProductVo vo) { return mapper.selDetailList(vo); }

    public int updProductDetail(BoardProductVo vo) {return mapper.updProductDetail(vo);}

    public int insCart(BoardProductVo vo) {return mapper.insCart(vo);}
    public List<BoardProductVo> selCart(UserEntity entity) {return mapper.selCart(entity);}
    public int delCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.delCart(vo);
    }
    public int selectedCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.selectedCart(vo);
    }

    public int updCartUp(BoardProductVo vo) {
        return mapper.updCartUp(vo);
    }

    public int updCartDown(BoardProductVo vo) {
        return mapper.updCartDown(vo);
    }

    public BoardProductVo selSize(BoardProductVo vo) {
        return mapper.selSize(vo);
    }

    public List<BoardProductVo> searchProductList (BoardProductEntity entity) {
        return mapper.searchProductList(entity);
    }

    public List<BoardListVo> searchBoardList(BoardListDto dto) {
        System.out.println("icategory : " + dto.getIcategory());
        return mapper.searchBoardList(dto);
    }

}