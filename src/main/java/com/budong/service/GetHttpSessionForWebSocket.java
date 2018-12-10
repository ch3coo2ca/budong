package com.budong.service;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

/**
 * 
 * @author wjddp 
 * 웹 소켓에서 HttpSession 값 가져오기 위한 클래스 
 *
 */
public class GetHttpSessionForWebSocket extends ServerEndpointConfig.Configurator {
	@Override
	public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
		HttpSession httpSession = (HttpSession) request.getHttpSession();
		config.getUserProperties().put(HttpSession.class.getName(), httpSession);
	}

}
