package com.budong.service;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.budong.controller.ChatController;

/**
 * 
 * @author wjddp 사용자 채팅
 */
@ServerEndpoint(value = "/chatting", configurator = GetHttpSessionForWebSocket.class)
public class WebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	private HttpSession httpSession;
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<Session, HttpSession> map = new HashMap<>();

	// 클라이언트 연결
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		logger.info("WebSocket 연결 확인  : " + session.getId());

		// 웹소켓 연결시 httpSesion값 가져온다.
		httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

		map.put(session, httpSession);
		clients.add(session);
	}

	// 메시지 전송
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		logger.info("\n WebSocket onMessage : " + message);
		logger.info(httpSession.getAttribute("userId") + "님의 현재방  : " + httpSession.getAttribute("roomName"));

		JSONObject jsonObject = new JSONObject(message);
		String roomName = jsonObject.getString("roomName"); // 현재 방이름

		synchronized (clients) {
			for (Session client : clients) {
				HttpSession hs = map.get(client);
				//같은방에 있는 사용자에게만 메시지를 전송 
				if ((!roomName.equals("")) && hs.getAttribute("roomName").equals(roomName)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	// 클라이언트와 연결 해제
	@OnClose
	public void onClose(Session session) {
		logger.info("WebSocket 연결 해제  : " + session.getId());
		clients.remove(session);
		map.remove(session);
	}

	@OnError
	public void onError(Session session, Throwable exception) throws Exception {
		logger.error("WebSocket onError : " + exception.toString());
		map.remove(session); 
		clients.remove(session);
	}

}