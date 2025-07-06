package com.example.demo;

import com.megarata.AIDAH.AIDAHApp;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest(classes = AIDAHApp.class)
@TestPropertySource(locations = "classpath:application-test.properties")
class DemoApplicationTests {

	@Test
	void contextLoads() {
	}

}
