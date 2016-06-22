
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Employees Attendant Checking</title>

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
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />

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
		page="${pageContext.servletContext.contextPath }/../mastertop/header.jsp"></jsp:include>

	<!-- BEGIN BASE-->
	<div id="base">
		<!-- BEGIN CONTENT-->
		<div id="content">
			<section>
				<div class="section-body">
					<div class="section-header">
						<ol class="breadcrumb">
							<li class="active">EMPLOYEES ATTENDANT CHECKING LIST</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-primary no-padding">
								<div
									class="card-head card-head-sm card-body style-primary no-padding">
									<header>EMPLOYEES ATTENDANT</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="alert alert-info" role="alert">
										<p>
											<strong class='text-danger'>ABBREVIATION </strong> <b>G</b>=Grant
											Permission, <b>P</b>=Present
										</p>
										<p>
											<strong class='text-warning'>NOTE </strong> To reset check,
											please click on ID of that employee
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
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class="form-control" id="branch-list">

													</select> <label>BRANCH</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<button type="button"
														class="btn ink-reaction btn-raised btn-sm btn-primary"
														disabled id="ck-att">SUBMIT</button>
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
			page="${pageContext.servletContext.contextPath }/../masterleft/menubar.jsp"></jsp:include>
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

	<script type="text/javascript">
        $("#empatt").addClass("active");
        initDate();
        function initDate(){
			$('#demo-date').datepicker({
		   	 	format: 'M/yyyy',
		   	 	minViewMode: 1,
		   	 	autoclose: true,
		   	 	startDate: new Date(2016,2,1),
		   	 	endDate:new Date()
		    }).datepicker("setDate", "0");
		}

		
		$('#ck-att').on("click",function(){
			var attent=[];
			$("[class*='ck_']").each(function(index,obj){
				var x = $(this).val();
				
				if($(this).prop('checked')==true){
					x=x.substr(0,x.length);
					//x+=",'prog_type_id':'"+$('#list-lv').val()+"'}";
				}else{
					x=x.substr(0,x.length-16);
					x+="'is_absent':'a'}";
				}
				x=x.replace(/'/g , "\"");
				x=JSON.parse(x);
				attent.push(x);
				
			});
			submitAtt(JSON.stringify(uniqueFilter(attent)));
			
		});
		function uniqueFilter(obj){
			var result=[];
			for(var i=0;i<obj.length;i+=2){
				if(obj[i].emp_id==obj[i+1].emp_id){
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
		function submitAtt(attent){
			swal({   
	  			 title: "Confirm submition!",   
	 				 text: "Submit this attendant will not modify!",   
	 				 type: "warning",   
	 				 showCancelButton: true,   
	 				 confirmButtonColor: "#DD6B55",   
	 				 confirmButtonText: "Yes, submit it!",   
	 				 closeOnConfirm: true
	 	   		    }, function(){

	 	   			$.ajax({
	 	   				url:"attendance_emp_submit",
	 	   				method:"POST",
	 	   				data:{
	 	   					ckatt:attent
	 	   				},
		 	   			beforeSend: function() {
		 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
		 			    },
		 				complete: function(){
		 					$("#loading").remove();
		 				},
	 	   				success:function(resp){
	 	   					alertify.logPosition("bottom right");
	 	   					if(resp=="true"){
	 	   						alertify.success("SUBMIT SUCCESSFULLY !");
	 	   						listBranch();
	 	   					}else{
	 	   					swal("FAILED","Checking Attendance is not submitted","error");
	 	   					}
	 	   				},
		 				error: function(jqXHR, exception) {
		              		catchErr(jqXHR, exception);
		                }
	 	   			});  	
	 	   	});
			
		}
		
		listBranch();
        //FILTER BRANCH
        function listBranch(){
 			$.ajax({
 				url:"branchlistactive.json",
 				type:"POST",
 				beforeSend: function() {
 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
 			    },
 				complete: function(){
 					$("#loading").remove();
 				},
 				success:function(data){
 					if(data!=""){
 						$("#branch-list").html(listBranch_Supply(data));
 						$("#branch-list").change();
 					}else{
 						$("#branch-list").empty();
 					}
 				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
 			});
 		  }
        function listBranch_Supply(data){
			var list = "";
			list += "<option value="+data[0].branch_id+" selected='selected'>"
			+ data[0].branch_name + "</option>";
			for (var i = 1; i < data.length; i++) {
					list += "<option value="+data[i].branch_id+">"
							+ data[i].branch_name + "</option>";
			}
		
			return list;
        } 
        var people="";
        $("#branch-list").on("change",function(){
     		$.ajax({
     			url:"attendanceemplist.json",
     			method:"POST",
     			data:{
     			branch_id:$("#branch-list").val()	
     			},
 				beforeSend: function() {
 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
 			    },
 				complete: function(){
 					$("#loading").remove();
 				},
     			success:function(people){
     				console.log(people)
     				getPeople(people);
     			},
     			error: function(jqXHR, exception){
              		catchErr(jqXHR, exception);
                }
     		});
     	 });
        </script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/attendant.emp.svr.js"></script>
	<script>
        $('#demo-date').datepicker().on("changeDate", function (ev) {
        	listBranch();
        	initCal();
        });

        </script>
</body>
</html>
