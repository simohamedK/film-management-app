package com.example.groupe2.readflex.mappers;

import com.example.groupe2.readflex.models.dto.UserDto;
import com.example.groupe2.readflex.models.entities.User;

public class UserMapper {


    public static UserDto toUserDto(User user) {
        if(user != null) {
            return new UserDto(
                    user.getId(),
                    user.getUsername(),
                    user.getEmail(),
                    user.isAdmin()
            );
        }
        return null;
    }

    public static User toUser(UserDto userDto) {
        if(userDto != null) {
            User user = new User();
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setAdmin(userDto.isAdmin());
            return user;
        }
        return null;
    }
}
