<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome-animation.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />

<!-- BEGIN HEADER-->
<header id="header">
	<div class="headerbar">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="headerbar-left">
			<ul class="header-nav header-nav-options">
				<li class="header-nav-brand">
					<div class="brand-holder">
						<a
							href="${pageContext.servletContext.contextPath }/admin/cpanel/dashboard">
							<img alt=""
							src="${pageContext.servletContext.contextPath }/assets/img/logo.png"
							class="img-round"> <span
							class="text-lg text-bold text-primary">CAMBRIGHT</span>
						</a>
					</div>
				</li>
				<li><a class="btn btn-icon-toggle menubar-toggle"
					data-toggle="menubar" href="javascript:void(0);"> <i
						class="fa fa-bars"></i>
				</a></li>
			</ul>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="headerbar-right">
			<ul class="header-nav header-nav-options">
				<li>
					<div class="tools">
						<c:if test="${adminsession.branch_name!=null}">
							<span class="badge style-accent-dark">${adminsession.branch_name }</span>
						</c:if>
						<c:if test="${studentsession.branch_name!=null}">
							<span class="badge style-accent-dark">${studentsession.branch_name }</span>
						</c:if>
					</div>
				</li>
				<li class="dropdown hidden-xs"><a href="javascript:void(0);"
					class="btn btn-icon-toggle btn-default" data-toggle="dropdown">
						<i class="md md-notifications faa-ring animated"></i><sup
						class="badge style-danger">4</sup>
				</a>
					<ul class="dropdown-menu animation-expand">
						<li class="dropdown-header">Today's messages</li>
						<li><a class="alert alert-callout alert-warning"
							href="javascript:void(0);"> <img
								class="pull-right img-circle dropdown-avatar"
								src="${pageContext.servletContext.contextPath }/assets/img/user.png"
								alt="" /> <strong>Alex Anistor</strong><br /> <small>Testing
									functionality...</small>
						</a></li>
						<li><a class="alert alert-callout alert-info"
							href="javascript:void(0);"> <img
								class="pull-right img-circle dropdown-avatar"
								src="${pageContext.servletContext.contextPath }/assets/img/user.png"
								alt="" /> <strong>Alicia Adell</strong><br /> <small>Reviewing
									last changes...</small>
						</a></li>
						<li class="dropdown-header">Options</li>
						<li><a
							href="${pageContext.servletContext.contextPath }/html/pages/login.html">View
								all messages <span class="pull-right"><i
									class="fa fa-arrow-right"></i></span>
						</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/html/pages/login.html">Mark
								as read <span class="pull-right"><i
									class="fa fa-arrow-right"></i></span>
						</a></li>
					</ul>
					<!--end .dropdown-menu --></li>
				<!--end .dropdown -->
			</ul>
			<!--end .header-nav-options -->
			<ul class="header-nav header-nav-profile">
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle ink-reaction" data-toggle="dropdown">
					 	<c:if  test="${adminsession.img_url!=null }">
								<img
									src="${pageContext.servletContext.contextPath }/admin/cpanel/img/emp/${adminsession.img_url}"
									alt="" />
						</c:if>
						<!--  -->
						<c:if  test="${studentsession.img_url!=null }">
								<img
									src="${pageContext.servletContext.contextPath }/img/stud/${studentsession.img_url}"
									alt="" />
						</c:if>
						<c:if  test="${adminsession.img_url==null && studentsession.img_url==null}">
								<img
									src="${pageContext.servletContext.contextPath }/assets/img/user.png"
									alt="" />
						</c:if>
						<c:if test="${studentsession.branch_name!=null}">
							<span class="profile-info"> ${studentsession.kh_name} <small>${studentsession.user_type }</small></span>
						</c:if>
						<c:if test="${adminsession.branch_name!=null}">
							<span class="profile-info"> ${adminsession.kh_name} <small>${adminsession.user_type }</small></span>
						</c:if>
						 
					
				</a>
					<ul class="dropdown-menu animation-dock">
						<li class="dropdown-header">Setting</li>
						<li><a href="#"><i class="md md-location-history"></i> My
								History</a></li>
						<li class="divider"></li>
						<li><a href="#" data-toggle="modal" data-target="#formModal"><i
								class="fa fa-fw fa-lock"></i> Change password</a></li>
						<li><a href="<c:if test='${adminsession!=null}'>logout_admin </c:if> 
									 <c:if test='${studentsession!=null}'>logout_student</c:if>"><i
								class="fa fa-fw fa-power-off text-danger"></i> Logout</a></li>
					</ul>
					<!--end .dropdown-menu --></li>
				<!--end .dropdown -->
			</ul>
			<!--end .header-nav-profile -->
			<ul class="header-nav header-nav-toggle">
				<li><a class="btn btn-icon-toggle btn-default"
					href="#offcanvas-search" data-toggle="offcanvas"
					data-backdrop="false"> <i class="fa fa-ellipsis-v"></i>
				</a></li>
			</ul>
			<!--end .header-nav-toggle -->
		</div>
		<!--end #header-navbar-collapse -->
	</div>
</header>
<!-- END HEADER-->


<!-- BEGIN OFFCANVAS LEFT -->
<div class="offcanvas"></div>
<!--end .offcanvas-->
<!-- END OFFCANVAS LEFT -->

<!-- END MENUBAR -->

<!-- BEGIN OFFCANVAS RIGHT -->
<div class="offcanvas">

	<!-- BEGIN OFFCANVAS SEARCH -->
	<div id="offcanvas-search" class="offcanvas-pane width-8">
		<div class="offcanvas-head">
			<header class="text-primary">Active Users</header>
			<div class="offcanvas-tools">
				<a class="btn btn-icon-toggle btn-default-light pull-right"
					data-dismiss="offcanvas"> <i class="md md-close"></i>
				</a>
			</div>
		</div>
		<div class="offcanvas-body no-padding">
			<ul class="list" id="activeusers">
				<li class="tile">
					<!-- <a class="tile-content ink-reaction" href="#offcanvas-chat" data-toggle="offcanvas" data-backdrop="false">
									<div class="tile-icon">
										<img src="assets/img/avatar9.jpg?1404026744" alt="" />
									</div>
									<div class="tile-text">
										Ann Laurens 
										<span class="pull-right"><i class="md md-brightness-1" style="color: green;font-size:12px"></i></span>
									</div>
								</a> -->
				</li>
			</ul>
		</div>
		<!--end .offcanvas-body -->
	</div>
	<!--end .offcanvas-pane -->

</div>
<!--end .offcanvas-->
<!-- END OFFCANVAS RIGHT -->

<div class="modal fade" id="formModal" tabindex="-1" role="dialog"
	aria-labelledby="formModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="formModalLabel">Change Password</h4>
			</div>
			<form class="form-horizontal" role="form" id="fm-changepwd">
				<div class="modal-body">
					<div class="form-group">
						<div class="col-sm-3">
							<label for="old-password" class="control-label">Old
								password</label>
						</div>
						<div class="col-sm-9">
							<input type="password" name="old-password" id="old-password"
								class="form-control" placeholder="Old password" required>
							<div class="form-control-line"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">
							<label for="new-password" class="control-label">New
								password</label>
						</div>
						<div class="col-sm-9">
							<input type="password" name="new-password" id="new-password"
								class="form-control" placeholder="New password" required>
							<div class="form-control-line"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">
							<label for="confirm-password" class="control-label">Confirm
								new password</label>
						</div>
						<div class="col-sm-9">
							<input type="password" name="confirm-password"
								id="confirm-password" class="form-control"
								placeholder="Confirm new password" required>
							<p class="text-danger" id='helper-pwd' style="display: none">Password
								not match</p>
							<div class="form-control-line"></div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary" id='btn-changepwd'>Confirm</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>