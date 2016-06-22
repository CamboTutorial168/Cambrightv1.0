
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<c:if test="${sessionScope.adminsession==null }" var="adminsession">
	<c:redirect url="admin"></c:redirect>
</c:if>
<title>CAMBRIGHT | DASHBOARD</title>

<c:set value="${requestScope.getactivestud }" var="getactivestud"></c:set>
<c:set value="${requestScope.getactiveemp }" var="getactiveemp"></c:set>
<c:set value="${requestScope.getabsentemp }" var="getabsentemp"></c:set>
<c:set value="${requestScope.getdiscourse }" var="getdiscourse"></c:set>
<c:set value="${requestScope.getallnewstu }" var="getallnewstu"></c:set>
<c:set value="${requestScope.chartCol }" var="chartCol"></c:set>
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
		page="${pageContext.servletContext.contextPath }/../mastertop/header.jsp"></jsp:include>

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
										<strong class="text-xl"><c:out
												value="${getactivestud }"></c:out></strong><br /> <span
											class="opacity-50">Active Students</span>
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
												value="${getactiveemp }"></c:out></strong><br /> <span
											class="opacity-50">Employees</span>
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


										<c:choose>
											<c:when test="${getabsentemp==-1}">
												<h1 class="pull-right">
													<i class="fa fa-refresh fa-spin faa-fast"></i>
												</h1>
												<strong class="text-xl"> Checking... </strong>
												<br />
											</c:when>
											<c:otherwise>
												<h1 class="pull-right">
													<i class="md md-today faa-shake animated"></i>
												</h1>
												<strong class="text-xl"> ${getabsentemp } </strong>
												<br />
											</c:otherwise>
										</c:choose>

										<span class="opacity-50">Employees Today's Absent</span>
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
											<c:choose>
												<c:when test="${getdiscourse==0 }">
													<i class="fa fa-exclamation-triangle"></i>
												</c:when>
												<c:otherwise>
													<i
														class="fa fa-exclamation-triangle faa-flash animated faa-slow"></i>
												</c:otherwise>
											</c:choose>
										</h1>
										<strong class="text-xl"><c:out
												value="${getdiscourse }"></c:out></strong><br /> <span
											class="opacity-50">Deactive Course</span>
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
						<div class="col-md-5">
							<div class="card">
								<div class="card-body">
									<div id="chart" style="width: 100%; height: 410px;"></div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!-- BEGIN NEW REGISTRATIONS -->
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<div id="piechart" style="width: 100%; height: 410px;"></div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						<!-- END NEW REGISTRATIONS -->

						<!-- BEGIN ABSENT TEACHERS -->
						<div class="col-md-3">
							<div class="card card-outlined style-primary-dark">
								<div class="card-head card-head-sm style-primary-dark">
									<header>New Students Registration</header>
								</div>
								<!--end .card-head -->
								<div class="card-body no-padding height-10 scroll">
									<ul class="list divider-full-bleed">

										<c:forEach items="${getallnewstu }" var="item">
											<li class="tile">
												<div class="tile-content">
													<div class="tile-icon">
														<img
															src="${pageContext.servletContext.contextPath }/assets/img/user.png"
															alt="" />
													</div>
													<div class="tile-text">${item.st_en_name }</div>
												</div> <a class="btn btn-flat ink-reaction" data-toggle="tooltip"
												data-placement="top" title="View detail"> <i
													class="md md-visibility text-default-light"></i>
											</a>
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
			page="${pageContext.servletContext.contextPath }/../masterleft/menubar.jsp"></jsp:include>
		<!-- END MENUBAR -->
	</div>
	<!--end #base-->
	<!-- END BASE -->

	<!-- BEGIN JAVASCRIPT -->
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/spin.js/spin.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/autosize/jquery.autosize.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/moment/moment.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/jquery.flot.time.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/flot/curvedLines.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery-knob/jquery.knob.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/nanoscroller/jquery.nanoscroller.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/d3/d3.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/d3/d3.v3.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/rickshaw/rickshaw.min.js"></script>
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
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>

	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/underscore-min.js"></script>
	<!-- END JAVASCRIPT -->
	<script type="text/javascript">
		$("#dashboard").addClass("active");
		
		google.charts.load('current', {'packages':['corechart','bar']});
	    google.charts.setOnLoadCallback(drawChart);
	    
	      function drawChart() {
	        var json="${chartCol}";
	       
	        //Convert Format JSON to Array buf to ChartColumns
	        var header = _.chain(json).pluck("gender").sort().uniq(true).value();
	        header.unshift("Students");
	
	       
	        var rows = _.chain(json)
	        .groupBy(function(item) { return item.branch; })
	        .map(function(group, key) { 
	            var result = [key];
	            _.each(group, function(item) { 
	                result[_.indexOf(header, item.gender)] = parseInt(item.quantity); 
	            });
	            return result; 
	        })
	        .value();
	        	
	        
	        var jsonData = [header].concat(rows);
	     
	        var dataCol = google.visualization.arrayToDataTable(jsonData);
	  
	          var optionsCol = {
	            chart: {
	              title: 'Number of Students',
	              subtitle: 'Student currently are studying.'
	            }
	            
	          };
	  
	          var chartCol = new google.charts.Bar(document.getElementById('chart'));
	  
	          chartCol.draw(dataCol, optionsCol);
	        
      	}
	    
	    $(window).resize(function(){
	    	  drawChart();
	    });
	      
      </script>
</body>
</html>
