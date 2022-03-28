package com.koreait.shopping.board;

import com.koreait.shopping.Paging.BoardCriteria;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.dto.BoardProductListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.board.model.vo.ProductDetailVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import com.koreait.shopping.user.model.entity.UserReviewEntity;
import com.koreait.shopping.user.model.vo.UserReviewVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    //====================== subcategory ======================
    List<BoardProductVo> selProductList(Criteria cri);
    List<BoardProductVo> searchProductList(Criteria cri);
    BoardProductVo selIdetail(BoardProductVo vo);
    BoardProductVo selProductDetail(BoardProductVo vo);
    BoardProductVo selSize(BoardProductVo vo);
    //=====페이징=====
    int getTotal(int isubcategory);
    int getPrSearchTotal(Criteria cri);
    //====================== category ======================
    List<BoardProductVo> selDetailList(BoardProductVo vo);
    List<BoardListVo> selBoardList(BoardListDto dto);
    BoardListVo selBoardDetail(BoardListDto dto);
    //=====페이징=====
    int getBoardTotal(BoardCriteria cri);
    int getSearchTotal(BoardCriteria cri);
    //cart
    int insCart(BoardProductVo vo);
    int insCartChecked(BoardProductVo vo);
    List<BoardProductVo> selCart(UserEntity entity);
    int selectedCart(BoardProductVo vo);
    int unselectedCart(BoardProductVo vo);
    int updCartUp(BoardProductVo vo);
    int updCartDown(BoardProductVo vo);
    int delCart(BoardProductVo vo);
    //Board List
    int delCartChecked(int iuser);
    int insBoard(BoardListEntity entity);
    double selRating(ProductDetailVo vo);
    List<ProductDetailVo> rating(ProductDetailVo vo);
    int updBoard(BoardListEntity entity);
    int delBoard(BoardListEntity entity);
    BoardPrevNextVo selPrevNext(BoardListVo vo);
    List<BoardProductVo> searchProductList(BoardProductEntity entity);
    List<BoardListVo> searchBoardList(BoardListDto dto);
    List<UserReviewDto> selReview();
    List<UserReviewVo> selBoardReview(UserReviewVo vo);
    List<BoardListVo> searchBoardList(BoardCriteria cri);
    int insPurchased(BoardProductVo vo);

    //노가다
    //0
    int cntAnswer0_4 (UserReviewEntity entity);
    int cntAnswer0_5 (UserReviewEntity entity);
    int cntAnswer0_6 (UserReviewEntity entity);

    //모든 리뷰 갯수
    int cntAllAnswer (UserReviewEntity entity);
}