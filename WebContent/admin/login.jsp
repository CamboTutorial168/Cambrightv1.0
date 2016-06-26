<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ADMIN | LOGIN</title>
<c:if test="${sessionScope.adminsession!=null }">
	<c:redirect url="cpanel/dashboard"></c:redirect>
</c:if>

<!-- BEGIN META -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="your,keywords">
<meta name="description" content="Short explanation about this website">
<!-- END META -->

<!-- BEGIN MAIN CSS -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900'
	rel='stylesheet' type='text/css' />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/bootstrap.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/materialadmin.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/material-design-iconic-font.min.css" />
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome-animation.min.css">

<!-- END STYLESHEETS -->
</head>
<body class="menubar-hoverable header-fixed ">

	<!-- BEGIN LOGIN SECTION -->
	<section class="section-account">
		<div class="img-backdrop"
			style="background-image: url('${pageContext.servletContext.contextPath }/assets/img/admin_banner.png')"></div>
		<div class="spacer"></div>
		<div class="card contain-sm style-transparent">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<div class="card">
							<div class="card-body">
								<span class="text-lg text-bold text-primary">Log in</span> <br />
								<br />
								<form class="form floating-label" accept-charset="utf-8"
									action="#" method="POST" id="fm-login">
									<div class="form-group">
										<input type="email" class="form-control" id="admin-id-card"
											required> <label for="admin-id-card">Email</label>
									</div>
									<div class="form-group">
										<input type="password" class="form-control"
											id="admin-password" required> <label
											for="admin-password">Password</label>
										<p class="help-block">
											<a href="${pageContext.servletContext.contextPath }/">Log in as student?</a>
										</p>
									</div>
									<br />
									<div class="row">
										<div class="col-xs-6 text-left">
											<div class="checkbox checkbox-inline checkbox-styled">
												<label> <input type="checkbox"> <span>Remember
														me</span>
												</label>
											</div>
										</div>
										<!--end .col -->
										<div class="col-xs-6 text-right">
											<button class="btn btn-primary btn-raised ink-reaction"
												type="submit">Login</button>
										</div>
										<!--end .col -->
									</div>
									<!--end .row -->
								</form>
							</div>
							<!--end .card-body -->
						</div>

					</div>
					<!--end .col -->

				</div>
				<!--end .row -->
			</div>
			<!--end .card-body -->
		</div>
		<!--end .card -->
	</section>
	<!-- END LOGIN SECTION -->

	<!-- MAIN SCRIPT -->
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<!-- END MAIN SCRIPT  -->

	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
</body>
<script>
					$("#admin-id-card").focus();
					//Enter key hit
			        /* function loginHit(e){
						if(e.keyCode==13){
							$("#fm-login").submit(function(e){
								e.preventDefault();	
								login();
							});
						}
					} 
					 */
					
					
					
					function login(){
						
						$.ajax({
							url:"admin_login",
							type:"POST",
							data:{
								admin_email:$("#admin-id-card").val(),
								admin_password:$("#admin-password").val()
							},
							beforeSend: function() {
								$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
						    },
							success:function(data){
								
								if(data=="true"){
									location.href="cpanel/dashboard";
								}else{
									$("#loading").remove();
									$("#admin-password").val("")
									.focus();
									swal("FAILED","Incorrected username or password!","error");
								}
							}
						});
					}
					jQuery(function($){
						$("#fm-login").submit(function(e){
							e.preventDefault();	
							login();
						});
					});
			</script>


</html>
