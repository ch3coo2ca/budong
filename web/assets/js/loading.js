/**
 * Loding bar javascript
 */

$(document).ready(function(){
   $('.loading-bro').hide(); //첫 시작시 로딩바를 숨겨준다.
})
.ajaxStart(function(){
	$('.loading-bro').show(); //ajax실행시 로딩바를 보여준다.
})
.ajaxStop(function(){
	$('.loading-bro').hide(); //ajax종료시 로딩바를 숨겨준다.
});