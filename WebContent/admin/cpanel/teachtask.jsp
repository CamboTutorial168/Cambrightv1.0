
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Employees Register</title>

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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
<!-- END STYLESHEETS -->

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
							<li class="active">TASK</li>
						</ol>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-outlined style-primary">
								<div class="card-head card-head-sm style-primary">
									<header>ENTRY FORM</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<form class="form" id="fm-level">
										<div class="form-group floating-label">
											<select id="listbranch" class="form-control">
												
											</select><label for="listbranch">BRANCH</label>
										</div>
										<div class="form-group floating-label" id="emp-list">
											
										</div>
										<div class="form-group floating-label" id="level-list">
											
										</div>
										<div class="form-footer">
											<div class="form-group">
												<button type="submit" id="btn-create"
													class="btn ink-reaction btn-raised btn-primary" disabled>ASSIGN
													NOW</button>
												<button type="button" id="btn-reset"
													class="btn ink-reaction btn-raised btn-default"
													style="display: none;">RESET</button>
											</div>
										</div>
									</form>
								</div>
								<!--end .card-body -->
							</div>
						</div>
						<div class="col-md-9">
							<div class="card card-outlined style-primary no-padding">
								<div
									class="card-head card-head-sm card-body style-primary no-padding">
									<header>TEACHING LEVEL</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="list"></div>
								</div>
								<!--end .card-body -->
							</div>
						</div>
					</div>
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
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>	
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
         $("#teachtask").addClass("active");
         
         //Load in form
         listBranch();
         
        $("#listbranch").on("change",function(){
        	if($("#listbranch")!=""){
					getEmpList();
			        listSubProg();
			}else{
				alert("SELECT BRANCH FRIST!");
			}
        });
        getListTeaching();
        
 		function listBranch() {
 			$.ajax({
 				url : "branchlistactive.json",
 				dataType:"json",
 				type : "POST",
 				success : function(data) {
 					$("#listbranch").html(listBranch_Supply(data)).change();
 				},
 				error: function(jqXHR, exception) {
 	          		catchErr(jqXHR, exception);
 	            }
 			});
 		}
 		function listBranch_Supply(data) {
 			var list = "";
 			
 			for (var i = 0; i < data.length; i++) {
 				list += "<option value="+data[i].branch_id+">"
 						+ data[i].branch_name + "</option>";
 			}
 			return list;
 		}
         function getEmpList(){
        	 $.ajax({
        		url:"emplistactivebranch.json",
        		dataType:"json",
        		method:"POST",
        		data:{
        			branch_id:$("#listbranch").val()
        		},
        		beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
        		success:function(data){
        			
        			$("#emp-list").html(getEmpListSupply(data));
        			$(".select2-list").select2();
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         function getEmpListSupply(data){
        	var list = "";
 			list += "<select class='form-control select2-list' data-placeholder='SELECT EMPLOYEE'  id='select-emp' required>";
 			for (var i = 0; i < data.length; i++) {
 				
 				list += "<option value="+data[i].emp_id+">"
 						+ data[i].eng_name +" ["+ data[i].position+"]"+"</option>";
 				
 			}
 			list += "</select>";
 			return list;
         }
         
         function listSubProg(){
 			$.ajax({
 				url:"subproglistbranch.json",
 				dataType:"json",
 				method:"POST",
 				data:{
 					branch_id:$("#listbranch").val()
        		},
 				beforeSend: function() {
 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
 			    },
 				complete: function(){
 					$("#loading").remove();
 				},
 				success:function(data){
 					
 					$("#level-list").html(subProgList_Supply(data));
 					$(".select2-list").select2();
 				},
 				error: function(jqXHR, exception) {
 	          		catchErr(jqXHR, exception);
 	            }
 			});
 		 }
         function subProgList_Supply(data){
        	 var list = "";
  			list += "<select class='form-control select2-list' data-placeholder='SELECT SUB-PROGRAM'  id='select-subprog' required>";
  			for (var i = 0; i < data.length; i++) {
  			
  				list += "<option value="+data[i].subprog_id+">"
  						+ data[i].subprog_title + "</option>";
  				
  			}
  			
  			list += "</select>";
  			return list;
         }
       //LIST TABLE
         function getListTeaching(){
        	 $.ajax({
        		url:"teachinglist.json",
        		method:"POST",
        		beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
        		success:function(data){
        			console.log(data);
        			$("#list").html(getListTeachingSupply(data));
        			callJTable();
        			$('[data-toggle="tooltip"]').tooltip();
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         
         function getListTeachingSupply(data){
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID</th>"+
								"<th class='sort-alpha'>NAME</th>"+
								"<th>PROGRAM</th>"+
								"<th class='sort-alpha'>BRANCH</th>"+
								"<th>ACTION</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
				for(var i=0;i<data.length;i++){
					table+= "<tr>"+
								"<td>"+data[i]['id_card']+"</td>"+
								"<td>"+data[i]['eng_name']+"</td>"+
								"<td>"+data[i]['sub_prog_title']+"</td>"+
								"<td><span class='badge style-accent-bright'>"+data[i]['branch_name']+"</span></td>"+
								"<td>";
								 table+="<button type='button' onClick=\"edit('"+data[i].id_card+"','"+data[i].eng_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].nationality+"','"+data[i].national_id+"','"+data[i].img_url+"','"+data[i].phone+"','"+data[i].branch_id+"','"+data[i].pos_id+"','"+data[i].user_id+"','"+data[i].email+"','"+data[i].pwd+"','"+data[i].emp_id+"')\" class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>"+
								 "<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Delete' onClick=\"isDelete('"+data[i].emp_id+"')\" ><i class='fa fa-trash'></i></button>"+
								"</td>"+
							"</tr>";
				}
				table+="</tbody></table>";
				if(data==null)
					return "<span class='text-danger'>NO RECORD FOUND</span>";
				return table;
         }
         function callJTable(){
				$('#tb_list').DataTable();
		 }
         $("#fm-level").submit(function(e){
 			e.preventDefault();
 			if(($('#btn-create').val())!=""){
 				assignTask();
 			}
 		});
         
         
         </script>
</body>
</html>
