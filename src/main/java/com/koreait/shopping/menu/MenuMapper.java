package com.koreait.shopping.menu;

import com.koreait.shopping.model.dto.BoardDto;
import com.koreait.shopping.model.entity.BoardCategoryEntity;
import com.koreait.shopping.model.entity.BoardSubcategoryEntity;
import com.koreait.shopping.model.vo.BoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<BoardCategoryEntity> selMenuCategoryList();
    List<BoardSubcategoryEntity> selSubMenuCategoryList();
}
