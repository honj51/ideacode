package com.miraclew.gs.test;

import java.io.IOException;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.msgpack.MessagePack;

import com.miraclew.gs.main.message.LoginMessage;

public class ServerTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws IOException {
		LoginMessage m = new LoginMessage();
		m.password = "123";
		m.uid = "abc";
		
		MessagePack msgpack = new MessagePack();
		// serialize
		byte[] bytes = msgpack.write(m);		
		LoginMessage m2 = msgpack.read(bytes, LoginMessage.class);
		Assert.assertEquals(m2.uid, m.uid);
	}

}
