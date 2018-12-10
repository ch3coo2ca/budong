<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아파트  시세  정보  @@@</title>
</head>
<body>
	<div align="center">
		도시코드  : ${lawd_cd}
		검색  년월 : ${deal_ymd}
	
		<table border="1">
			<tr>
				<th>No</th>
				<th>건축년도</th>
				<th>년</th>
				<th>법정동</th>
				<th>아파트</th>
				<th>월</th>
				<th>일</th>
				<th>전용면적</th>
				<th>지역코드</th>
				<th>층</th>
				<th>거래금액</th>
			</tr>
		<c:forEach var="item" items="${list}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${item.build_year }</td>
				<td>${item.year }</td>
				<td>${item.legal_dong }</td>
				<td>${item.apartment }</td>
				<td>${item.month }</td>
				<td>${item.day }</td>
				<td>${item.exclusive_area }</td>
				<td>${item.area_code }</td>
				<td>${item.layer }</td>
				<td>${item.transaction_amount }</td>
			</tr>
		</c:forEach>
		</table>
	
	<br>
	
	</div>


</body>
</html>