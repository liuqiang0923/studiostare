<!doctype html>
<head>
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
<meta name="viewport" content="width=device-width, initial-scale=0.8, maximum-scale=0.8, minimum-scale=0.8, user-scalable=no">
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
	$('.flexslider').flexslider();
})
		$(window).bind("scroll",function(){$(".flexslider").slideUp("slow");});
	</script>

</head>
<header id="main_header">
	<div class="center">
		<nav id="main_nav">
			<ul>
				<li><a href="work.html" class="active">work</a><font>&nbsp;/&nbsp;</font></li>
				<li><a href="news.html">news</a><font>&nbsp;/&nbsp;</font></li>
				<li><a href="clients.html">clients</a><font>&nbsp;/&nbsp;</font></li>
				<li><a href="about.html">about</a><font>&nbsp;/&nbsp;</font></li>
			</ul>
		</nav>
		<a href="/en/home/" class="logo"> <img src="img/logo.png" alt="">
		</a> <span class="clearfix"></span>
	</div>
</header>
<div id="body">
	<!-- videobox-->
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
<footer>
	<div class="center">
		<div class="c1">
			<div class="line_fl"></div>
			<div class="imgbox">
				<font class="font01">Studio Stare</font> <font class="font02">—</font>
				<font class="font03">film production in Shanghai since 2008</font>
			</div>
			<div class="line_fr"></div>
		</div>
			<div class="footfont"> <a style="color:#000000" href="http://map.baidu.com/?newmap=1&shareurl=1&l=19&tn=B_NORMAL_MAP&c=13520836,3642551&cc=sh&s=s%26da_src%3Dpcmappg.searchBox.button%26wd%3D%E8%A5%BF%E8%8B%8F%E5%B7%9E%E8%B7%AF71%E5%8F%B7%26c%3D289%26src%3D0%26wd2%3D%26sug%3D0%26l%3D19%26from%3Dwebmap&sc=0"><font class="demi">address&nbsp;</font>&nbsp;71 West Suzhou Road - room 401
      Jing’an District - 200040 Shanghai - China<br></a> 
			<font
				class="demi">contact</font> <font class="book">phone</font> +86 (0)
			21 6276 0052 <font class="book">email</font> <a href='mailto:contact@studiostare.com'> contact@studiostare.com </a>
		</div>
		<div class="fllowus">
			<h1>follow us</h1>
			<div class="fllowuslink">
				<a target="_blank" href="https://www.facebook.com/studiostare">
			    	<img src="img/facebook.jpg">
			    </a>
			    <a target="_blank" href="https://vimeo.com/studiostare">
			    	<img src="img/vimeo.jpg">
			    </a>
			    <a target="_blank" href="https://twitter.com/StudioStare">
			    	<img src="img/twitter.jpg">
			    </a>
			    <a target="_blank" href="http://www.linkedin.com/company/2551588">
			    	<img src="img/linkedin.jpg">
			    </a>
			</div>
		</div>
	</div>
</footer>
<script src="js/libs/html5shiv.js"></script>
<script src="js/video.js"></script>
<script>videojs.options.flash.swf = "swf/video-js.swf";</script>
<script>
var warp_pro=document.getElementsByClassName("sharebox");
	   for (i=0;i<warp_pro.length;i++){
		   warp_pro[i].onmouseover=sharebox_action;
		   warp_pro[i].onmouseout=sharebox_move;
		   warp_pro[i].getElementsByClassName("shareicon")[0].style.display="none";
		 }
		function sharebox_action(){
			this.getElementsByClassName("shareicon")[0].style.display="block";
		}
		function sharebox_move(){
			this.getElementsByClassName("shareicon")[0].style.display="none";
		}

		var videoboxs=document.getElementsByClassName("videobox");
		for (i=0;i<videoboxs.length;i++){
			videoboxs[i].onmouseover=videobuttons_action;
			videoboxs[i].onmouseout=videobuttons_move;
			videoboxs[i].getElementsByClassName("playbtn")[0].style.display="none";
		}
		function videobuttons_action(){
			this.getElementsByClassName("playbtn")[0].style.display="block";
		}
		function videobuttons_move(){
			this.getElementsByClassName("playbtn")[0].style.display="none";
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
</body>
</html>