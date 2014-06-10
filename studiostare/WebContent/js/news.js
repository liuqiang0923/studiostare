$(document).ready(function() {
	
	String.format = function() {
	    var s = arguments[0];
	    for (var i = 0; i < arguments.length - 1; i++) {
		    var reg = new RegExp("\\{" + i + "\\}", "g");
		    s = s.replace(reg, arguments[i + 1]);
	    }
	    return s;
	}
	
	//vendor script
	$('#header')
	.css({ 'top':-50 })
	.delay(1000)
	.animate({'top': 0}, 800);
	
	$('#footer')
	.css({ 'bottom':-15 })
	.delay(1000)
	.animate({'bottom': 0}, 800);
	
	//blocksit define
	$(window).load( function() {
		var winWidth = $(window).width();
		if(winWidth < 660) {
			col = 1;
		} else if(winWidth < 880) {
			col = 2;
		} else if(winWidth < 1490) {
			col = 3;
		} else {
			col = 3;
		}
		$('#container').BlocksIt({
			numOfCol: col,
			offsetX: 8,
			offsetY: 8
		});
	});
	
	var qi = 0;
	var flag = true;
	$(window).scroll(function(){
		// 当滚动到最底部以上50像素时， 加载新内容
		if ($(document).height() - $(this).scrollTop() - $(this).height()<50){
			if(!flag)
				return;
			flag = false;
			qi += 1;
			$.ajax({
				type: "GET",
				url: "/studiostare/news/" + qi,
				contentType: 'application/json;',
	        	mimeType: 'application/json;',
	        	success: function(res) {
		            if (res.result == "ok" && res.news != null) {
		            	buildNews(res.news);
		   	        } else {
//		   	        	alert("No more news!");
		   	        }
		            flag = true;
	      	    },
	        	error:function(data,status,er) {
	        		alert("error: "+data+" status: "+status+" er:"+er);
	        		flag = true;
	        	}
			});
		}
	});
	
	//window resize
	var currentWidth = 1490;
	$(window).resize(function() {
		var winWidth = $(window).width();
		var conWidth;
		if(winWidth < 660) {
			conWidth = 440;
			col = 1;
		} else if(winWidth < 880) {
			conWidth = 660;
			col = 2;
		} else if(winWidth < 1490) {
			conWidth = 880;
			col = 3;
		} else {
			conWidth = 1490;
			col = 3;
		}
		
		if(conWidth != currentWidth) {
			currentWidth = conWidth;
			$('#container').width(conWidth);
			$('#container').BlocksIt({
				numOfCol: col,
				offsetX: 8,
				offsetY: 8
			});
		}
	});
	
	function buildNews(result){
		var videoTemplate = '<div class="imgholder" style="height:200px;"><div class="videoplaybox"><video id="video-{0}" class="video-js vjs-default-skin" controls="controls" preload="none" poster="{1}" data-setup="{}"><source src="{2}" type="video/mp4" /><source src="{3}" type="video/webm" /><source src="{4}" type="video/ogg" /><track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track></video></div></div>';
		var imgTemplate = '<div class="imgholder"> <img src="{0}" /> </div>';
		var ttimeTemplate = '<div class="imgholder01"><img src="img/twitter.jpg" class="twitter"><div class="date01">{0}</div></div>';
		var nottimeTemplate = '<div class="date">{0}</div>';
		var titleTemplate = '<div class="title">{0}<font class="medi"> &gt;</font></div>';
		var tcontentTemplate = '<p class="news_twitter">{0}</p>';
		var notcontentTemplate = '<p>{0}</p>';
		if(result.length==0)
			return;
		for(var i=0;i<result.length;i++){
			var news = result[i];
			if(news == null)
				continue;
			var divdoc = document.createElement("div");
			divdoc.setAttribute("class","grid");
			var vflag = false;
			if(news.videoPathMp4 != "" && news.videoPathWebm != ""){
				var videoHtml = String.format(videoTemplate, news.id, news.photoPath, news.videoPathMp4, news.videoPathWebm, news.videoPathOgg);
				divdoc.innerHTML += videoHtml;
				vflag = true;
			}
			else{
				var imgHtml = String.format(imgTemplate, news.photoPath);
				divdoc.innerHTML += imgHtml;
			}
			if(news.twitterId != "" && news.twitterId != 0){
				var ttimeHtml = String.format(ttimeTemplate, news.dateStr);
				divdoc.innerHTML += ttimeHtml;
			}
			else{
				var nottimeHtml = String.format(nottimeTemplate, news.dateStr);
				divdoc.innerHTML += nottimeHtml;
			}
			var titleHtml = String.format(titleTemplate, news.title);
			divdoc.innerHTML += titleHtml;
			if(news.twitterId != "" && news.twitterId != 0){
				var tcontendHtml = String.format(tcontentTemplate, news.content);
				divdoc.innerHTML += tcontendHtml;
			}
			else{
				var notcontendHtml = String.format(notcontentTemplate, news.content);
				divdoc.innerHTML += notcontendHtml;
			}
			var docmeta = document.createElement("div");
			docmeta.class="meta"; 
			divdoc.appendChild(docmeta);
			$("#container").append(divdoc);
			if(vflag){
				videojs("video-" + news.id);
				$(".vjs-fullscreen-control").click(function(){
					$(this).parents(".videoplaybox").css("font-size","22px");
					var index = $(".vjs-fullscreen-control").index(this);
					window.clearInterval(checksize);
					checksize =window.setInterval(function(){changesize(index)},300);
				})
			}
		}
		var winWidth = $(window).width();
		if(winWidth < 660) {
			col = 1;
		} else if(winWidth < 880) {
			col = 2;
		} else if(winWidth < 1490) {
			col = 3;
		} else {
			col = 3;
		}
		$('#container').BlocksIt({
			numOfCol: col,
			offsetX: 8,
			offsetY: 8
		});
	}
});