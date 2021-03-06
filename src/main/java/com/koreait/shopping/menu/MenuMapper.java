package com.koreait.shopping.menu;

import com.koreait.shopping.board.model.entity.BoardCategoryEntity;
import com.koreait.shopping.board.model.entity.BoardSubcategoryEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<BoardCategoryEntity> selMenuCategoryList();
    List<BoardSubcategoryEntity> selSubMenuCategoryList();
}
