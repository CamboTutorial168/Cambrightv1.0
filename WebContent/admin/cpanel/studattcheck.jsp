
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
							<li class="active">STUDENTS ATTENDANT CHECKING LIST</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent no-padding">
								<div
									class="card-head card-head-sm card-body style-accent no-padding">
									<header>STUDENTS ATTENDANT</header>
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
											please click on ID of that student
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
											<c:if test="${adminsession.user_level!=3}">
												<div class="col-md-2">
													<div class="form-group floating-label">
														<select class="form-control" id="branch-list">

														</select> <label>BRANCH</label>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group floating-label">
														<select class="form-control" id="list-main-prog">

														</select> <label>PROGRAM TYPE</label>
													</div>
												</div>
											</c:if>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class="form-control" id="list-lv">

													</select> <label>LEVEL</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<select class="form-control" id="list-class">
														<option></option>
													</select> <label>CLASS</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<select class="form-control" id="ampm">
														<option value="am">AM</option>
														<option value="pm">PM</option>
													</select> <label>PERIOD</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<button type="button"
														class="btn ink-reaction btn-raised btn-sm btn-accent"
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
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>

	<script type="text/javascript">
        $("#studatt").addClass("active");
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
					x=x.substr(0,x.length-1);
					x+=",'prog_type_id':'"+$('#list-lv').val()+"'}";
				}else{
					x=x.substr(0,x.length-16);
					x+="'prog_type_id':'"+$('#list-lv').val()+"','is_absent':'a'}";
				}
				x=x.replace(/'/g , "\"");
				x=JSON.parse(x);
				attent.push(x);
			});
			
			submitAtt(JSON.stringify(uniqueFilter(attent)));
			//console.log(JSON.stringify(uniqueFilter(attent)))
		});
		
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
	 	   				url:"submit_stud_att",
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
	 	   						listStudInfo();
		 	   				}else{
		 	   					swal("FAILED",'' + resp+"","error");
		 	   				}
	 	   				},
		 				error: function(jqXHR, exception) {
		              		catchErr(jqXHR, exception);
		                }
	 	   			});  	
	 	   	});
			
		}
<c:if test="${adminsession.user_level!=3}">	

		listBranch();
        //FILTER BRANCH
        function listBranch(){
 			$.ajax({
 				url:"branchlistactive.json",
 				type:"POST",
 				data:{
 					flag:"emp"
 				},
 				beforeSend: function() {
 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
 			    },
 				complete: function(){
 					$("#loading").remove();
 				},
 				success:function(data){
 					if(data!="")
 					$("#branch-list").html(listBranch_Supply(data))
 					.change();
 					else
 						$("#branch-list").empty();
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
        
        $("#branch-list").on("change",function(){
     		$.ajax({
     			url:"list_main_pro_aft_branch.json",
     			dataType:"json",
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
     			success:function(data){
     				if(data!=undefined)
	       				$("#list-main-prog").html(listMainProg_Supply(data))
	       				.change();
     				else
     					$("#list-main-prog").empty().change();
     			},
     			error: function(jqXHR, exception){
              		catchErr(jqXHR, exception);
              }
     		});
     	 });
        
       function listMainProg_Supply(data){
			var list="";
			
			for(var i=0;i<data.length;i++){
				list +="<option value="+data[i].progid+">"+data[i].progtype+"</option>";
			}
			return list;
		}
       
       $("#list-main-prog").on("change",function(){
			listLevel();
	   });
       
</c:if>

<c:if test="${adminsession.user_level==3}">
 listLevel();
</c:if>
        function listLevel(){
        	
				$.ajax({
					
					<c:choose>
			    		<c:when test="${adminsession.user_level!=3}">
			    			url:"stud_list_level_af_prog_main.json",
			    		</c:when>
			    		<c:otherwise>
			    			url:"attlvllistteachby.json",
			    		</c:otherwise>
			    	</c:choose>
					
					dataType:"json",
					method:"POST",
					data:{
						branch_id:$("#branch-list").val(),
						prog_id:$("#list-main-prog").val(),
						action:"studying"
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						console.log(data);
						if(data!=""){
							$("#list-lv").html(listLv_Supply(data))
							.change();
						}else{
							$("#list-lv").empty().change();
						}
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
  			var prog_id;
  			var jsonprog;
			function listLv_Supply(data){
  		
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<option value="+data[i].prog_type_id+">"+data[i].level+"</option>";
				}
				jsonprog=data;
				return list;
			}
        
			function listClass(){
				var prog_id1;
				if(jsonprog!=null){
					prog_id1=jsonprog[0].prog_id;
				}
				$.ajax({
					url:"list_class_aft_lvl.json",
					//dataType:"json",
					method:"POST",
					data:{
						branch_id:$("#branch-list").val(),
						<c:choose>
							<c:when test="${adminsession.user_level!=3}">
								prog_id:$("#list-main-prog").val(),
							</c:when>
							<c:otherwise>
								prog_id:prog_id1,
							</c:otherwise>
						</c:choose>
						lvl:$("#list-lv").val(),
						action:"studying"
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						if(data!="error"){
							$("#list-class").html(listClass_Supply(data)).change();
							
						}else{
							$("#list-class").empty().change();
							
						}
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
  	
			function listClass_Supply(data){
  		
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<option value="+data[i].class_id+">"+data[i].class_number+"</option>";
				}
				
				return list;
			}
			function period(){
				$("#ampm").html();
			}
			
			$("#list-lv").on("change",function(){
				listClass();
			});
			var ampm="am";
			$("#ampm").on("change",function(){
				ampm=$(this).val();
				if(($("#list-lv").val())!=null && ($("#list-class").val())!=null){
					listStudInfo();	
				}else{
					swal("FAILED","Select level or class..!","error");
				}
				
			});
			
			$("#list-class").on("change",function(){
				listStudInfo();	
			});
			var people="";

			function listStudInfo(){
				
	   			if($("#list-lv").val()!=null &&$("#list-class").val()!=null){
		        	 $.ajax({
		   				url:"list_table_period.json",
		   				dataType:"json",
		   				method:"POST",
		   				beforeSend: function() {
		   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
		   			    },
		   				complete: function(){
		   					$("#loading").remove();
		   				},
		   				data:{
		   					period:ampm,
		   					prog_t_id:$("#list-lv").val(),
		   					class_id:$("#list-class").val()
		   				},
		   				success:function(people){
		   					getPeople(people);
		   				},
		   				error: function(jqXHR, exception) {
		   	          		catchErr(jqXHR, exception);
		   	            }
		   	           
		   				
		   			});
	   			}
	   			
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
