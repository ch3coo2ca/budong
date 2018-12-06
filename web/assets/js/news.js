		/* News 관련 ajax처리 JS */
		
		function test(page){
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
		 
		function test2(url){
			var param = url;
			   $.ajax({
		           url:'/budong-info/content.news',
		           data : "param=" + param,
		           dataType:'text',
		           success:function(data){
		        	   $("#test").html(data);
		           },error:function(){alert("Error");}
		       })
			}
	