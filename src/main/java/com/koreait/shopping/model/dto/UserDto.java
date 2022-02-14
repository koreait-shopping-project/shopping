package com.koreait.shopping.model.dto;

import com.koreait.shopping.model.entity.UserEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto extends UserEntity {
    private String currentupw;
}
