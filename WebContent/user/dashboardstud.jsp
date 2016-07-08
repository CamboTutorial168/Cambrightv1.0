
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<c:if test="${sessionScope.studentsession==null }" var="studentsession">
	<c:redirect url="/"></c:redirect>
</c:if>
<title>CAMBRIGHT | DASHBOARD</title>

<c:set value="${requestScope.rankAbsent }" var="rankAbsent"></c:set>
<c:set value="${requestScope.schedulePeriod }" var="schedulePeriod"></c:set>
<c:set value="${requestScope.getExpiredDate }" var="getExpiredDate"></c:set>
<c:set value="${requestScope.getPaymentHis }" var="getPaymentHis"></c:set>
<!-- BEGIN META -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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


</head>
<body class="menubar-hoverable header-fixed ">

	<jsp:include
		page="/mastertop/header.jsp"></jsp:include>

	<!-- BEGIN BASE-->
	<div id="base">
		<!-- BEGIN CONTENT-->
		<div id="content">
			<section>
				<div class="section-body">
					<div class="row">

						<!-- BEGIN ACTIVE STUDENTS -->
						<div class="col-md-3 col-sm-6">
							<div class="card">
								<div class="card-body no-padding">
									<div class="alert no-margin style-primary">
										<h1 class="pull-right">
											<i class="md md-school faa-float animated"></i>
										</h1>
										<strong id="rank" class="text-xl"> </strong><br /><span
											class="opacity-50">My Rank of The Month</span>
									</div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END ACTIVE STUDENTS -->

						<!-- BEGIN ACTIVE EMPLOYEES -->
						<div class="col-md-3 col-sm-6">
							<div class="card">
								<div class="card-body no-padding">
									<div class="alert style-accent no-margin">
										<h1 class="pull-right">
											<i class="md md-account-circle faa-pulse animated"></i>
										</h1>
										<strong class="text-xl"><c:out
												value="${schedulePeriod }"></c:out></strong><br /> <span
											class="opacity-50">Schedule Period</span>
									</div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END ACTIVE EMPLOYEES-->

						<!-- BEGIN ABSENT EMP -->
						<div class="col-md-3 col-sm-6">
							<div class="card">
								<div class="card-body no-padding">
									<div class="alert style-info no-margin">

											<h1 class="pull-right">
												<i class="md md-today faa-shake animated"></i>
											</h1>
											<strong id="absent" class="text-xl"></strong>
											<br />
										<span class="opacity-50">My Absents</span>
									</div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END ABSENT EMP -->

						<!-- BEGIN COURSE DISABLE -->
						<div class="col-md-3 col-sm-6">
							<div class="card">
								<div class="card-body no-padding">
									<div class="alert style-danger no-margin">
										<h1 class="pull-right">
											<i class="fa fa-exclamation-triangle faa-flash animated faa-slow"></i>
										</h1>
										<strong class="text-xl"><c:out
												value="${getExpiredDate }"></c:out></strong><br /> <span
											class="opacity-50">My Expired Date</span>
									</div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END COURSE DISABLE -->

					</div>
					<!--end .row -->

					<div class="row">
						<!-- BEGIN ABSENT TEACHERS -->
						<div class="col-md-12">
							<div class="card card-outlined style-primary-dark">
								<div class="card-head card-head-sm style-primary-dark">
									<header>My Histories Payment</header>
								</div>
								<!--end .card-head -->
								<div class="card-body no-padding height-10 scroll">
									<ul class="list divider-full-bleed">

									 <c:forEach items="${getPaymentHis }" var="item">
											<li class="tile">
												<div class="tile-content">
													<p class="tile-text">On <b>${item.date_paid }</b> to <b>${item.expired }</b> was paid <b>$ ${item.total }</b>
													on <b>${item.fee_type }</b> of level <b>${item.subprog_title }</b>, discounted <b>${item.discount } %</b>
													by <b>${item.recept_name }</b> at <b><span class='badge' style='background-color:${item.branch_color }'>${item.branch_name }</span></b>
													</p>
												</div> 
											</li>

									 </c:forEach>
									</ul>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END ABSENT TEACHERS -->

					</div>
					<!--end .row -->
				</div>
				<!--end .section-body -->
			</section>
		</div>
		<!--end #content-->
		<!-- END CONTENT -->

		<!-- BEGIN MENUBAR-->
		<jsp:include
			page="/masterleft/menubar.jsp"></jsp:include>
		<!-- END MENUBAR -->
	</div>
	<!--end #base-->
	<!-- END BASE -->

	<!-- BEGIN JAVASCRIPT -->
	
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavSearch.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppVendor.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	
	<!-- END JAVASCRIPT -->
	<script type="text/javascript">
		$("#dashboard").addClass("active");
	    var x=""+${rankAbsent} ;
	    x=JSON.parse(x);
	    console.log(x);
	    $("#rank").append(x[0].rank+" / "+x[0].of_month);
	    $("#absent").append(x[0].absent);
	    $(window).resize(function(){
	    	  drawChart();
	    });
	      
      </script>
</body>
</html>
