
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Student Score Management</title>

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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">

<style type="text/css">
.holiday {
	background: rgba(255, 0, 0, 0.1);
}

.today {
	background: rgba(33, 150, 243, 0.24);
}
</style>
</head>
<body class="menubar-hoverable header-fixed " ng-app="myApp"
	ng-controller="myCtl">
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
							<li class="active">STUDENTS SCORE LIST</li>
						</ol>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent no-padding">
								<div
									class="card-head card-head-sm card-body style-accent no-padding">
									<header>STUDENTS SCORE</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="alert alert-info" role="alert">
										<strong class='text-danger'>ABBREVIATION</strong> <b>VO</b>=Vocabulary,
										<b>GR</b>=Grammar, <b>RE</b>=Reading, <b>WR</b>=Writing, <b>LI</b>=Listening,
										<b>SP</b>=Speaking, <b>PA</b>=Painting, <b>MA</b>=Math, <b>CL</b>=Class
										participation
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
													<select class="form-control" id="list-class"
														ng-click="listFunction()">

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
									<div class="table-responsive" id="list-emp"></div>
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

	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
        $("#score").addClass("active");
       /*  app=angular.module("myApp",[]);
		
		app.controller('myCtl',function ($scope,$http){
		
			$scope.listFunction=function(){
				$http({
					url:"list_table_period.json",
					method:"POST",
					params:{
	   					period:ampm,
	   					prog_t_id:$("#list-lv").val(),
	   					class_id:$("#list-class").val()
	   				}
				}).then(function (response){
					console.log(response);
					$scope.list=response.data;
				});
			}
		}); */
		
        initDate();
        function callJTable(){
 			$('#tb_list').DataTable();
 			$('[data-toggle="tooltip"]').tooltip();
 		}
        
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
				x=x.substr(0,x.length-1);
				if($(this).prop('checked')==true){
					x+=",'prog_type_id':'"+$('#list-lv').val()+"','is_absent':'f'}";
				}else{
					x+=",'prog_type_id':'"+$('#list-lv').val()+"','is_absent':'t'}";
				}
				attent.push(x);
			});
			if(attent.toString!=null)
			submitAtt(attent.toString());
		});
		
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
	 	   				url:"",
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
	 	   						swal("FALIED","Unable to submit!","error");
	 	   					}
	 	   				},
		 				error: function(jqXHR, exception) {
		              		catchErr(jqXHR, exception);
		                }
	 	   			});  	
	 	   	});
			
		}
<c:choose>	
	<c:when test="${adminsession.user_level!=3}">
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
       
     </c:when>
     <c:otherwise>
     	listLevel();
     </c:otherwise>
</c:choose>      

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
			function listLv_Supply(data){
  		
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<option value="+data[i].prog_type_id+">"+data[i].level+"</option>";
				}
				jsonprog=data;
				return list;
			}
        
			
			function listClass(){
				var prog_id1=jsonprog[0].prog_id;
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
		   					$("#list-emp").html(listStudInfoSupply(people));
		   				 	callJTable();
		   				},
		   				error: function(jqXHR, exception) {
		   	          		catchErr(jqXHR, exception);
		   	            }
		   			});
	   			}
	   			
	   		 } 
			function listStudInfoSupply(data){
				console.log(data);
	        	 var table="<table class='table' id='tb_list'>";
		 			table+="<thead>"+
		 					"<tr>"+
		 						"<th class='sort-alpha' style='width:10%'>Name</th>"+
		 						"<th class='sort-alpha' style='width:10%'>Name</th>"+
		 						"<th class='sort-alpha'>VO</th>"+
		 						"<th class='sort-numberic'>GR</th>"+
		 						"<th class='sort-numberic'>RE</th>"+
		 						"<th class='sort-numberic'>WR</th>"+
		 						"<th class='sort-numberic'>LI</th>"+
		 						"<th class='sort-numberic'>SP</th>"+
		 						"<th class='sort-numberic'>PA</th>"+
		 						"<th class='sort-numberic'>MA</th>"+
		 						"<th class='sort-numberic'>CL</th>"+
		 						"<th>ACTION</th>"+
		 					"</tr>"+
		 				   "</thead>"+
		 				   "<tbody>";
		 			for(var i=0;i<data.length;i++){
		 				table+= "<tr>"+
		 							"<td>"+data[i].id_card+"</td>"+
		 							"<td>"+data[i].en_name+"</td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0' disabled></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0' disabled></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0' disabled></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0' disabled></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0' disabled></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0'></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0'></td>"+
		 							"<td><input type='number' min='0' max='10' class='form-control' required value='0'></td>"+
		 							"<td><input type='number' min='0' max='5' class='form-control' required value='0'></td>"+
		 							"<td style='width:8%'>"+
		 							"<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i].position_id+"','"+data[i].position+"','"+data[i].salary+"')\" ><i class='md md-mode-edit'></i></button>"+
		 							"<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-info' data-toggle='tooltip' data-placement='top' title='Save' onClick=\"edit('"+data[i].position_id+"','"+data[i].position+"','"+data[i].salary+"')\" ><i class='md md-save'></i></button>"+
		 							"</td>"+
		 						"</tr>";
		 			}
		 			table+="</tbody></table>";
		 			if(data==null)
		 				return "<span class='text-danger'>NO RECORD FOUND</span>";
		 			return table;
	         }
        </script>

	<script>
        $('#demo-date').datepicker().on("changeDate", function (ev) {
        	listStudInfo();        
        });

        </script>
</body>
</html>
