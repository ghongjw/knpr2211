package com.reservation.knpr2211;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude =SecurityAutoConfiguration.class)
public class Knpr2211Application {

	public static void main(String[] args) {
		SpringApplication.run(Knpr2211Application.class, args);
	}

}
