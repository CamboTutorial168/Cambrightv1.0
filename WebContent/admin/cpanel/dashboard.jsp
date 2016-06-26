
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>

<c:if test="${sessionScope.adminsession==null }">
	<c:redirect url="admin"></c:redirect>
</c:if>
<title>CAMBRIGHT | DASHBOARD  </title>


	<c:set value="${requestScope.getactivestud }" var="getactivestud"></c:set>
	<c:set value="${requestScope.getactiveemp }" var="getactiveemp"></c:set>
	<c:set value="${requestScope.getabsentemp }" var="getabsentemp"></c:set>
	<c:set value="${requestScope.getdiscourse }" var="getdiscourse"></c:set>
	<c:set value="${requestScope.getallnewstu }" var="getallnewstu"></c:set>
	<c:set value="${requestScope.chartCol }" var="chartCol"></c:set>
	<c:set value="${requestScope.chartLine }" var="chartLine"></c:set>
	<c:set value="${requestScope.expriedStudent }" var="expiredStud"></c:set>
	<c:set value="${requestScope.getallnewstu }" var="getallnewstu"></c:set>
	<c:set value="${requestScope.getclassAval }" var="getclassAval"></c:set>
	<!-- Teacher -->
	<c:set value="${requestScope.getClassNStudent }" var="getClassNStudent"></c:set>
	<c:set value="${requestScope.getNumAbsent }" var="getNumAbsent"></c:set>
	<c:set value="${requestScope.getLevelTeach }" var="getLevelTeach"></c:set>
	<c:set value="${requestScope.getMyStudentListAbsent }" var="getMyStudentListAbsent"></c:set>
<!-- BEGIN META -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- END META -->

<!-- BEGIN MAIN CSS -->
<!-- <link
	href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900'
	rel='stylesheet' type='text/css' /> -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/bootstrap.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/materialadmin.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/material-design-iconic-font.min.css" />
<!-- END MAIN CSS -->
<style>
[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
  display: none !important;
}
</style>

</head>
<body class="menubar-hoverable header-fixed ">

	<jsp:include
		page="${pageContext.servletContext.contextPath }/../mastertop/header.jsp"></jsp:include>

	<!-- BEGIN BASE-->
	<div id="base">
		<!-- BEGIN CONTENT-->
		<div id="content">
			<section>
				<div class="section-body" ng-app="appExpire" ng-controller="ctlExpire" ng-cloak>
					<div class="row">

						<!-- BEGIN ACTIVE STUDENTS -->
						<div class="col-md-3 col-sm-6">
							<div class="card">
								<div class="card-body no-padding">
									<div class="alert no-margin style-primary">
										<h1 class="pull-right">
											<i class="md md-school faa-float animated"></i>
											
										</h1>
										<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
										<strong class="text-xl">${getactivestud }</strong><br /> <span
											class="opacity-50">Active Students</span>
										</c:if>
										
										<c:if test="${adminsession.user_level==3}">
										<strong class="text-xl">{{ classNStudent[0].num_of_student }}</strong><br /> <span
											class="opacity-50">My Students</span>
										</c:if>
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
										<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
										<strong class="text-xl"><c:out
												value="${getactiveemp }"></c:out></strong><br /> <span
											class="opacity-50">Employees</span>
										</c:if>
										<c:if test="${adminsession.user_level==3 }">
										<strong class="text-xl">{{classNStudent[0].class_title}}</strong><br /> <span
											class="opacity-50">My Classroom</span>
										</c:if>
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
											<c:if test="${adminsession.user_level==2 || adminsession.user_level==0 }">
											<strong class="text-xl"> ${getabsentemp } </strong>
											<br />
											<span class="opacity-50">Employees Today's Absent</span>
											</c:if>
											<c:if test="${adminsession.user_level==3 }">
											<strong class="text-xl"> ${getNumAbsent } </strong>
											<br />
											<span class="opacity-50">My Absent</span>
											</c:if>
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
									<div class="alert style-warning no-margin">
										<h1 class="pull-right">
										
										<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
											<i	class="fa fa-exclamation-triangle faa-flash animated faa-slow"></i>
										</c:if>
										<c:if test="${adminsession.user_level==3 }">
											<i class="md md-subject"></i>
										</c:if>
										</h1>
										<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
										<strong class="text-xl"><c:out
												value="${getclassAval }"></c:out></strong><br /> <span
											class="opacity-50">Class Avaliable</span>
										</c:if>
										<c:if test="${adminsession.user_level==3 }">
											<strong class="text-xl"><c:out
												value="${getLevelTeach }"></c:out></strong><br /> <span
											class="opacity-50">My Teaching Subject</span>
										</c:if>
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
					<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
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
							<div class="card card-outlined style-primary-dark">
								<div class="card-head card-head-sm style-primary-dark">
									<header>Students Expired Within Last 15 Days</header>
								</div>
								<div class="card-body no-padding height-10 scroll" >
									<ul class="list divider-full-bleed">
										<li class="tile" ng-repeat="item in nearlyExpired">
											<div class="tile-content">
												<div class="tile-icon" data-toggle="tooltip"
											data-placement="top" title="{{item.id_card}} has {{item.remain_date}} day">
												  	<img ng-if="item.img_url==null"
														src="${pageContext.servletContext.contextPath }/assets/img/user.png"
														alt="" />
												
													<img ng-if"item.img_url!=null"
														src="${pageContext.servletContext.contextPath }/img/stud/{{item.img_url}}"
														alt="" />	
												</div>
												<div class="tile-text"> {{item.kh_name}} expired on <span class='text-danger'>{{item.expried_date}}</span> </div>
											</div> <a class="btn btn-flat ink-reaction" ><span class="badge" style="background-color:{{item.branch_color}}">{{item.branch_name}}</span></a>
										</li>
									</ul>
									<center><h2 ng-if="nearlyExpired==''">Records not yet found !</h2></center>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col -->
						</c:if>
						<c:if test="${adminsession.user_level==3 }">
						<div class="col-md-7">
							<img style="width:100%;height:80%" src="${pageContext.servletContext.contextPath }/assets/img/welcomet.jpg">
						</div>
						</c:if>
						<!-- END NEW REGISTRATIONS -->

						<!-- BEGIN ABSENT TEACHERS -->
						<c:if test="${adminsession.user_level==3 }">
						<div class="col-md-5">
						</c:if>
						<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
							<div class="col-md-3">
						</c:if>
							<div class="card card-outlined style-primary-dark">
								<div class="card-head card-head-sm style-primary-dark">
									<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
									<header>New Students Registration</header>
									</c:if>
									<c:if test="${adminsession.user_level==3 }">
									<header>Students Absent List</header>
									</c:if>
								</div>
								
								<!--end .card-head -->
								<div class="card-body no-padding height-10 scroll" >
									<ul class="list divider-full-bleed">										
										<c:if test="${adminsession.user_level==2 || adminsession.user_level==0}">
										<li class="tile" ng-repeat="item in newStud">
											<div class="tile-content">
												<div class="tile-icon" data-toggle="tooltip"	data-placement="top" title="{{item.id_card}} join {{item.just_reg}} days ago">
													<img ng-if="item.img_url==null"
														src="${pageContext.servletContext.contextPath }/assets/img/user.png"
														alt="" />
													<img ng-if="item.img_url!=null"
														src="${pageContext.servletContext.contextPath }/img/stud/{{item.img_url}}"
														alt="" />
												</div>
												<div class="tile-text">{{item.en_name }}</div>
											</div> <a class="btn btn-flat ink-reaction"><span class="badge" style="background-color:{{item.branch_color}}">{{item.branch_name}}</span></a>
										</li>		
										<center><h2 ng-if="newStud==''">Doesn't has any new students found!</h2></center>
										</c:if>	
										
										<c:if test="${adminsession.user_level==3 }">
										<li class="tile" ng-repeat="item in getMyStudentListAbsent">
											<div class="tile-content">
												<div class="tile-icon" data-toggle="tooltip"	data-placement="top" title="{{item.id_card}}">
													<img ng-if="item.img_url==null"
														src="${pageContext.servletContext.contextPath }/assets/img/user.png"
														alt="" />
													<img ng-if="item.img_url!=null"
														src="${pageContext.servletContext.contextPath }/img/stud/{{item.img_url}}"
														alt="" />
												</div>
												<div class="tile-text">{{item.en_name }}</div>
											</div> <a class="btn btn-flat ink-reaction" ng-if="item.is_absent=='a'">
														Absent
												   </a>
												   <a class="btn btn-flat ink-reaction" ng-if="item.is_absent=='p'">
														Permission
												   </a>
										</li>		
										<center><h2 ng-if="getMyStudentListAbsent==''">Doesn't has any absent students found!</h2></center>
										</c:if>								
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavSearch.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppVendor.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<!-- <script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>  -->
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/loader.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/underscore-min.js"></script>
	<!-- END JAVASCRIPT -->
	<script type="text/javascript">
		$("#dashboard").addClass("active");
		
<c:if test="${adminsession.user_level==2 }">		
		
		google.charts.load('current', {'packages':['corechart','bar']});
	      function drawChart() {
	        var json=${chartCol}
	       
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
	     	console.log(jsonData);
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
	    google.charts.setOnLoadCallback(drawChart);
	    $(window).resize(function(){
	    	  drawChart();
	    });
</c:if>	    
<c:if test="${adminsession.user_level==0 }">		
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'X');
      data.addColumn('number', 'Income');
	 // var json=${chartLine}
      data.addRows([[new Date(2016,06),345],[new Date(2016,07),445]]);

      var options = {
        hAxis: {
          title: 'Month'
        },
        vAxis: {
          title: 'Number of Income'
        },
        backgroundColor: '#f0f8e9'
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart'));
      chart.draw(data, options);
    }
$(window).resize(function(){
	  drawChart();
});
</c:if>	    	    
	    
	     var appExpire=angular.module("appExpire",[]);
	     appExpire.controller("ctlExpire",function($scope){
	    	 <c:if test="${adminsession.user_level==2 || adminsession.user_level==0 }">
	    	 $scope.nearlyExpired=${expiredStud};
	    	 $scope.newStud=${getallnewstu};
	    	 </c:if>
	    	 <c:if test="${adminsession.user_level==3 }">
	    	 $scope.classNStudent=${getClassNStudent};
	    	 $scope.getMyStudentListAbsent=${getMyStudentListAbsent};
	    	 </c:if>
	     });
      </script>
</body>
</html>
