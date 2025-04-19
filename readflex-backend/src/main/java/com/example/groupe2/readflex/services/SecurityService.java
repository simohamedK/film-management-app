package com.example.groupe2.readflex.services;

import com.example.groupe2.readflex.configuration.SecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SecurityService {

    @Autowired
    SecurityConfig securityConfig;

    private final String  prefix = "X9_#";
    private final String  suffix = "&-0";

    public String HashPassword(String password) {

        PasswordEncoder encoder = securityConfig.passwordEncoder();
        password = prefix+ password + suffix;
        return encoder.encode(password);
    }

    public Boolean VerifyPassword(String password, String hashedPassword) {
        PasswordEncoder encoder = securityConfig.passwordEncoder();
        password = prefix+ password + suffix;
        return encoder.matches(password, hashedPassword);
    }

}
