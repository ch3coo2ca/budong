<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div id="test">
        <div class="services-container">
	        <div class="container">
	            <div class="row">
	            <div>
					<b><a href="#services-container" onclick="test((${date}-1))"> << </a> &nbsp;&nbsp;${date}&nbsp;&nbsp; <a href="#services-container" onclick="test((${date}+1))"> >></a></b>   
				</div>
	            	<c:forEach var="item" items="${list}">
						<div class="col-sm-4 services-box">
							<div class="services-box-icon">
								<img src="${item.img}" alt="">
							</div>
							<h3><a href="#" onclick="test2('${item.url}')">${item.title}</a></h3>
							<p>${item.content} <b>${item.writing}</b></p>
						</div>
					</c:forEach>
				</div>
	        </div>
        </div>
        </div>
	            
	            
	            
	            