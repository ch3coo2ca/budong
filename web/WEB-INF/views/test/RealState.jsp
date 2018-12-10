<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>테스트  정보</title>
</head>
<body>
	<div align="center">
	
		<form name="f" method="post" action="apt_dealInfo.do">
			
			지역  : <input type="hidden" name="lawd_cd" value="11110">
			
			
			<br/>
			기간  : <input type="month" name="deal_ymd">	</br>
			
			<input type="submit" value="ok">
			
		
		</form>
	
	</div>

</body>
</html>