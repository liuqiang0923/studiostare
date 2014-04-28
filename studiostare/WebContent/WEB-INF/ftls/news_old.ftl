<!doctype html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Studio Stare</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/libs/html5shiv.js"></script>
<script src="js/jquery.min.js"></script>
<!-- video -->
<link href="video-js.css" rel="stylesheet" type="text/css">
<script src="js/video.js"></script>
<script>videojs.options.flash.swf = "swf/video-js.swf";</script>
<!--[if lt IE 9]>
<script src="../html5.js"></script>
<![endif]-->
<script src="js/blocksit.min.js"></script>
<script src="js/blockanimate.js"></script>
<!-- ICONS -->
<link rel="icon" type="image/png" href="favicon.png" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<!-- MOBILE META -->
<meta name="viewport" content="width=device-width, initial-scale=0.8, maximum-scale=0.8, minimum-scale=0.8, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta itemprop="name" content="Studio Stare" >
<meta itemprop="description" content="">
<!--[if lt IE 9]>
	<script src="js/libs/html5shiv.js"></script>
	<![endif]-->
</head>
<body data-tpl="home">
<header id="main_header">
  <div class="center">
    <nav id="main_nav">
      <ul>
         <li><a href="work.html">work</a><font>&nbsp;/&nbsp;</font></li>
        <li><a href="news.html" class="active">news</a><font>&nbsp;/&nbsp;</font></li>
        <li><a href="clients.html">clients</a><font>&nbsp;/&nbsp;</font></li>
        <li><a href="about.html">about</a><font>&nbsp;/&nbsp;</font></li>
      </ul>
    </nav>
    <a href="/en/home/" class="logo"> <img src="img/logo.png" alt=""> </a> <span class="clearfix"></span> </div>
</header>
<!-- news start-->
<section id="wrapper">
  <div id="container">
  
  <#if newsList??>
  	<#list newsList as news>
  		<div class="grid">
  			<#if (news.videoPathMp4)?? && (news.videoPathWebm)?? && (news.videoPathOgg)?? && news.videoPathMp4 != "" && (news.videoPathWebm)?? && (news.videoPathOgg)?? >
  			<div class="imgholder">
		        <div class="videobox">
		          <video id="example_video_${(news.id)!""}" class="video-js vjs-default-skin" controls="controls" preload="preload" poster="${(news.photoPath)!""}" data-setup="{}">
		          <!--
		          <video controls="controls" preload="preload" poster="${(news.photoPath)!""}">
		          -->
		          	<source src="${(news.videoPathMp4)!""}" type='video/mp4' />
		            <source src="${(news.videoPathWebm)!""}" type='video/webm' />
		            <source src="${(news.videoPathOgg)!""}" type='video/ogg' />
		            <!--
		            <video controls="controls" preload="none" poster="http://video-js.zencoder.com/oceans-clip.png">
		            <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
            <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
            <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />
            -->
		            <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>
		            <!-- Tracks need an ending tag thanks to IE9 -->
		            <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track>
		            <!-- Tracks need an ending tag thanks to IE9 --> 
		          </video>
		        </div>
		     </div>
	      <#elseif (news.photoPath)?? && news.photoPath != "">
	      	<div class="imgholder"> 
	      		<img src="${(news.photoPath)!""}" /> 
	      	</div>
	      </#if>
	      <#if (news.twitterId)?? && (news.twitterId) != 0>
	      	<div class="imgholder">
		      <img src="img/twitter.jpg" class="twitter">
		      <div class="date01">${(news.updateTime)?string("dd MMMM yyyy")}</div>
		    </div>
	      <#else>
	      	<div class="date01">${(news.updateTime)?string("dd MMMM yyyy")}</div>
	      </#if>
	      <div class="title">${(news.title)!""}<font class="medi">&gt;</font></div>
	      <#if (news.twitterId)?? && (news.twitterId) != 0>
	      	<p class="news_twitter">${(news.content)!""}</p>
	      <#else>
	      	<p>${(news.content)!""}</p>
	      </#if>
	      <div class="meta"></div>
	    </div>
  	</#list>
  </#if>
  
  </div>
</section>
<!-- news end-->
<footer>
  <div class="center">
    <div class="c1">
      <div class="line_fl"></div>
      <div class="imgbox"><font class="font01">Studio Stare</font> <font class="font02">—</font> <font class="font03">film production in Shanghai since 2008</font></div>
      <div class="line_fr"></div>
    </div>
    <div class="footfont"> <a style="color:#000000" href="http://map.baidu.com/?newmap=1&shareurl=1&l=19&tn=B_NORMAL_MAP&c=13520836,3642551&cc=sh&s=s%26da_src%3Dpcmappg.searchBox.button%26wd%3D%E8%A5%BF%E8%8B%8F%E5%B7%9E%E8%B7%AF71%E5%8F%B7%26c%3D289%26src%3D0%26wd2%3D%26sug%3D0%26l%3D19%26from%3Dwebmap&sc=0"><font class="demi">address&nbsp;</font>&nbsp;71 West Suzhou Road - room 401
      Jing’an District - 200040 Shanghai - China<br></a>
      <font
					class="demi">contact</font> <font class="book">phone</font> +86 (0)
      21 6276 0052 <font class="book">email</font> <a href='mailto:contact@studiostare.com'> contact@studiostare.com </a> </div>
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
<div class="scroll_top"><a href="index.html" class="homebtn"></a><a onclick="scroll_top()"></a></div>
</div>
<script type="text/javascript">
	function scroll_top(){
		$("html, body").animate({ scrollTop: 0 }, 120);
	}
</script>
</body>
</html>