package com.koreait.shopping.user;

import com.koreait.shopping.user.model.UserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    int insUser(UserEntity entity);
    UserEntity selUser(UserEntity entity);
    UserEntity selSocial(UserEntity entity);
}
