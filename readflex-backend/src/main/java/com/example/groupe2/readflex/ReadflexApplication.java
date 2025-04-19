package com.example.groupe2.readflex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ReadflexApplication {


	public static void main(String[] args) {
		SpringApplication.run(ReadflexApplication.class, args);
	}

	/*public static void main(String[] args) {
		org.springframework.security.crypto.password.PasswordEncoder encoder
				= new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder();


		//String code= "simo";
		for (int i = 0; i < 5; i++) {
			String code= "simo";

			String passwd = encoder.encode(code);

			System.out.println(passwd); // print hash

			System.out.println(encoder.matches(code, passwd));
		}
	}*/
}
