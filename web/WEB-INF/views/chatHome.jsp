<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"
	rel="stylesheet" type='text/css'>
<link href='<c:url value="/resources/css/chat.css" />' rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function setChatImg() {
		document.head.innerHTML = document.head.innerHTML
				+ '<style> .messages li.other:before { right: -45px; background-image: url(/budong-info/resources/images/${userImg});} </style>'
	}
</script>
</head>
<body>

	<div>
		<input type="button" value="회원가입"
			onClick="location.href='memberJoin.do'" />
		<%
			if (session.getAttribute("userId") != null) {
		%>
		<input type="button" value="로그아웃" onClick="location.href='logout.do'" />
		<c:set var="userImg" value="${userImg}" /> 
		<script>
			setChatImg();
		</script>
		<%
			} else {
		%>
		<input type="button" value="로그인"
			onClick="location.href='loginHome.do'" />
		<%
			}
		%>
	</div>

	<div class="floating-chat">
		<i class="fa fa-comments" aria-hidden="true"></i>
		<div class="chat">
			<div class="header">
				<span class="title"> Budong Chat</span>
				<button>
					<i class="fa fa-times" aria-hidden="true"></i>
				</button>
			</div>
			<ul class="messages">

			</ul>
			<div class="footer">
				<div class="text-box" contenteditable="true" class="single-line"
					disabled="true"></div>
				<button id="sendMessage">send</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/* var textarea = document.getElementById("messageWindow"); */
		var webSocket = new WebSocket('ws://localhost:8080/chat/chatting');
		/* var inputMessage = document.getElementById('inputMessage'); */
		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			/* textarea.value += "상대 : " + event.data + "\n"; */

			/* 	var userInput = $('.text-box');
				var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig,
						'\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g,
						'<br>');

				if (!newMessage)
					return; */

			var messagesContainer = $('.messages');

			messagesContainer
					.append([ '<li class="self">', event.data, '</li>' ]
							.join(''));

			messagesContainer.finish().animate({
				scrollTop : messagesContainer.prop("scrollHeight")
			}, 250);
		}

		function onOpen(event) {
		}

		function onError(event) {
			alert(event.data);
		}

		function send() {
			var userInput = $('.text-box');
			var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig,
					'\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g,
					'<br>');

			if (!newMessage)
				return;

			var messagesContainer = $('.messages');

			messagesContainer.append([ '<li class="other">', newMessage,
					'</li>' ].join(''));

			// clean out old message
			userInput.html('');
			// focus on input
			userInput.focus();

			messagesContainer.finish().animate({
				scrollTop : messagesContainer.prop("scrollHeight")
			}, 250);

			/* textarea.value += "나 : " + inputMessage.value + "\n"; */
			webSocket.send(newMessage);
			userInput.value = "";
		}
	</script>

	<script>
		var element = $('.floating-chat');
		var myStorage = localStorage;

		if (!myStorage.getItem('chatID')) {
			myStorage.setItem('chatID', createUUID());
		}

		setTimeout(function() {
			element.addClass('enter');
		}, 1000);

		element.click(openElement);

		function openElement() {
			var messages = element.find('.messages');
			var textInput = element.find('.text-box');
			element.find('>i').hide();
			element.addClass('expand');
			element.find('.chat').addClass('chat-enter');
			/* 			element.find('.other').pseudostyle("before", "background-image", "${userImg}"); */
			/* var strLength = textInput.val().length * 2; */
			/* 			element.find('head').append('<style> .messages li.other:before { right: -45px; background-image: url(${userImg});} </style>');  */

			textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
			element.off('click', openElement);
			element.find('.header button').click(closeElement); //닫기버튼 
			element.find('#sendMessage').click(send); //전송버튼
			messages.scrollTop(messages.prop("scrollHeight"));
		}

		function closeElement() {
			element.find('.chat').removeClass('chat-enter').hide();
			element.find('>i').show();
			element.removeClass('expand');
			element.find('.header button').off('click', closeElement);
			element.find('#sendMessage').off('click', send);
			element.find('.text-box').off('keydown', onMetaAndEnter).prop(
					"disabled", true).blur();
			setTimeout(function() {
				element.find('.chat').removeClass('chat-enter').show()
				element.click(openElement);
			}, 500);
		}

		
		function sendNewMessage() {
			var userInput = $('.text-box');
			var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig,
					'\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g,
					'<br>');

			if (!newMessage)
				return;

			var messagesContainer = $('.messages');

			messagesContainer.append([ '<li class="other">', newMessage,
					'</li>' ].join(''));

			// clean out old message
			userInput.html('');
			// focus on input
			userInput.focus();

			messagesContainer.finish().animate({
				scrollTop : messagesContainer.prop("scrollHeight")
			}, 250);
		}

		function onMetaAndEnter(event) {
			if ((event.metaKey || event.ctrlKey) && event.keyCode == 13) {
				sendNewMessage();
			}
		}
	</script>
</html>