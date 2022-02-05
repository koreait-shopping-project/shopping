package com.koreait.shopping.user;

import com.koreait.shopping.model.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserEntity selUser(UserEntity entity);
}
