package com.miraclew.gs.main.message;

import org.msgpack.annotation.Message;

@Message
public class LoginMessage {
	
	public String uid;
	public String password;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
	}
}
