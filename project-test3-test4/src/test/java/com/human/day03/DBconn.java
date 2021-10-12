package com.human.day03;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBconn {
	@Test
	public void testConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
