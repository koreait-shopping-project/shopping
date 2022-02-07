package com.koreait.shopping.menu;

import com.koreait.shopping.Const;
import com.koreait.shopping.model.entity.BoardCategoryEntity;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component("MenuPreparer")
public class MenuPreparer implements ViewPreparer {
    @Autowired private MenuMapper mapper;
    private List<BoardCategoryEntity> menuList;

    @Override
    public void execute(Request tilesContext, AttributeContext attributeContext) {
        List<String> menu = new ArrayList<String>();
        menu.add("login");
        menu.add("join");

        if(menuList == null){
            menuList = mapper.selMenuCategoryList();
        }
        attributeContext.putAttribute(Const.MENU_LIST,
                new Attribute(mapper.selMenuCategoryList()), true);
    }
}
