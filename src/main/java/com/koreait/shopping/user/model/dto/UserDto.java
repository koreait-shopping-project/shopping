package com.koreait.shopping.user.model.dto;

import com.koreait.shopping.user.model.entity.UserEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto extends UserEntity {
    private String currentupw;
}
