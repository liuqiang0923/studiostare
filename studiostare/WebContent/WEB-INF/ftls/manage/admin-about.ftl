<html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Studio Stare | About</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/studiostare/manage-resource/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/studiostare/manage-resource/assets/plugins/select2/select2.css" />
<link rel="stylesheet" type="text/css" href="/studiostare/manage-resource/assets/plugins/select2/select2-metronic.css" />
<link rel="stylesheet" href="/studiostare/manage-resource/assets/plugins/data-tables/DT_bootstrap.css" />
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="/studiostare/manage-resource/assets/css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/studiostare/manage-resource/assets/css/custom.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
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
		<a class="navbar-brand" href="/studiostare/index.html">
			<img style="height:22px" src="/studiostare/manage-resource/favicon.png" alt="logo" class="img-responsive"/>
		</a>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="/studiostare/manage-resource/assets/img/menu-toggler.png" alt=""/>
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
						<a href="/studiostare/manage/admin-video-list.html" >
							<i class="fa fa-puzzle-piece"></i>
							<span class="title">
								Video
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/studiostare/manage/admin-client-list.html"> 
							<i class="fa fa-user"></i> 
							<span class="title"> 
								Client 
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/studiostare/manage/admin-category-list.html"> 
							<i class="fa fa-sitemap"></i> 
							<span class="title"> 
								Category 
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/studiostare/manage/admin-news-list.html" >
							<i class="fa fa-file-text"></i>
							<span class="title">
								News
							</span>
						</a>
					</li>
					<li class="last ">
						<a style="background:#000000;" href="/studiostare/manage/admin-about.html" >
							<i class="fa fa-bookmark-o"></i>
							<span class="title">
								About
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/studiostare/manage/admin-leading-list.html" >
							<i class="fa fa-th"></i>
							<span class="title">
								Leading page
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="/studiostare/manage/admin-admin.html" >
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
				<!-- BEGIN PAGE HEADER-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">About US</h3>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				
				<div class="form-group" id="div_aboutinfo">
						<h4 class="form-section">About Info</h4>
						<div class="row">
							<label class="control-label col-md-2"> 
								Office Img 
							</label>
							<div class="fileinput fileinput-new col-md-4" data-provides="fileinput">
								<div class="fileinput-preview thumbnail" style="width: 100%;" data-trigger="fileinput" id="officeimgdiv">
								<#if (about.officeImgPath)?? >
									<img src='${(about.officeImgPath)!""}'></img>
								</#if>
								</div>
							    <!-- <input type="file" name="officeimg" /> -->
							</div>
						</div>
						<h4 class="form-section"></h4>
						<div class="row">
							<label class="control-label col-md-2"> 
								About us description
							</label>
							<div class="col-md-4">
								<textarea class="form-control" rows="3" style="width: 100%;" name="aboutus" readonly="readonly">${(about.aboutUsInfo)!""}</textarea>
								<!--
								<a href="javascript:;" class="btn green button-submit" id="saveAboutUs">
									Save <i class="m-icon-swapright m-icon-white"></i>
								</a>
								-->
							</div>
						</div>
						<h4 class="form-section"></h4>
						<div class="row">
							<label class="control-label col-md-2"> 
								Manifesto
							</label>
							<div class="col-md-4">
								<textarea class="form-control" rows="3" style="width: 100%;" name="manifestor" readonly="readonly">${(about.manifesto)!""}</textarea>
								<!--
								<a href="javascript:;" class="btn green button-submit" id="saveManifesto">
									Save <i class="m-icon-swapright m-icon-white"></i>
								</a>
								-->
							</div>
						</div>
						<h4 class="form-section"></h4>
						<div class="row">
							<label class="control-label col-md-2"> </label>
							<div class="col-md-4">
								<a href="javascript:;" class="btn green button-submit" id="saveAboutInfo">
									Edit <i class="m-icon-swapright m-icon-white"></i>
								</a>
							</div>
						</div>
				</div>
				
				<!--
				<div class="form-group" id="div_manifesto">
						<h4 class="form-section">Manifesto</h4>
						<div class="row">
							<label class="control-label col-md-2"> 
								Manifesto
							</label>
							<div class="col-md-4">
								<textarea class="form-control" rows="3" style="width: 100%;" name="manifestor">${(about.manifesto)!""}</textarea>
								<a href="javascript:;" class="btn green button-submit" id="saveManifesto">
									Save <i class="m-icon-swapright m-icon-white"></i>
								</a>
							</div>
						</div>
				</div>
				-->
				
				<h4 class="form-section">Who we are</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box light-grey">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i>Who we are
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-toolbar">
									<div class="btn-group">
										<button id="managetable_about_new" class="btn green"> Add New <i class="fa fa-plus"></i></button>
									</div>
								</div>
								<table class="table table-striped table-bordered table-hover" id="managetable_about">
									<thead>
										<tr>
											<th class="table-checkbox">
												<input type="checkbox" class="group-checkable" data-set="#managetable_about .checkboxes"/>
											</th>
											<th>
												 Photo
											</th>
											<th>
												 Name
											</th>
											<th>
												 Position
											</th>
											<th>
												 Email
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
										<#if whoList??>
										<#list whoList as who>
										<tr class="odd gradeX">
											<td>
												<input name="clientId" type="checkbox" class="checkboxes" value=${(who.id)!""} />
											</td>
											<td><img style="width:150px;" src='${(who.photoPath)!""}'></td>
											<td>${(who.name)!""}</td>
											<td>${(who.position)!""}</td>
											<td><a href='mailto:${(who.email)!""}'>${(who.email)!""}</a></td>
											<td>${(who.description)!""}</td>
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
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">2014 &copy; Metronic by keenthemes.</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
<script src="/studiostare/manage-resource/assets/plugins/respond.min.js"></script>
<script src="/studiostare/manage-resource/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
	<script src="/studiostare/manage-resource/assets/plugins/jquery-1.10.2.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/jquery.blockui.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/jquery.cokie.min.js"></script>
	<script src="/studiostare/manage-resource/assets/plugins/uniform/jquery.uniform.min.js"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/studiostare/manage-resource/assets/scripts/core/app.js"></script>
	<script src="/studiostare/manage-resource/assets/scripts/table-managed-about.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {       
			// initiate layout and plugins
			App.init();
			TableManaged.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
</body>
<!-- END BODY -->
</html>
