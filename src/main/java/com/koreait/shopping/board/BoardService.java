package com.koreait.shopping.board;

import com.koreait.shopping.Paging.BoardCriteria;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import com.koreait.shopping.user.model.entity.UserReviewEntity;
import com.koreait.shopping.user.model.vo.UserReviewVo;
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

    public List<BoardListVo> selBoardList(BoardCriteria cri) {
        return mapper.selBoardList(cri);
    }

    //BoardListVo -> BoardListDto 로 바꿔줌 (디테일 창에서 이전 다음글 정상화)
    public BoardListVo selBoard(BoardListDto dto) {
        System.out.println(dto.getIboard());
        System.out.println(userUtils.getLoginUserPk());

        return mapper.selBoardDetail(dto);
    }

    /* Board 게시물 총 갯수 */
    public int getBoardTotal(int icategory) {
        return mapper.getBoardTotal(icategory);
    }

    public int getSearchTotal(BoardCriteria cri) {
        return mapper.getSearchTotal(cri);
    }

    /* Product 게시물 총 갯수 */
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

    public BoardPrevNextVo selPrevNext(BoardListVo vo) {
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

    public List<UserReviewVo> selBoardReview(UserReviewVo vo) {
        return mapper.selBoardReview(vo);
    }

    public int insCart(BoardProductVo vo) {return mapper.insCart(vo);}
    public int insCartChecked(BoardProductVo vo) {return mapper.insCartChecked(vo);}

    public List<BoardProductVo> selCart(UserEntity entity) {return mapper.selCart(entity);}
    public int delCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.delCart(vo);
    }
    public int delCartChecked(int iuser) {
        return mapper.delCartChecked(iuser);
    }
    public int selectedCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.selectedCart(vo);
    }

    public List<UserReviewDto> selReview() {
        return mapper.selReview();
    }

    public int unselectedCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.unselectedCart(vo);
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
        return mapper.searchBoardList(dto);
    }

    public int insPurchased(BoardProductVo vo) {
        return mapper.insPurchased(vo);
    }

}