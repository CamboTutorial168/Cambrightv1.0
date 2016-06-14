
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Branch Management</title>

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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />

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
							<li class="active">BRANCH MANAGMENT</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="card card-outlined style-primary">
								<div class="card-head card-head-sm style-primary">
									<header>ENTRY FORM</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<form class="form" id="fm-branch">
										<div class="form-group floating-label">
											<input type="text" class="form-control" id="branch-name"
												minlength="3" maxlength="50" required=true> <label
												for="floatInput">BRANCH NAME</label>
											<p class="help-block">Ex: 1st</p>
										</div>
										<div class="form-group floating-label">
											<input type="text" class="form-control" id="address"
												required=true> <label for="floatInput">ADDRESS</label>
										</div>
										<div class="form-group floating-label">
											<input type="text" class="form-control" id="contact"
												minlength="3" maxlength="50" required=true> <label
												for="floatInput">CONTACT</label>
											<p class="help-block">Ex: 0XX-XXX-XXX/0XX-XXX-XXX</p>
										</div>
										<div class="form-footer">
											<div class="form-group">
												<button type="submit" id="btn-create"
													class="btn ink-reaction btn-raised btn-primary">CREATE</button>
												<button type="submit" id="btn-update"
													class="btn ink-reaction btn-raised btn-primary"
													style="display: none;">UPDATE</button>
												<button type="button" id="btn-reset"
													class="btn ink-reaction btn-raised btn-default"
													style="display: none;">RESET</button>
											</div>
										</div>
									</form>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<div class="col-md-8">
							<div class="card card-outlined style-info no-padding">
								<div
									class="card-head card-head-sm card-body style-info no-padding">
									<header>BRANCH LIST</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="branch-list"></div>
								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<!--end .col-md-8 -->
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
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<!-- <script src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery-validation/dist/additional-methods.min.js"></script>-->


	<script type="text/javascript">
         	$("#branchmgnt").addClass("active");
			tableBranch();
			
				function tableBranch(){
					$.ajax({
						url:"branchlist.json",
						dataType:"json",
						type:"POST",
						beforeSend: function() {
							$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
					    },
						complete: function(){
							$("#loading").remove();
						},success:function(data){
							$("#branch-list").html(listBranch(data));
							callJTable();
							$('[data-toggle="tooltip"]').tooltip();
							
						},
						error: function(jqXHR, exception) {
			          		catchErr(jqXHR, exception);
			            }
					});
				}
			
				function listBranch(data){
					var table="<table class='table' id='tb_list'>";
					table+="<thead>"+
								"<tr>"+
								"<th class='sort-alpha'>BRANCH</th>"+
								"<th>ADDRESS</th>"+
								"<th class='sort-alpha'>CONTACT</th>"+
								"<th>ACTION</th>"+
							"</tr>"+
						   "</thead>"+
						   "<tbody>";
					for(var i=0;i<data.length;i++){
						table+= "<tr>"+
									"<td><span class='badge style-accent'>"+data[i].branch_name+"</span></td>"+
									"<td>"+data[i].address+"</td>"+
									"<td>"+data[i].contact+"</td>"+
									"<td>";
									if(data[i].status=='f'){
										table+="<button type='button' onClick=\"checkStatus('"+data[i].branch_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger btn-status'  data-toggle='tooltip' data-placement='top' title='Disabled'><i class='fa fa-close'></i></button>";
										
									}else{
										table+="<button type='button' onClick=\"checkStatus('"+data[i].branch_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info btn-status'  data-toggle='tooltip' data-placement='top' title='Enabled'><i class='fa fa-check'></i></button>";
									}
									 
									 table+="<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i].branch_id+"','"+data[i].branch_name+"','"+data[i].address+"','"+data[i].contact+"')\" ><i class='fa fa-edit'></i></button>"+ 
									"</td>"+
								"</tr>";
					}
					table+="</tbody></table>";
					if(data==null)
						return "<span class='text-danger'>NO RECORD FOUND</span>";
					return table;
				}	
				
				function edit(branch_id,branch_name,address,contact){
					$('#btn-create').css("display","none");
					$('#btn-update').css("display","inline");
					$('#btn-reset').css("display","inline");
					$("#branch-name").val(branch_name);
					$("#branch-name").change();
					$("#address").val(address);
					$("#address").change();
					$("#contact").val(contact);
					$("#contact").change();
					$("#btn-update").val(branch_id);					
				}
				
				function callJTable(){
					$('#tb_list').DataTable();
				}
				
				function checkStatus(branch_id,status){
					
					$.ajax({
						url:"branch_status",
						type:"POST",
						data:{
							branch_id:branch_id,
							status:status
						},
						success:function(data){
							alertify.logPosition("bottom right");
							if(data=="true"){
								alertify.success("STATUS HAS BEEN CHANGED !");
								tableBranch();
							}else{
								
								swal('FAILED!','Status unable change','error');
							}
							
						}
					});      
					
				} 
							
				function branchUpdate(){
					$.ajax({
						url:"branch_update",
						type:"POST",
						data:{
							branch_id:$('#btn-update').val(),
							branch_name:$("#branch-name").val(),
							address:$("#address").val(),
							contact:$("#contact").val()
						},
						success:function(data){
								alertify.logPosition("bottom right");
							if(data=="true"){
								alertify.success("UPDATE SUCCESSFULLY !");
								reset();
								tableBranch();
							}else{
								swal('FAILED!','Unable update','error');
							}
						}
					}); 
					
				}
				
				function branchCreate(){
					$.ajax({
							url:"branch_create",
							type:"POST",
							data:{
								branch_name:$("#branch-name").val(),
								address:$("#address").val(),
								contact:$("#contact").val()
							},
							success:function(data){
									alertify.logPosition("bottom right");
								if(data=="true"){
									alertify.success("CREATE SUCCESSFULLY !");
									tableBranch();
									reset();
								}else{
									swal('FAILED!','Unable create','error');
								}
							}
					}); 
				}
				
				function reset(){
					$('#btn-update').css("display","none")
					.val("");
					$('#btn-reset').css("display","none");
					$('#btn-create').css("display","inline");
					$("#branch-name").val("");
					$("#address").val("");
					$("#contact").val("");
				}
				
				$('#btn-reset').on("click",function(){
					reset();
				});
				
				$("#fm-branch").submit(function(e){
					e.preventDefault();
					if(($('#btn-update').val())==""){
						branchCreate();
					}else{
						branchUpdate();
					}
				});
				
				
         </script>
</body>
</html>
