<html>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Studio Stare | Edit Video</title>
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
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="/studiostare/manage-resource/assets/css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/studiostare/manage-resource/assets/css/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<link href="/studiostare/manage-resource/assets/css/custom.css" rel="stylesheet" type="text/css" />
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
			<img src="/studiostare/manage-resource/favicon.png" alt="logo" class="img-responsive"/>
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
						<a style="background:#000000;" href="/studiostare/manage/admin-video-list.html" >
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
						<a href="/studiostare/manage/admin-about.html" >
							<i class="fa fa-bookmark-o"></i>
							<span class="title">
								About
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
				<div class="modal fade" id="portlet-config" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">Widget settings form goes here</div>
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
						<h3 class="page-title">Edit Video Wizard</h3>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box blue" id="form_wizard_1">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-reorder"></i> Edit Video Wizard - <span
										class="step-title"> Step 1 of 4 </span>
								</div>
							</div>
							<div class="portlet-body form">
								<form action="/studiostare/manage/saveVideo" class="form-horizontal" id="submit_form" method="post" enctype="multipart/form-data">
									<input type="hidden" name="id" value="${(video.id)!"0"}"></input>
									<div class="form-wizard">
										<div class="form-body">
											<ul class="nav nav-pills nav-justified steps">
												<li><a href="#tab1" data-toggle="tab" class="step">
														<span class="number"> 1 </span> <span class="desc">
															<i class="fa fa-check"></i> Video Info Setup
													</span>
												</a></li>
												<li><a href="#tab2" data-toggle="tab" class="step">
														<span class="number"> 2 </span> <span class="desc">
															<i class="fa fa-check"></i> Video Image Setup
													</span>
												</a></li>
												<li><a href="#tab3" data-toggle="tab" class="step">
														<span class="number"> 3 </span> <span class="desc">
															<i class="fa fa-check"></i> Video Setup
													</span>
												</a></li>
												<li><a href="#tab4" data-toggle="tab" class="step">
														<span class="number"> 4 </span> <span class="desc">
															<i class="fa fa-check"></i> Confirm
													</span>
												</a></li>
											</ul>
											<div id="bar" class="progress progress-striped"
												role="progressbar">
												<div class="progress-bar progress-bar-success"></div>
											</div>
											<div class="tab-content">
												<div class="alert alert-danger display-none">
													<button class="close" data-dismiss="alert"></button>
													You have some form errors. Please check below.
												</div>
												<div class="alert alert-success display-none">
													<button class="close" data-dismiss="alert"></button>
													Your form validation is successful!
												</div>
												<div class="tab-pane active" id="tab1">
													<h3 class="block">Provide Video details</h3>
													<div class="form-group">
														<label class="control-label col-md-3">Video name <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="name" value='${(video.name)!""}'/>
															<span class="help-block"> Input video name </span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Client <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<select name="client.id" class="form-control" value='${(video.client.id)!""}'>
																<option value='${(video.client.id)!""}'>${(video.client.name)!"choose one"}</option>
																<#if clientList ??>
																	<#list clientList as client>
																		<option value='${(client.id)!""}'>${(client.name)!""}</option>
																	</#list>
																</#if>
															</select>
															<span class="help-block"> Select client </span>
														</div>													
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Category <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<select name="category.id" class="form-control" value='${(video.category.id)!""}'>
																<option value='${(video.category.id)!""}'>${(video.category.name)!"choose one"}</option>
																<#if categoryList ??>
																	<#list categoryList as category>
																		<option value='${(category.id)!""}'>${(category.name)!""}</option>
																	</#list>
																</#if>
															</select>
															<span class="help-block"> Select category </span>
														</div>													
													</div>
													<!--
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video Img 
															<span class="required"> * </span>
														</label>
														<div class="fileinput fileinput-new col-md-4" data-provides="fileinput">
															<div class="fileinput-preview thumbnail" style="width: 100%;" data-trigger="fileinput" id="videoimgdiv">
															</div>
															<input type="file" name="videoimg"/>
															<span class="help-block"> Upload video img. </span>	
														</div>
													</div>
													-->
													<!--
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video 
															<span class="required"> * </span>
														</label>
														<div class="fileinput fileinput-new col-md-4" data-provides="fileinput">
															<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%;" id="videodiv">
															</div>
															<input type="file" name="video"/>
															<span class="help-block"> Upload video. </span>	
														</div>
													</div>
													-->
													<!--
													<div class="form-group">
														<label class="control-label col-md-3">Description 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<textarea class="form-control" rows="3" style="width:100%" name="description"></textarea>
															<span class="help-block"> Input video description </span>
														</div>
													</div>
													-->
													<div class="form-group">
														<label class="control-label col-md-3">Order 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="index" value='${(video.index)!""}'/>
															<span class="help-block"> Input video order </span>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="tab2">
													<h3 class="block">Provide video image</h3>
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video Img 
															<span class="required"> * </span>
														</label>
														<div class="fileinput fileinput-new col-md-4" data-provides="fileinput">
															<div class="fileinput-preview thumbnail" style="width: 100%;" data-trigger="fileinput" id="videoimgdiv">
																<#if (video.imgPath) ??>
																	<img src='${(video.imgPath)!""}'></img>
																</#if>
															</div>
															<input type="file" name="videoimg"/>
															<span class="help-block"> Upload video img. </span>	
														</div>
													</div>
													<!--
													<div class="portlet box blue">
														<div class="portlet-title">
															<div class="caption">
																<i class="fa fa-edit"></i>video clients
															</div>
														</div>
														<div class="portlet-body">
															<div class="table-toolbar">
																<div class="btn-group">
																	<button id="editable_client_new" class="btn green">
																		Add New <i class="fa fa-plus"></i>
																	</button>
																</div>
															</div>
															<table class="table table-striped table-hover table-bordered" id="editable_client">
																<thead>
																	<tr>
																		<th>Client name</th>
																		<th>Phone</th>
																		<th>Email</th>
																		<th>Description</th>
																		<th>Edit</th>
																		<th>Delete</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>client 1</td>
																		<td>1234</td>
																		<td>
																			<a href="mailto:aa@gmail.com">
																				aa@gmail.com
																			</a>
																		</td>
																		<td>description 1</td>
																		<td><a class="edit" href="javascript:;"> Edit </a></td>
																		<td><a class="delete" href="javascript:;"> Delete </a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													-->
												</div>
												<div class="tab-pane" id="tab3">
													<h3 class="block">Provide video </h3>
													<h4 class="form-section">Mp4</h4>
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4" data-provides="fileinput">
															<div data-trigger="fileinput" style="width: 100%;" id="videomp4div">
																<#if (video.videoPathMp4) ??>
																	<video controls="controls" preload="preload" src='${(video.videoPathMp4)!""}'></video>
																</#if>
															</div>
															<input type="file" name="videomp4"/>
															<span class="help-block"> Upload mp4 video. </span>	
														</div>
													</div>
													<h4 class="form-section">webm</h4>
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4" data-provides="fileinput">
															<div data-trigger="fileinput" style="width: 100%;" id="videowebmdiv">
																<#if (video.videoPathWebm) ??>
																	<video style="width:300px;height:150px;" preload="preload" controls="controls" src='${(video.videoPathWebm)!""}'></video>
																</#if>
															</div>
															<input type="file" name="videowebm"/>
															<span class="help-block"> Upload webm video. </span>	
														</div>
													</div>
													<h4 class="form-section">ogg</h4>
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4" data-provides="fileinput">
															<div data-trigger="fileinput" style="width: 100%;" id="videooggdiv">
																<#if (video.videoPathOgg) ??>
																	<video style="width:300px;height:150px;" preload="preload" controls="controls" src='${(video.videoPathOgg)!""}'></video>
																</#if>
															</div>
															<input type="file" name="videoogg"/>
															<span class="help-block"> Upload ogv video. </span>	
														</div>
													</div>
													<!--
													<h4 class="form-section">mp4</h4>
													<div class="form-group">
														<label class="control-label col-md-3"> 
															Video 
															<span class="required"> * </span>
														</label>
														<div class="fileinput fileinput-new col-md-4" data-provides="fileinput">
															<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%;" id="videodiv_mp4">
															</div>
															<input type="file" name="videomp4"/>
															<span class="help-block"> Upload mp4 video. </span>	
														</div>
													</div>
													-->
													<!--
													<div class="portlet box blue">
														<div class="portlet-title">
															<div class="caption">
																<i class="fa fa-edit"></i>video categories
															</div>
														</div>
														<div class="portlet-body">
															<div class="table-toolbar">
																<div class="btn-group">
																	<button id="editable_category_new" class="btn green">
																		Add New <i class="fa fa-plus"></i>
																	</button>
																</div>
															</div>
															<table class="table table-striped table-hover table-bordered" id="editable_category">
																<thead>
																	<tr>
																		<th>Category name</th>
																		<th>Description</th>
																		<th>Edit</th>
																		<th>Delete</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>category 1</td>
																		<td>description 1</td>
																		<td><a class="edit" href="javascript:;"> Edit </a></td>
																		<td><a class="delete" href="javascript:;"> Delete </a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>	
													-->												
												</div>
												<div class="tab-pane" id="tab4">
													<h3 class="block">Confirm your video</h3>
													<h4 class="form-section">Video Info</h4>
													<div class="form-group">
														<label class="control-label col-md-3">Video name:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="name">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Client :</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="client.id">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Category:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="category.id">
															</p>
														</div>
													</div>
													<!--
													<div class="form-group">
														<label class="control-label col-md-3">Description:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="description">
															</p>
														</div>
													</div>
													-->
													<div class="form-group">
														<label class="control-label col-md-3">Order:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="index">
															</p>
														</div>
													</div>
													<h4 class="form-section">Video Image</h4>
													<div class="form-group">
														<label class="control-label col-md-3">Image: 
														</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="videoimgdiv">
															</p>
														</div>
													</div>
													<h4 class="form-section">Videos</h4>
													<div class="form-group">
														<label class="control-label col-md-3">Mp4:
														</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="videomp4div">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Webm:
														</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="videowebmdiv">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Ogg:
														</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="videooggdiv">
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions fluid">
											<div class="row">
												<div class="col-md-12">
													<div class="col-md-offset-3 col-md-9">
														<a href="javascript:;" class="btn default button-previous">
															<i class="m-icon-swapleft"></i> Back
														</a> <a href="javascript:;" class="btn blue button-next">
															Continue <i class="m-icon-swapright m-icon-white"></i>
														</a> <a href="javascript:;" class="btn green button-submit">
															Submit <i class="m-icon-swapright m-icon-white"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
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
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/jquery.dataTables.js" ></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/studiostare/manage-resource/assets/scripts/core/app.js"></script>
	<script src="/studiostare/manage-resource/assets/scripts/form-wizard-video.js"></script>
	<script src="/studiostare/manage-resource/assets/scripts/table-editable-video.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
jQuery(document).ready(function() {       
   // initiate layout and plugins
   App.init();
   FormWizard.init();
   TableEditable.init();
});
</script>
	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
</body>
<!-- END BODY -->
</html>
