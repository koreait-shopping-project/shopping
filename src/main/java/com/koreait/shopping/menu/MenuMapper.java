package com.koreait.shopping.menu;

import com.koreait.shopping.model.entity.BoardCategoryEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<BoardCategoryEntity> selMenuCategoryList();
}
