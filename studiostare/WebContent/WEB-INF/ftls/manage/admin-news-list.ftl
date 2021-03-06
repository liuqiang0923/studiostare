<html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Studio Stare | News Manage</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/manage-resource/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/manage-resource/assets/plugins/select2/select2.css" />
<link rel="stylesheet" type="text/css" href="/manage-resource/assets/plugins/select2/select2-metronic.css" />
<link rel="stylesheet" href="/manage-resource/assets/plugins/data-tables/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/manage-resource/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="/manage-resource/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="/manage-resource/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner">
		<!-- BEGIN LOGO -->
		<a class="navbar-brand" href="/index.html">
			<img style="height:22px" src="/manage-resource/favicon.png" alt="logo" class="img-responsive"/>
		</a>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="/manage-resource/assets/img/menu-toggler.png" alt=""/>
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu" data-auto-scroll="true"
					data-slide-speed="200">
					<li class="sidebar-toggler-wrapper">
						<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
						<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					</li>
					<li class="last ">
						<a href="/manage/admin-video-list.html" >
							<i class="fa fa-puzzle-piece"></i>
							<span class="title">
								Video
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/manage/admin-client-list.html"> 
							<i class="fa fa-user"></i> 
							<span class="title"> 
								Client 
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/manage/admin-category-list.html"> 
							<i class="fa fa-sitemap"></i> 
							<span class="title"> 
								Category 
							</span>
						</a>
					</li>
					<li class="last ">
						<a style="background:#000000;" href="/manage/admin-news-list.html" >
							<i class="fa fa-file-text"></i>
							<span class="title">
								News
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/manage/admin-about.html" >
							<i class="fa fa-bookmark-o"></i>
							<span class="title">
								About
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/manage/admin-leading-list.html" >
							<i class="fa fa-th"></i>
							<span class="title">
								Leading page
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/manage/admin-admin.html" >
							<i class="fa fa-gift"></i>
							<span class="title">
								Admin
							</span>
						</a>
					</li>
				</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn blue">Save changes</button>
							<button type="button" class="btn default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					News
					</h3>
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			
			<h4 class="form-section">News manage</h4>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box light-grey">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>News List
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="btn-group">
									<button id="managetable_news_new" class="btn green" onclick="location='admin-news-edit.html'">
									Add New <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<table class="table table-striped table-bordered table-hover" id="managetable_news">
							<thead>
							<tr>
								<th class="table-checkbox">
									<input type="checkbox" class="group-checkable" data-set="#managetable_news .checkboxes"/>
								</th>
								<th>
									 Title
								</th>
								<th>
									 Content
								</th>
								<th>
									 Photo
								</th>
								<th>
									 Mp4
								</th>
								<th>
									 Webm
								</th>
								<th>
									 Ogg
								</th>
								<th>
									 Created
								</th>
								<th>
									 Edit
								</th>
								<th> 
									 Delete
								</th>
							</tr>
							</thead>
							<tbody>
							<#if newslist??>
							<#list newslist as news>
							<tr class="odd gradeX">
								<td>
									<input name="newsId" type="checkbox" class="checkboxes" value=${(news.id)!0} />
								</td>
								<td>${(news.title)!""}</td>
								<td>
								<#if news.content?length gt 20>
									${(news.content[0..20])}...
								</#if>
								<#if news.content?length lte 20>
									${(news.content)!""}
								</#if>
								</td>
								<td><a href="down?view=1&url=${(news.photoPath)!""}">${(news.photoName)!""}</a></td>
								<td><a href="down?url=${(news.videoPathMp4)!""}">${(news.videoNameMp4)!""}</a></td>
								<td><a href="down?url=${(news.videoPathWebm)!""}">${(news.videoNameWebm)!""}</a></td>
								<td><a href="down?url=${(news.videoPathOgg)!""}">${(news.videoNameOgg)!""}</a></td>
								<td>${(news.updateTime)?string('yyyy-MM-dd')}</td>
								<td><a class="edit" href="javascript:;"> Edit </a></td>
								<td><a class="delete" href="javascript:;"> Delete </a></td>
							</tr>
							</#list>
							</#if>
							</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			
			<h4 class="form-section">Twitter account manage</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box light-grey">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i>Twitter account List
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-toolbar">
									<div class="btn-group">
										<button id="managetable_twitter_new" class="btn green"> Add New <i class="fa fa-plus"></i></button>
									</div>
								</div>
								<table class="table table-striped table-bordered table-hover" id="managetable_twitter">
									<thead>
										<tr>
											<th class="table-checkbox">
												<input type="checkbox" class="group-checkable" data-set="#managetable_twitter .checkboxes"/>
											</th>
											<th>
												 Name
											</th>
											<th>
												 Twitter
											</th>
											<th>
												 Description
											</th>
											<th>
												 Edit
											</th>
											<th> 
												 Delete
											</th>
										</tr>
									</thead>
									<tbody>
										<#if userList??>
										<#list userList as user>
										<tr class="odd gradeX">
											<td>
												<input name="clientId" type="checkbox" class="checkboxes" value=${(user.id)!""} />
											</td>
											<td>${(user.name)!""}</td>
											<td>${(user.twitterUser)!""}</td>
											<td>${(user.description)!""}</td>
											<td><a class="edit" href="javascript:;"> Edit </a></td>
											<td><a class="delete" href="javascript:;"> Delete </a></td>
										</tr>
										</#list>
										</#if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="footer-inner">
		 2014 &copy; Studio Stare
	</div>
	<div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
<!-- END FOOTER -->
<script src="/manage-resource/assets/plugins/jquery-1.10.2.min.js" ></script>
<script src="/manage-resource/assets/plugins/jquery-migrate-1.2.1.min.js" ></script>
<script src="/manage-resource/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
<script src="/manage-resource/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" ></script>
<script src="/manage-resource/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" ></script>
<script src="/manage-resource/assets/plugins/jquery.blockui.min.js" ></script>
<script src="/manage-resource/assets/plugins/jquery.cokie.min.js" ></script>
<script src="/manage-resource/assets/plugins/uniform/jquery.uniform.min.js" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/manage-resource/assets/plugins/select2/select2.min.js" ></script>
<script type="text/javascript" src="/manage-resource/assets/plugins/data-tables/jquery.dataTables.js" ></script>
<script type="text/javascript" src="/manage-resource/assets/plugins/data-tables/DT_bootstrap.js" ></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/manage-resource/assets/scripts/core/app.js" ></script>
<script src="/manage-resource/assets/scripts/table-managed-news.js" ></script>
<script>
jQuery(document).ready(function() {       
   App.init();
   TableManaged.init();
});
</script>
<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>
<!-- END BODY -->
</html>
