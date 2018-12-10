		/* News 관련 ajax처리 JS */

		/* 오늘 날짜 가져오는 JS */
		function getToday(){
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			if(dd<10) {
			    dd='0'+dd;
			} 
			if(mm<10) {
			    mm='0'+mm;
			}
			var yyyy = today.getFullYear();
			today = ''+yyyy + mm + dd;
			return today;
		}
		
		function getTitle(page){
		var param = page;
			$.ajax({
		    url:'/budong-info/title.news',
		    data : "param=" + param,
		    dataType:'text',
		    success:function(data){
		 	   $("#test").html(data);
		    },error:function(){alert("Error");}
		})
		}
		 
		function getContent(url, pos){
			var param = url;
			var position = pos;
			   $.ajax({
		           url:'/budong-info/content.news',
		           data : "param=" + param+"&pos="+pos,
		           dataType:'text',
		           success:function(data){
		        	   $("#test").html(data);
		           },error:function(){alert("Error");}
		       })
			}
	