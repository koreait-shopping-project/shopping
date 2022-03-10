package com.koreait.shopping.board;

import com.koreait.shopping.Paging.BoardCriteria;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    //subcategory
    List<BoardProductVo> selProductList(Criteria cri);
    BoardProductVo selProductDetail(BoardProductVo vo);
    BoardProductVo selSize(BoardProductVo vo);
    /* 게시판 총 갯수 */
    int getTotal(int isubcategory);
    //category
    List<BoardProductVo> selDetailList(BoardProductVo vo);
    List<BoardListVo> selBoardList(BoardListDto dto);
    BoardListVo selBoardDetail(BoardListDto dto);
    int getBoardTotal(int icategory);
    int getSearchTotal(BoardCriteria cri);
    int insCart(BoardProductVo vo);
    int insCartChecked(BoardProductVo vo);
    int delCart(BoardProductVo vo);
    int delCartChecked(int iuser);
    int selectedCart(BoardProductVo vo);
    int unselectedCart(BoardProductVo vo);
    int updCartUp(BoardProductVo vo);
    int updCartDown(BoardProductVo vo);
    List<BoardProductVo> selCart(UserEntity entity);
    int insBoard(BoardListEntity entity);
    int updBoard(BoardListEntity entity);
    int delBoard(BoardListEntity entity);
    BoardPrevNextVo selPrevNext(BoardListVo vo);
    List<BoardProductVo> searchProductList(BoardProductEntity entity);
    List<BoardListVo> searchBoardList(BoardListDto dto);
    List<UserReviewDto> selReview();
    int insPurchased(BoardProductVo vo);
}