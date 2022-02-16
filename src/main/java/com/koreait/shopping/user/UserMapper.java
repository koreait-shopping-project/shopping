package com.koreait.shopping.user;

import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    int insUser(UserEntity entity);
    UserEntity selUser(UserEntity entity);
    UserEntity selMdUser(UserDto dto);
    int updUser(UserEntity entity);
    UserEntity selSocial(UserEntity entity);

}
