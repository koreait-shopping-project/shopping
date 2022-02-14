package com.koreait.shopping.model.dto;

import com.koreait.shopping.user.model.UserEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto extends UserEntity {
    private String currentupw;
}
