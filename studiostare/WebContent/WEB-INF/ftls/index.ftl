<!doctype html><head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Studio Stare | Film Production in Shanghai</title>
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
$(window).bind("scroll",function(){$("#box").slideUp("slow");var body=document.getElementById('body');body.style.display="block";});
$(document).ready(function() {
	var box=document.getElementById('box');
	h=window.innerHeight;
	box.style['height']=h+"px";
	
	String.format = function() {
	    var s = arguments[0];
	    for (var i = 0; i < arguments.length - 1; i++) {
		    var reg = new RegExp("\\{" + i + "\\}", "g");
		    s = s.replace(reg, arguments[i + 1]);
	    }
	    return s;
	}
	
//	var qi = 0;
//        var flag = true;
//	$(window).scroll(function(){
//		// 当滚动到最底部以上50像素时， 加载新内容
//		if ($(document).height() - $(this).scrollTop() - $(this).height()<50){
//                       if(!flag)
//                                return;
//                        flag = false;
//			qi += 1;
//			$.ajax({
//				type: "GET",
//				url: "/studiostare/video/" + qi,
//				contentType: 'application/json;',
//	        	mimeType: 'application/json;',
//	        	success: function(res) {
//		            if (res.result == "ok" && res.videos != null) {
//		            	buildVideos(res.videos);
//		   	        } else {
//		   	        	alert("No more video!");
//		   	        }
//flag = true;
//	      	    },
//	        	error:function(data,status,er) {
	        	//	alert("error: "+data+" status: "+status+" er:"+er);
//flag = true;
//	        	}
//			});
//		}
//	});
	
	function buildVideos(result){
		if(result.length==0)
			return;
			
		var videoTemplate = '<video id="video-{0}" name="{1}" class="video-js vjs-default-skin" controls="controls" preload="none" poster="{2}" data-setup="{}"><source src="{3}" type="video/mp4" /><source src="{4}" type="video/webm" /><source src="{5}" type="video/ogg" /><track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>Tracks need an ending tag thanks to IE9<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track>Tracks need an ending tag thanks to IE9</video>';
		var imgTemplate = '<img src="{0}" style="width:100%;"/>';
		var shareTemplate = '<div class="sharebigbox"><div class="sharebox"><div class="shareicon" style="display: none;"><a href="javascript:shareToFacebook({0})"><img title="share to facebook" src="img/facebook.png" border="0" width="20" /></a><a href="javascript:shareToWeibo({0})"><img title="share to sina" src="img/sinaweibo.png" border="0" width="20" /></a><a href="javascript:shareToTwitter({0})"><img title="share to twitter" src="img/twitter.png" border="0" width="20" /></a> <a href="javascript:shareToLinkedin({0})"><img title="share to linkedin" src="img/linkedin.png" border="0" width="20" /></a></div><div class="sharefont"><img src="img/share.png"></div></div></div>';
		for(var i=0;i<result.length;i++){
			var video = result[i];
			if(video == null)
				continue;
			var playdivdoc = document.createElement("div");
			playdivdoc.setAttribute("id","videoplaybox-" + video.id);
			playdivdoc.setAttribute("class","videoplaybigbox");
			playdivdoc.setAttribute("style","display: none");
			
			var playboxdoc = document.createElement("div");
			playboxdoc.setAttribute("class","videoplaybox");
			var videoFlag = false;
			if(video.videoPathMp4 != "" && video.videoPathWebm != ""){
				var videoHtml = String.format(videoTemplate, video.id, video.name, video.imgPath, video.videoPathMp4, video.videoPathWebm, video.videoPathOgg);
				playboxdoc.innerHTML += videoHtml;
				videoFlag = true;
			}else{
				var imgHtml = String.format(imgTemplate, video.imgPath);
				playboxdoc.innerHTML += videoHtml;
			}
			var shareHtml = String.format(shareTemplate, video.id);
			playboxdoc.innerHTML += shareHtml;
			playdivdoc.appendChild(playboxdoc);
			
			var infoboxdoc = document.createElement("div");
			infoboxdoc.setAttribute("class","videoplayinfos");
			var infoTemplate = '<div class="infos_left"><h1>{0}</h1><font> / </font><h2>{1}</h2></div><div class="infos_right">{2}</div>';
			var infoHtml = String.format(infoTemplate, video.name, video.client.name, video.description);
			infoboxdoc.innerHTML = infoHtml;
			playdivdoc.appendChild(infoboxdoc);
			$("#play").append(playdivdoc);
			if(videoFlag){
				videojs("video-" + video.id);
			}
			
			var showdivdoc = document.createElement("div");
			showdivdoc.setAttribute("class","videobigbox");
			var showvideoTemplate = '<div class="videobox"><img src="{0}"></img><div class="playbox"><div class="playbtn" style="display: none;"><img src="img/play-button.png" onclick="playvideo({1});"></div></div></div>';
			var showvideoHtml = String.format(showvideoTemplate,video.imgPath,video.id);
			showdivdoc.innerHTML += showvideoHtml;
			
			var showinfoTemplate = '<div class="infos"><p class="title">{0}</p><p class="subtitle"><a href="studiostare/client/{1}" class="colorgreen">{1}</a><font>/</font><a href="studiostare/category/{2}" class="colorgray">{2}</a></p></div>';
			var showinfoHtml = String.format(showinfoTemplate, video.name, video.client.name, video.category.name);
			showdivdoc.innerHTML += showinfoHtml;
			$("#body").append(showdivdoc);
		}
		var videoboxs=document.getElementsByClassName("videobox");
		for (i=0;i<videoboxs.length;i++){
			videoboxs[i].onmouseover=videobuttons_action;
			videoboxs[i].onmouseout=videobuttons_move;
			videoboxs[i].getElementsByClassName("playbtn")[0].style.cssText="display:block; opacity:0";
		}
		
		var videoplayboxs=document.getElementsByClassName("videoplaybox");
		for (i=0;i<videoplayboxs.length;i++){
			videoplayboxs[i].onmouseover=sharebuttons_action;
			videoplayboxs[i].onmouseout=sharebuttons_move;
			videoplayboxs[i].getElementsByClassName("sharebigbox")[0].style.cssText="display:block; opacity:0";
		}
		function sharebuttons_action(){
			$(this).find(".sharebigbox").stop(false,false).animate({opacity:1},300);
		}
		function sharebuttons_move(){
			$(this).find(".sharebigbox").stop(false,false).animate({opacity:0},300);
		}
		
                var warp_pro=document.getElementsByClassName("sharebox");
                for (i=0;i<warp_pro.length;i++){
                   warp_pro[i].onmouseover=sharebox_action;
                   warp_pro[i].onmouseout=sharebox_move;
                   warp_pro[i].getElementsByClassName("shareicon")[0].style.cssText= "display:none; height:0px";
                 }
	}
});
if((navigator.userAgent.match(/iPad/i))){ 
    document.write('<style>.video-js .vjs-tech{min-height:500px;}</style>'); 
}
if((navigator.userAgent.match(/iPhone/i))){ 
    document.write('<style>.video-js .vjs-tech{min-height:250px;}</style>'); 
}
</script>
<!--
<script>
window.onload=function(){
box=document.getElementById('box');
h=screen.availHeight;
box.style['height']=h+"px";
}
</script>
-->

</head>

<div id="box">
  <div class="flexslider"> 
    <ul class="slides">
			<li> 
				<img src='${(leading.picPath)!"img/temp/img04.jpg"}' /> 
				<div class="infos">
					<p>${(leadingText.title)!"You don't have to love everyone"}</p>
				</div>
	        </li>
        </ul>
    <span class="arrow" onclick="function(){$('.flexslider').slideUp('slow');}"></span> </div>
  <div class="flexbox01"><img src="img/logo_white.png"></div>
  <div class="flexbox"><img src="img/logo_green.png"></div>
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
    <a href="/work.html" class="logo"> <img src="img/logo.png" alt=""> </a> <span class="clearfix"></span> </div>
</header>

<div id="play">
<#if videoList??>
	<#list videoList as video>
		<div id='videoplaybox-${(video.id)!""}' class="videoplaybigbox" style="display: none">
			<div class="videoplaybox">
				<#if (video.videoPathMp4) ?? && video.videoPathMp4 != "" && (video.videoPathWebm) ?? && video.videoPathWebm != "">
					<video id='video-${(video.id)!""}' name='${(video.name)!""}' class="video-js vjs-default-skin" controls="controls" preload="none" poster='${(video.imgPath)!""}' data-setup="{}">
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
							<a href="javascript:shareToFacebook(${(video.id)!''})">
								<img title="share to facebook" src="img/facebook.png" border="0" width="20" />
							</a>
							<a href="javascript:shareToWeibo(${(video.id)!''})">
								<img title="share to sina" src="img/sinaweibo.png" border="0" width="20" />
							</a>
							<a href="javascript:shareToTwitter(${(video.id)!''})">
								<img title="share to twitter" src="img/twitter.png" border="0" width="20" />
							</a> 
							<a href="javascript:shareToLinkedin(${(video.id)!''})">
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
</div>
<div id="body" style="display: none"> 
	<#if videoList??>
	<#list videoList as video>
	<div class="videobigbox">
		<div class="videobox">
			<img src='${(video.imgPath)!""}'></img>
			<!--
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
			-->
			<div class="playbox">
				<div class="playbtn" style="display: none;">
					<img src="img/play-button.png" onclick="playvideo('${(video.id)!""}');">
				</div>
			</div>
		</div>
		<div class="infos">
			<p class="title">${(video.name)!""}</p>
			<p class="subtitle">
				<a href='studiostare/client/${(video.client.name)!""}' class="colorgreen">${(video.client.name)!""}</a>
		    	<font>/</font>
			    <a href='studiostare/category/${(video.category.name)!""}' class="colorgray">${(video.category.name)!""}</a>
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
			<div class="imgbox"><font class="font01">Studio Stare</font> <font class="font02">-</font> <font class="font03">film production in Shanghai since 2008</font></div>
			<div class="line_fr"></div>
	    </div>
	    <div class="footfont"> 
	    	<a class="colorgreen" href="http://map.baidu.com/?newmap=1&shareurl=1&l=19&tn=B_NORMAL_MAP&c=13520836,3642551&cc=sh&s=s%26da_src%3Dpcmappg.searchBox.button%26wd%3D%E8%A5%BF%E8%8B%8F%E5%B7%9E%E8%B7%AF71%E5%8F%B7%26c%3D289%26src%3D0%26wd2%3D%26sug%3D0%26l%3D19%26from%3Dwebmap&sc=0">
		    	<font class="demi">address&nbsp;</font>&nbsp;71 West Suzhou Road - room 401 Jing'an District - 200040 Shanghai - China<br>
	      	</a>
	      	<font class="demi">contact</font> <font class="book">phone</font> +86 (0)21 6276 0052 <font class="book">email</font> <a class="colorgreen01" href='mailto:contact@studiostare.com'> contact@studiostare.com </a> 
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
		
		var videoplayboxs=document.getElementsByClassName("videoplaybox");
		for (i=0;i<videoplayboxs.length;i++){
			videoplayboxs[i].onmouseover=sharebuttons_action;
			videoplayboxs[i].onmouseout=sharebuttons_move;
			videoplayboxs[i].getElementsByClassName("sharebigbox")[0].style.cssText="display:block; opacity:0";
		}
		function sharebuttons_action(){
			$(this).find(".sharebigbox").stop(false,false).animate({opacity:1},300);
		}
		function sharebuttons_move(){
			$(this).find(".sharebigbox").stop(false,false).animate({opacity:0},300);
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

		function shareToWeibo(videoid){
			var videoname = document.title + " : " + $("#video-" + videoid).find("video").attr("name");
			var urls = location.href.split("/");
			videourl = "http://" + urls[2] + $("#video-" + videoid).find("video").attr("src");
			window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent(videoname)+'&url='+encodeURIComponent(videourl)+'&source=bookmark','_blank','width=450,height=400');
		}
		function shareToFacebook(videoid){
			var videoname = document.title + " : " + $("#video-" + videoid).find("video").attr("name");
			var urls = location.href.split("/");
			videourl = "http://" + urls[2] + $("#video-" + videoid).find("video").attr("src");
			window.open('http://www.facebook.com/share.php?t='.concat(encodeURIComponent(videoname)).concat('&u=').concat(encodeURIComponent(videourl)),'_blank','width=450,height=400');
		}
		function shareToTwitter(videoid){
			var videoname = document.title + " : " + $("#video-" + videoid).find("video").attr("name");
			var urls = location.href.split("/");
			videourl = "http://" + urls[2] + $("#video-" + videoid).find("video").attr("src");
			window.open('http://twitter.com/home/?status='.concat(encodeURIComponent(videoname)) .concat(' ') .concat(encodeURIComponent(videourl)),'_blank','width=450,height=400');
		}
		function shareToLinkedin(videoid){
			var videoname = document.title + " : " + $("#video-" + videoid).find("video").attr("name");
			var urls = location.href.split("/");
			videourl = "http://" + urls[2] + $("#video-" + videoid).find("video").attr("src");
			window.open('http://www.linkedin.com/shareArticle?mini=true&title='+encodeURIComponent(videoname)+'&url='+encodeURIComponent(videourl)+'&source=bookmark','_blank','width=850,height=600');
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
