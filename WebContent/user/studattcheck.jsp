
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Student Attendant Checking</title>

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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/material-design-iconic-font.min.css" />
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />

<style type="text/css">
.holiday {
	background: rgba(255, 0, 0, 0.1);
}

.today {
	background: rgba(33, 150, 243, 0.24);
}
</style>
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
					<div class="section-header">
						<ol class="breadcrumb">
							<li class="active">MY ATTENDANT CHECKING LIST</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent no-padding">
								<div
									class="card-head card-head-sm card-body style-accent no-padding">
									<header>MY ATTENDANT</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="alert alert-info" role="alert">
										<p>
											<strong class='text-danger'>ABBREVIATION </strong> <b>G</b>=Grant
											Permission, <b>P</b>=Present
										</p>
									</div>
									<form class="form">
										<div class="row">
											<div class="col-md-2">
												<div class="form-group control-width-normal">
													<div class="input-group date" id="demo-date">
														<div class="input-group-content">
															<input type="text" class="form-control" id="control-date"
																readonly>
														</div>
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span><br>
													</div>
												</div>
											</div>
										</div>
									</form>
									<div class="table-responsive">
										<table class="table table-bordered no-margin">
											<thead>
												<tr id="list-date">

												</tr>
											</thead>
											<tbody id="list-emp">

											</tbody>
										</table>
									</div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
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

	<!-- MAIN SCRIPT -->
	
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
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>

	<script type="text/javascript">
        $("#studatt").addClass("active");
        initDate();
        listStudInfo();
        function initDate(){
			$('#demo-date').datepicker({
		   	 	format: 'M/yyyy',
		   	 	minViewMode: 1,
		   	 	autoclose: true,
		   	 	startDate: new Date(2016,2,1),
		   	 	endDate:new Date()
		    }).datepicker("setDate", "0");
		}
		function callJTable(){
       	 var tab=$('#tb_list').DataTable({searchHighlight: true});
				tab.on( 'draw', function () {
		        var body = $( tab.table().body() );
		        body.unhighlight();
		        body.highlight( tab.search() );  
		    } );
	
		}
		//var people="";
		function listStudInfo(){
  			$.ajax({
  				url:"liststudattinfo.json",
  				method:"POST",
  				beforeSend: function() {
  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
  			    },
  				complete: function(){
  					$("#loading").remove();
  				},
  				success:function(people){
  					
  					getPeople(people);
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
   		 }
		
		
		
		function uniqueFilter(obj){
			var result=[];
			for(var i=0;i<obj.length;i+=2){
				if(obj[i].student_id==obj[i+1].student_id){
					if(obj[i].is_absent!='a'){
						result.push(obj[i]);
					}
					if(obj[i+1].is_absent!='a'){
						result.push(obj[i+1]);
					}
					if(obj[i].is_absent=='a' && obj[i+1].is_absent=='a'){
						result.push(obj[i]);
					}
				}
			}
			return result;
		}
		
		
    </script>
        
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/attendant.svr.js"></script>
	<script>
        $('#demo-date').datepicker().on("changeDate", function (ev) {
        	listStudInfo();
        	initCal();
        });

   </script>
</body>
</html>
