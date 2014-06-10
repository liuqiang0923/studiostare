 <!doctype html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Studio Stare | Film Production in Shanghai</title>
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/libs/html5shiv.js"></script>
<script src="js/jquery.min.js"></script>
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
				<li><a href="work.html">work</a><div>/</div></li>
				<li><a href="news.html">news</a><div>/</div></li>
				<li><a href="clients.html">clients</a><div>/</div></li>
				<li><a href="about.html" class="active">about</a><div>/</div></li>
			</ul>
		</nav>
		<a href="/work.html" class="logo"> <img src="img/logo.png" alt="">
		</a> <span class="clearfix"></span>
	</div>
</header>
<div class="aboutbox">
  <div class="aboutbanner_box">
    <div class="aboutbanner">
    	<img src='${(about.officeImgPath)!"img/temp/about.jpg"}'>  
    </div>
    <div class="aboutbanner_font">
      <h1>
      	<font>ABOUT US</font>
      	${(about.aboutUsInfo)!"STUDI STARE HAS BEEN PRODUCING CREATIVE FILMS FOR CLIENTS IN SHANGHAI AND AROUD THE WORLD SINCE 2008.WE STRIVE TO VISUALIZE NARRATIVES AND INSPIRE CURIOSITY IN OUR AUDIENCES.WE LISTEN TO YOUR STORY,AND VE HELP TELL IT."}
      </h1>
    </div>
  </div>
  <div class="whobox">
    <dl>
      <dt>who we are</dt>
      <dd>
        <#if whoList??>
      	<#list whoList as who>
      		<div class="who_list">
	          <div class="who_imgbox"> 
		          <img src='${(who.photoPath)!"img/temp/Director.jpg"}'> 
		      </div>
		      <h2>${(who.name)!"petter eldin"}</h2>
		      <h3>${(who.position)!"Director"}</h3>
		      <h4><a class="colorgreen" href='mailto:${(who.email)!"petter@studiostare.com"}'>${(who.email)!"petter@studiostare.com"}</a></h4>
	        </div>      		
      	</#list>
      	</#if>
      </dd>
    </dl>
  </div>
  <div class="manifesto">
    <dl>
      <dt>MANIFESTO</dt>
      <dd>
      	${(about.manifesto)!"<font color='#000'>PLEASE EXPLORE</font> or you will never evolve into a better you <font color='#000'>/ IF YOU DON'T LIKE YOUR JOB, GET A NEW ONE</font> not everyone has a choice, but you probably do <font color='#000'>/ LOVE YOUR PROJECT AND IT WILL LOVE YOU BACK</font> and at the end of the day you will create something good <font color='#000'>/ MAKE FRIENDS IMPORTANT</font> instead of making important friends <font color='#000'>/ YOU DON'T HAVE TO LOVE EVERYONE</font> but you should try <font color='#000'>/ DON'T BE CYNICAL</font> it's a waste of everyone's time <font color='#000'>/ COME AS YOU ARE</font> because that's the way we like you <font color='#000'>/ LISTEN</font> or you might miss the point <font color='#000'>/ GOOD ENOUGH</font> IS NOT GOOD ENOUGH in fact it's boring and boring is not good - it's bad <font color='#000'>/ YOUR THOUGHTS HERE</font> because you have something to say and you should share it. "}
      </dd>
    </dl>
  </div>
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
		    	<font class="demi">address&nbsp;</font>71 West Suzhou Road - room 401 Jing'an District - 200040 Shanghai - China<br>
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
<div class="scroll_top"><a href="index.html" class="homebtn"></a></div>
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
</script>
</body>
</html>