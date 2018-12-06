<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css"
	integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css"
	integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT"
	crossorigin="anonymous">
<link href='<c:url value="/resources/css/chat.css" />' rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></script>
<script>
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			modal : true
		});

		$("#loginBtn").on("click", function(e) {
			e.preventDefault();
			$("#dialog").dialog("open");
		});
	});
</script>
</head>
<body>

	<div align="center">
		<%
			if (session.getAttribute("userId") != null) {
		%>
		<input type="button" value="로그아웃" onClick="location.href='logout.do'" />
		<c:set var="userId" value="${userId}" />
		<c:set var="userImg" value="${userImg}" />

		<!--로그인 팝업 모달  -->
		<div class="modal">this is a modal pop up</div>

		<!-- 채팅 컨테이너  -->
		<div class="floating-chat">
			<i class="fas fa-comments" aria-hidden="true"></i> <input
				type="hidden" name="roomName" value="">

			<!-- 방 목록 컨테이너  -->
			<div class="room-list" id="room-list">
				<div class="search">
					<input type="text" id="room-filter" placeholder="search" /> <i
						class="fa fa-search"></i>
				</div>
				<ul class="list" id="ul-list">
					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Vincent Porter</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_02.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Aiden Chavez</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_03.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Mike Thomas</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_04.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Erica Hughes</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_05.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Ginger Johnston</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_06.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Tracy Carpenter</div>
						</div></li>

					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_07.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Christian Kelly</div>
						</div></li>
				</ul>
			</div>

			
			<!--채팅 컨테이너  -->
			<div class="chat">
				<!-- 채팅 헤더  -->
				<div class="header">
					<span id="header-title" class="title"> <c:if
							test="null eq ${roomName}"> 전체 채팅방 </c:if> <c:if
							test="null != ${roomName}"> ${roomName} </c:if>
					</span>
					<button>
						<i class="fa fa-times" aria-hidden="true"></i>
					</button>
				</div>
				<!-- 채팅 내용  -->
				<ul class="chat-history">
				</ul>
				<!--메시지 전송 컨테이너-->
				<div class="footer clearfix">
					<div class="text-box" contenteditable="true" class="single-line"
						disabled="true"></div>
					<button id="sendMessage">send</button>
				</div>
			</div>
		</div>
		<%
			} else {
		%>
		<input type="button" value="로그인" id="loginBtn" />

		<!--로그인/회원가입 팝업 모달-->
		<div id="dialog">
			<c:import url="/loginHome.do" charEncoding="UTF-8" />
		</div>

		<%
			}
		%>
	</div>


	<script type="text/javascript">
		/*웹 소켓 연결   */
		var webSocket = new WebSocket('ws://localhost:8080/budong/chatting');
		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		//상대방에게서 메시지 받음 
		function onMessage(event) {
			console.log(event.data);

			//JSON 받아서 파싱 
			var msg = JSON.parse(event.data);
			var messagesContainer = $('.chat-history');

			if (msg.id != "${userId}") {
				messagesContainer
						.append([
								'<li> <div class="message-data"> <span class="message-data-name">',
								msg.id,
								'</span> <span class="message-data-time">',
								msg.date,
								'</span> </div> <div class="message other-message">',
								msg.text, '</div> </li>' ].join(''));
			}

			messagesContainer.finish().animate({
				scrollTop : messagesContainer.prop("scrollHeight")
			}, 250);

		}

		function onOpen(event) {
		}

		function onError(event) {
			alert(event);
		}

		//메시지 전송 
		function send() {
			var userInput = $('.text-box');
			var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig,
					'\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g,
					'<br>');

			if (!newMessage)
				return;

			var messagesContainer = $('.chat-history');

			//아이디, 프로필이미지, 채팅내용, 방이름, 보낸시간을 JSON에 넣음 			
			var d = new Date();
			var msg = {
				id : "${userId}",
				img : "${userImg}",
				text : newMessage,
				roomName : $("[name='roomName']").val(),
				date : d.toLocaleString()
			}

			messagesContainer
					.append([
							'<li class="clearfix"> <div class="message-data align-right"> <span class="message-data-time">',
							msg.date,
							'</span>  &nbsp; <span class="message-data-name">',
							msg.id,
							'</span> </div> <div class="message my-message float-right">',
							msg.text, '</div> </li>' ].join(''));

			// clean out old message
			userInput.html('');
			// focus on input
			userInput.focus();

			messagesContainer.finish().animate({
				scrollTop : messagesContainer.prop("scrollHeight")
			}, 250);

			webSocket.send(JSON.stringify(msg));
			userInput.value = "";
		}
	</script>

	<script>
		var element = $('.floating-chat');

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
			element.find('.room-list').addClass('room-list-enter');

			textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
			element.off('click', openElement);
			element.find('.header button').click(closeElement); //닫기버튼 
			element.find('#sendMessage').click(send); //전송버튼
			messages.scrollTop(messages.prop("scrollHeight"));
		}

		function closeElement() {
			element.find('.chat').removeClass('chat-enter').hide();
			element.find('.room-list').removeClass('room-list-enter').hide();
			element.find('>i').show();
			element.removeClass('expand');
			element.find('.header button').off('click', closeElement);
			element.find('#sendMessage').off('click', send);
			element.find('.text-box').off('keydown', onMetaAndEnter).prop(
					"disabled", true).blur();

			setTimeout(function() {
				element.find('.chat').removeClass('chat-enter').show()
				element.find('.room-list').removeClass('room-list-enter')
						.show()
				element.click(openElement);
			}, 500);
		}

		/*엔터키 전송 */
		function onMetaAndEnter(event) {
			if (event.keyCode == 13) {
				send();
			}
		}
	</script>

	<script>
		var room = $('.room-list li');
		room.click(enterRoom);

		/*방 들어가기 */
		function enterRoom() {
			var title = $('#header-title');
			$("[name='roomName']").val($(this).text().trim()); //전송할 방이름 설정   

			$.ajax({
				type : 'POST',
				data : $("[name='roomName']"),
				url : "moveChatRoom.do",
				success : function(data) {
					console.log(data);
					title.text(data);
					$('.chat-history').empty(); // 방 이동시 이전 대화기록 삭제 
				},
				error : function(data) {
					console.log("Server Error");
				}
			});
		}

		/*방 이름 검색 필터 */
		(function() {
			var searchFilter = {
				options : {
					valueNames : [ 'name' ]
				},

				init : function() {
					//room-list 아래에 'name'클래스명가진 요소들로 리스트 생성 
					var userList = new List('room-list', this.options);
					var noItems = $('<li id="no-items-found">No items found</li>');

					userList.on('updated', function(list) {
						if (list.matchingItems.length === 0) {
							$(list.list).append(noItems);
						} else {
							noItems.detach();
						}
					});
				}

			};

			searchFilter.init();
		})();
	</script>
</html>