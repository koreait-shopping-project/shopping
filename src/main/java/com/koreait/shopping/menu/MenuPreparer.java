package com.koreait.shopping.menu;

import com.koreait.shopping.Const;
import com.koreait.shopping.model.entity.BoardCategoryEntity;
import com.koreait.shopping.model.entity.BoardSubcategoryEntity;
import com.koreait.shopping.model.vo.SubMenuVo;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component("MenuPreparer")
public class MenuPreparer implements ViewPreparer {
    @Autowired
    private MenuMapper mapper;
    private List<BoardCategoryEntity> menuList;
    private List<BoardSubcategoryEntity> subMenuList;

    @Override
    public void execute(Request tilesContext, AttributeContext attributeContext) {

        if(menuList == null){
            menuList = mapper.selMenuCategoryList();
        }
        attributeContext.putAttribute(Const.MENU_LIST,
                new Attribute(mapper.selMenuCategoryList()), true);
        if(subMenuList == null){
            subMenuList = mapper.selSubMenuCategoryList();
        }
        attributeContext.putAttribute(Const.SUB_MENU_LIST,
                new Attribute(subMenuList), true);
    }
}
