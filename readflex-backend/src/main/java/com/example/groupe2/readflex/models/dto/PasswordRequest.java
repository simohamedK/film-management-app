package com.example.groupe2.readflex.models.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PasswordRequest {
    private String oldPassword;
    private String newPassword;
}
