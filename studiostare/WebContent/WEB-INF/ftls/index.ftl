<!doctype html><head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Studio Stare</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/lrtk.css">
<link href="video-js.css" rel="stylesheet" type="text/css">
<!-- ICONS -->
<link rel="icon" type="image/png" href="favicon.png" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<!-- MOBILE META -->
<meta name="viewport" content="width=device-width" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport"
content="width=device-width, initial-scale=0.8, maximum-scale=0.8, minimum-scale=0.8, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta itemprop="name" content="Studio Stare">
<meta itemprop="description" content="">
<!--[if lt IE 9]>
	<script src="js/libs/html5shiv.js"></script>
	<![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/slider.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript">
$(function(){
	$('#box').flexslider();
})
		$(window).bind("scroll",function(){$("#box").slideUp("slow");});
	</script>
</head>


<div id="box">
  <div class="flexslider"> 
    <ul class="slides">
			<li> 
				<img src='${(leading.picPath)!"img/temp/img04.jpg"}' /> 
				<div class="infos">
					<p>${(leading.title)!"You don’t have to love everyone"}</p>
				</div>
	        </li>
        </ul>
    <span class="arrow" onclick="function(){$('.flexslider').slideUp('slow');}"></span> </div>
  <div class="flexbox"><img src="img/logo_white.png"></div>
</div>
<header id="main_header">
  <div class="center">
    <nav id="main_nav">
      <ul>
        <li><a href="work.html" class="active">work</a>
          <div>/</div>
        </li>
        <li><a href="news.html">news</a>
          <div>/</div>
        </li>
        <li><a href="clients.html">clients</a>
          <div>/</div>
        </li>
        <li><a href="about.html">about</a>
          <div>/</div>
        </li>
      </ul>
    </nav>
    <a href="/en/home/" class="logo"> <img src="img/logo.png" alt=""> </a> <span class="clearfix"></span> </div>
</header>
<div id="body"> 
<#if videoList??>
	<#list videoList as video>
		<div id='videoplaybox-${(video.id)!""}' class="videoplaybigbox" style="display: none">
			<div class="videoplaybox">
				<#if (video.videoPathMp4) ?? && video.videoPathMp4 != "" && (video.videoPathWebm) ?? && video.videoPathWebm != "">
					<video id='video-${(video.id)!""}' class="video-js vjs-default-skin" controls="controls" preload="preload" poster='${(video.imgPath)!""}' data-setup="{}">
						<source src='${(video.videoPathMp4)!""}' type='video/mp4' />
						<source src='${(video.videoPathWebm)!""}' type='video/webm' />
						<source src='${(video.videoPathOgg)!""}' type='video/ogg' />
						<track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>
						Tracks need an ending tag thanks to IE9
						<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track>
						Tracks need an ending tag thanks to IE9
					</video>
				<#else>
					<img src='${(video.imgPath)!""}' style="width:100%;"/>
				</#if>
				<div class="sharebigbox">
					<div class="sharebox">
						<div class="shareicon" style="display: none;">
							<a href="javascript:(function(){window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent(location.href)),'_blank','width=450,height=400');})()">
								<img title="share to facebook" src="img/facebook.png" border="0" width="20" />
							</a>
							<a href="javascript:(function(){window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent(document.title)+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=450,height=400');})()">
								<img title="share to sina" src="img/sinaweibo.png" border="0" width="20" />
							</a>
							<a href="javascript:(function(){window.open('http://twitter.com/home/?status='.concat(encodeURIComponent(document.title)) .concat(' ') .concat(encodeURIComponent(location.href)),'_blank','width=450,height=400');})()">
								<img title="share to twitter" src="img/twitter.png" border="0" width="20" />
							</a> 
							<a href="javascript:(function(){window.open('http://www.linkedin.com/shareArticle?mini=true&title='+encodeURIComponent(document.title)+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=850,height=600');})()">
								<img title="share to linkedin" src="img/linkedin.png" border="0" width="20" />
							</a>
						</div>
						<div class="sharefont">
							<img src="img/share.png">
						</div>
					</div>
				</div>
			</div>
			<div class="videoplayinfos">
				<div class="infos_left">
					<h1>${(video.name)!""}</h1>
					<font> / </font>
					<!--
					<h2>${(video.category.name)!""}</h2>
					<font> / </font>
					-->
					<h2>${(video.client.name)!""}</h2>
				</div>
				<div class="infos_right">
					${(video.description)!""}
				</div>
			</div>
		</div>
	</#list>
	</#if>
	
	<#if videoList??>
	<#list videoList as video>
	<div class="videobigbox">
		<div class="videobox">
			<img src='${(video.imgPath)!""}'></img>
			<div class="sharebigbox">
				<div class="sharebtn">
					<img src="img/screen.png" onclick="playvideofull('${(video.id)!""}');">
				</div>
				<div class="sharebox">
					<div class="shareicon" style="display: none;">
						<a href="javascript:(function(){window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent(location.href)),'_blank','width=450,height=400');})()">
							<img title="share to facebook" src="img/facebook.png" border="0" width="20" />
						</a>
						<a href="javascript:(function(){window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent(document.title)+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=450,height=400');})()">
							<img title="share to sina" src="img/sinaweibo.png" border="0" width="20" />
						</a>
						<a href="javascript:(function(){window.open('http://twitter.com/home/?status='.concat(encodeURIComponent(document.title)) .concat(' ') .concat(encodeURIComponent(location.href)),'_blank','width=450,height=400');})()">
							<img title="share to twitter" src="img/twitter.png" border="0" width="20" />
						</a> 
						<a href="javascript:(function(){window.open('http://www.linkedin.com/shareArticle?mini=true&title='+encodeURIComponent(document.title)+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=850,height=600');})()">
							<img title="share to linkedin" src="img/linkedin.png" border="0" width="20" />
						</a>
					</div>
					<div class="sharefont">
						<img src="img/share.png" />
					</div>
				</div>
			</div>
			<div class="playbox">
				<div class="playbtn" style="display: none;">
					<img src="img/play-button.png" onclick="playvideo('${(video.id)!""}');">
				</div>
			</div>
		</div>
		<div class="infos">
			<p class="title">${(video.name)!""}</p>
			<p class="subtitle">
				<a href='client/videoOfClient/${(video.client.id)!""}' class="colorgreen">${(video.client.name)!""}</a>
		    	<font>/</font>
			    <a href='category/videoOfCategory/${(video.category.id)!""}' class="colorgray">${(video.category.name)!""}</a>
			</p>
		</div>
	</div>
	</#list>
	</#if>

  </div>
</footer>
<script src="js/libs/html5shiv.js"></script> 
<script src="js/video.js"></script> 
<script>videojs.options.flash.swf = "swf/video-js.swf";</script> 
<script>
		var m=10; //随机显示图片的总数量
		var n=Math.floor(Math.random()*m);
		var p = "";
		switch(n)
		{
		case 1:
		  p = "<div class='infos'><p>Come as you are</p></div>";
		  break;
		case 2:
		  p = "<div class='infos'><p>Listen</p></div>";
		  break;
		case 3:
		  p = "<div class='infos'><p>If you don’t like your job, <br> get a new one</p></div>";
		  break;
		case 4:
		  p = "<div class='infos'><p>You don’t have to love everyone</p></div>";
		  break;
		case 5:
		  p = "<div class='infos'><p>Don't be cynical</p></div>";
		  break;
		case 6:
		  p = "<div class='infos'><p>Love your project and it will <br> love you back</p></div>";
		  break;
		case 7:
		  p = "<div class='infos'><p>Good enough <br> is not good enough</p></div>";
		  break;
		case 8:
		  p = "<div class='infos'><p>Your thoughts HERE</p></div>";
		  break;
		case 9:
		  p = "<div class='infos'><p>Your thoughts HERE</p></div>";
		  break;
		case 0:
		  p = "<div class='infos'><p>Your thoughts HERE</p></div>";
		  break;
		default:
		  p = "";
		}
		var imgstr = "<img src='img/temp/img0" + n + ".jpg' />" + p;
		document.getElementById("randomimg").innerHTML = imgstr;
	</script> 
<script>
var warp_pro=document.getElementsByClassName("sharebox");
	   for (i=0;i<warp_pro.length;i++){
		   warp_pro[i].onmouseover=sharebox_action;
		   warp_pro[i].onmouseout=sharebox_move;
		   warp_pro[i].getElementsByClassName("shareicon")[0].style.cssText= "display:none; height:0px";
		 }
		function sharebox_action(){
			this.getElementsByClassName("shareicon")[0].style.display="block";
			$(this).find(".shareicon").stop(false,false).animate({height:115,opacity:1},800);
		}
		function sharebox_move(){
			$(this).find(".shareicon").stop(false,false).animate({height:0,opacity:0},800);
		}

		var videoboxs=document.getElementsByClassName("videobox");
		for (i=0;i<videoboxs.length;i++){
			videoboxs[i].onmouseover=videobuttons_action;
			videoboxs[i].onmouseout=videobuttons_move;
			videoboxs[i].getElementsByClassName("playbtn")[0].style.cssText="display:block; opacity:0";
		}
		function videobuttons_action(){
			$(this).find(".playbtn").stop(false,false).animate({opacity:1},300);
		}
		function videobuttons_move(){
			$(this).find(".playbtn").stop(false,false).animate({opacity:0},300);
		}
		
		function hideAndStopAll(){
			var videoboxes = document.getElementsByClassName("videoplaybigbox");
			for(i=0;i<videoboxes.length;i++){
				videoboxes[i].style.display="none";
				var videos = videoboxes[i].getElementsByTagName("video");
				for(j=0;j<videos.length;j++)
					videos[j].pause();	
			}
		}

		function jumpto(videoid){
			var id = "videoplaybox-" + videoid;
			var videobox = document.getElementById(id);
			// videobox.style.display="block";
			// 跳转到顶部
			var adoc = document.createElement("a");
			adoc.href = "#main_header";
			adoc.style.display="none";
			videobox.appendChild(adoc);
			adoc.click();
			// 滑出播放器
			$("#"+id).slideDown('slow');
			
			// $("html, body").animate({ scrollTop: 0 }, 'slow');
		}

		function playvideo(videoid){
			hideAndStopAll();
			jumpto(videoid);
			// var videobox = document.getElementById("videoplaybox-" + videoid);
			// videobox.style.display="block";
			// videobox.getElementsByTagName("video")[0].play();
			_V_("video-"+videoid).play();
			}
		
		function playvideofull(videoid){
			hideAndStopAll();
			jumpto(videoid);
			// var videobox = document.getElementById("videoplaybox-" + videoid);
			// videobox.style.display="block";
			// videobox.getElementsByTagName("video")[0].enterFullScreen();
			_V_("video-"+videoid).requestFullScreen();
			_V_("video-"+videoid).play();
			}

		function playvideo_old(src,title,subtitle){
			var videodoc = document.createElement("video");
			videodoc.className = "video-js vjs-default-skin";
			videodoc.id = "example_video_1";
			videodoc.poster = src + ".png";
			videodoc.controls = "controls";
			videodoc.autoplay = "autoplay";

			var srcdoc1 = document.createElement("source");
			srcdoc1.src = src + ".mp4";
			srcdoc1.type = 'video/mp4';
			videodoc.appendChild(srcdoc1);
			var srcdoc2 = document.createElement("source");
			srcdoc2.src = src + ".webm";
			srcdoc2.type='video/webm';
			videodoc.appendChild(srcdoc2);
			var srcdoc3 = document.createElement("source");
			srcdoc3.src = src + ".ogv";
			srcdoc3.type='video/ogg';
			videodoc.appendChild(srcdoc3);
			var trackdoc1 = document.createElement("track");
			trackdoc1.kind = "captions";
			trackdoc1.src = "demo.captions.vtt";
			trackdoc1.srclang="en";
			trackdoc1.label="English";
			videodoc.appendChild(trackdoc1);
			var trackdoc2 = document.createElement("track");
			trackdoc2.kind = "subtitles";
			trackdoc2.src = "demo.captions.vtt";
			trackdoc2.srclang="en";
			trackdoc2.label="English";
			videodoc.appendChild(trackdoc2);

			var videos = document.getElementsByClassName("videoplaybox")[0].getElementsByTagName("video");
			for(i = 0 ; i < videos.length; i++)
				document.getElementsByClassName("videoplaybox")[0].removeChild(videos[i]);
			document.getElementsByClassName("videoplaybox")[0].appendChild(videodoc);
			document.getElementsByClassName("videoplaybigbox")[0].style.display="block";

			var pdoc1 = document.createElement("p");
			pdoc1.class = "title";
			pdoc1.innerHTML= title;
			var pdoc2 = document.createElement("p");
			pdoc2.class = "subtitle";
			pdoc2.innerHTML = subtitle;
			//pdoc2.innerText=subtitle; 
			/* var infos = document.getElementsByClassName("videoplayinfos")[0].getElementsByTagName("p");
			for(j = 0 ; j < infos.length; j++)
				document.getElementsByClassName("videoplayinfos")[0].removeChild(infos[j]); */
			document.getElementsByClassName("videoplayinfos")[0].innerHTML = "";
			document.getElementsByClassName("videoplayinfos")[0].appendChild(pdoc1);
			document.getElementsByClassName("videoplayinfos")[0].appendChild(pdoc2);	
			}
		
       </script> 
<script type="text/javascript">
	bottom_size();
	window.onresize = function(){ window.clearTimeout(time); var time = window.setTimeout(bottom_size,50);}
	function bottom_size()
	{
		$(".imgbox").css({"width":"auto"});
		var c1width = $(".center .c1").width();
		var imgwidth = $(".imgbox").width();
		var word = (c1width - imgwidth)/2 - (imgwidth*0.04);
		$(".line_fl,.line_fr").css({"width":word+"px"});
		$(".imgbox").css({"width":imgwidth+"px"});
	}
	function scroll_top(){
		$("html, body").animate({ scrollTop: 0 }, 120);
	}
	window.setTimeout(function(){$(".videobox").css("height",$("#example_video_1").height()+"px");},1000);
$(".videobox").css("height",$("#example_video_1").height()+"px");
    </script>
</body></html>