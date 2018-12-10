<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside id="test">
 <div class="services-container">
<b><a href="#services-container" onclick="getTitle('${param.pos}')"> << </a> </b>
${newsbody}
</div>
</aside>
<%-- <div id="test">
        <div class="services-container">
	        <div class="container">
	            <div class="row">
	            <div>
					<b><a href="#services-container" onclick="getTitle('${param.pos}')"> << </a> </b>   
				</div>
						<div class="col-sm-4 services-box">
							<div class="services-box-icon">
								<img src="${item.img}" alt="">
							</div>
							<h3><a href="#" onclick="test2('${item.url}')">${item.title}</a></h3>
							<p>${newsbody}</p>
						</div>
				</div>
	        </div>
        </div>
        </div> --%>