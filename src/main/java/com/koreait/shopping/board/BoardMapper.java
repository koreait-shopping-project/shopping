package com.koreait.shopping.board;

import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.ResultVo;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
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
    BoardListVo selBoardDetail(BoardListVo vo);
    int insCart(BoardProductVo vo);
    int delCart(BoardProductVo vo);
    int updCartUp(BoardProductVo vo);
    int updCartDown(BoardProductVo vo);
    List<BoardProductVo> selCart(UserEntity entity);
    int insBoard(BoardListEntity entity);
    int updBoard(BoardListEntity entity);
    int delBoard(BoardListEntity entity);
    int updProductDetail(BoardProductVo vo);
    BoardPrevNextVo selPrevNext(BoardListVo vo);
    List<BoardProductVo> searchProductList(BoardProductEntity entity);
    List<BoardListVo> searchBoardList(BoardListDto dto);
}