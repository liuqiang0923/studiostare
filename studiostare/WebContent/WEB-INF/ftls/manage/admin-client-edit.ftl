<html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Studio Stare | editClient</title>
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
		<a class="navbar-brand" href="index.html">
			<img src="favicon.png" alt="logo" class="img-responsive"/>
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
						<a href="admin-video-list.html" >
							<i class="fa fa-bar-chart-o"></i>
							<span class="title">
								Video
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="admin-client-list.html"> 
							<i class="fa fa-bar-chart-o"></i> 
							<span class="title"> 
								Client 
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="admin-category-list.html"> 
							<i class="fa fa-bar-chart-o"></i> 
							<span class="title"> 
								Category 
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="admin-news-list.html" >
							<i class="fa fa-bar-chart-o"></i>
							<span class="title">
								News
							</span>
						</a>
					</li>
					<li class="last ">
						<a href="admin-about-edit.html" >
							<i class="fa fa-bar-chart-o"></i>
							<span class="title">
								Edit About
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
						<h3 class="page-title">Edit Client Wizard</h3>
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
									<i class="fa fa-reorder"></i> Edit Client Wizard - <span
										class="step-title"> Step 1 of 2 </span>
								</div>
							</div>
							<div class="portlet-body form">
								<form action="/studiostare/manage/saveClient" class="form-horizontal" method="post" id="submit_form">
									<div class="form-wizard">
										<div class="form-body">
											<input type="hidden" name="id" value="${(client.id)!"0"}"></input>
											<ul class="nav nav-pills nav-justified steps">
												<li><a href="#tab1" data-toggle="tab" class="step">
														<span class="number"> 1 </span> <span class="desc">
															<i class="fa fa-check"></i> Client Info Setup
													</span>
												</a></li>
												<li><a href="#tab2" data-toggle="tab" class="step">
														<span class="number"> 2 </span> <span class="desc">
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
													<h3 class="block">Provide client details</h3>
													<div class="form-group">
														<label class="control-label col-md-3">Name 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="name" value="${(client.name)!""}" />
															<span class="help-block"> Input name </span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Phone 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="phone" value="${(client.phone)!""}" />
															<span class="help-block"> Input phone. </span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Email 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="email" value="${(client.email)!""}"/>
															<span class="help-block"> Input email address </span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Description 
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<input type="text" class="form-control" name="description" value="${(client.description)!""}"/>
															<span class="help-block"> Input description </span>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="tab2">
													<h3 class="block">Confirm your account</h3>
													<h4 class="form-section">Client Info</h4>
													<div class="form-group">
														<label class="control-label col-md-3">Name:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="name">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Phone:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="phone">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Email:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="email">
															</p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Description:</label>
														<div class="col-md-4">
															<p class="form-control-static" data-display="description">
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
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/jquery.dataTables.js" ></script>
	<script type="text/javascript" src="/studiostare/manage-resource/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/studiostare/manage-resource/assets/scripts/core/app.js"></script>
	<script src="/studiostare/manage-resource/assets/scripts/form-wizard-client.js"></script>
	<script src="/studiostare/manage-resource/assets/scripts/custom/table-editable.js"></script>
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
