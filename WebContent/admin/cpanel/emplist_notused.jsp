
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Employees List</title>

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
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<!-- END MAIN CSS -->
<style>
.img-thumbnail.size-3.5 {
	height: 130px;
	width: 117px;
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
							<li class="active">EMPLOYEES INFO LIST</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-primary">
								<div class="card-head card-head-sm style-primary">
									<header>LIST VIEW</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="list"></div>
									<!--end.table -->

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

		<!-- MODAL VIEW -->
		<div class="modal fade bs-example-modal-lg" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="card card-outlined style-primary"
						style="margin-bottom: 0px">
						<div class="card-head card-head-sm style-primary">
							<header>USER DETAIL</header>
							<div class="tools">
								<a
									class="btn ink-reaction btn-floating-action btn-default-light btn-xs"
									data-dismiss="modal"><i class="md md-close"></i></a>
							</div>
						</div>
						<!--end .card-head -->
						<div class="card-body">
							<div class="margin-bottom-xxl">
								<div class="pull-left width-3 clearfix hidden-xs"
									style="margin-right: 15px;">
									<img class="img-thumbnail size-3.5" id="img-pro" alt="">
								</div>
								<h2 class="text-light no-margin" id="khm-name">Philip
									Ericsson</h2>
								<h3 class="text-bold" id="position">Manager director of
									Covers. Inc.</h3>
								<div class="star-rating">
									<h4 class="text-bold" id="id-card">2012344</h4>
								</div>
							</div>
							<br>
							<!-- BEGIN FORM TABS -->
							<div class="card-head style-default">
								<ul class="nav nav-tabs tabs-text-contrast tabs-accent"
									data-toggle="tabs">
									<li class="active"><a href="#about">ABOUT</a></li>
									<li><a href="#work">WORKING INFO</a></li>
									<li><a href="#contact">CONTACT INFO</a></li>
								</ul>
							</div>
							<!--end .card-head -->
							<!-- END FORM TABS -->
							<!-- BEGIN FORM TAB PANES -->
							<form class="form" role="form">
								<div class="card-body tab-content">

									<div class="tab-pane active" id="about">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="kh-name" readonly=""> <label for="readonly6">Khmer
														Name</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="en-name" readonly=""> <label for="readonly6">English
														Name</label>
												</div>
											</div>
										</div>
										<!--end .row -->
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="gender" readonly=""> <label for="readonly6">Gender</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="dob" readonly=""> <label for="readonly6">DOB</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="nationality" readonly=""> <label
														for="readonly6">Nationality</label>
												</div>
											</div>
										</div>
										<!--end .row -->
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="nation-id" readonly=""> <label for="readonly6">National
														ID</label>
												</div>
											</div>

										</div>
										<!--end .row -->
									</div>
									<!--end .tab-pane -->

									<div class="tab-pane " id="work">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="reg-date" readonly=""> <label for="reg-date">Register
														Date</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="mod-date" readonly=""> <label for="mod-date">Modify
														Date</label>
												</div>
											</div>
										</div>
										<!--end .row -->
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="branch" readonly=""> <label for="branch">Branch</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group floating-label">
													<input type="text" class="form-control static dirty"
														id="user-level" readonly=""> <label
														for="user-level">User Level</label>
												</div>
											</div>
										</div>
										<!--end .row -->
									</div>
									<!--end .tab-pane -->

									<div class="tab-pane" id="contact">
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group floating-label">
														<input type="text" class="form-control static dirty"
															id="phone" readonly=""> <label for="phone">Phone
															Number</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group floating-label">
														<input type="text" class="form-control static dirty"
															id="email" readonly=""> <label for="email">Email</label>
													</div>
												</div>
											</div>
											<!--end .row -->
										</div>
										<!--end .form-group -->
									</div>
									<!--end .tab-pane -->

								</div>
								<!--end .card-body.tab-content -->
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--END MODAL VIEW -->


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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppVendor.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<!-- END MAIN SCRIPT  -->

	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
         $("#emplist").addClass("active");
         
         getEmpList();
         function getEmpList(){
        	 $.ajax({
        		url:"emplist.json",
        		dataType:"json",
        		method:"POST",
        		beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
        		success:function(data){
        			$("#list").html(getEmpListSupply(data));
        			callJTable();
        			$('[data-toggle="tooltip"]').tooltip();
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         function getEmpListSupply(data){
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID</th>"+
								"<th class='sort-alpha'>FULL NAME</th>"+
								"<th>GENDER</th>"+
								"<th class='sort-alpha'>NATIONALITY</th>"+
								"<th class='sort-numeric'>POSITION</th>"+
								"<th class='sort-numeric'>PHONE</th>"+
								"<th class='sort-numeric'>EMAIL</th>"+
								"<th>ACTION</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
				for(var i=0;i<data.length;i++){
					table+= "<tr>"+
								"<td>"+data[i]['id_card']+"</td>"+
								"<td>"+data[i]['eng_name']+"</td>"+
								"<td>"+data[i]['gender']+"</td>"+
								"<td>"+data[i]['nationality']+"</td>"+
								"<td><span class='badge style-accent-light'>"+data[i]['position']+"</span></td>"+
								"<td>"+data[i]['phone']+"</td>"+
								"<td>"+data[i]['email']+"</td>"+
								"<td>";
								 if(data[i]['status']=='t'){
									table+= "<button type='button' onClick=\"checkStatus('"+data[i].emp_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-check'></i></button>";
								 }else{
									 table+= "<button type='button' onClick=\"checkStatus('"+data[i].emp_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-close'></i></button>";
								 }
								 table+="<span data-toggle='modal'onClick=\"view('"+data[i].id_card+"','"+data[i].eng_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].nationality+"','"+data[i].national_id+"','"+data[i].img_url+"','"+data[i].hire_date+"','"+data[i].mod_date+"','"+data[i].status+"','"+data[i].phone+"','"+data[i].email+"','"+data[i].branch_name+"','"+data[i].position+"','"+data[i].user_type+"')\" data-target='.bs-example-modal-lg' data-backdrop='static' data-keyboard='false'><button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-default-dark' data-toggle='tooltip'  data-placement='top' title='View Detail'><i class='md md-remove-red-eye'></i></button></span>"+
								 "<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>"+
								"</td>"+
							"</tr>";
				}
				table+="</tbody></table>";
				if(data==null)
					return "<span class='text-danger'>NO RECORD FOUND</span>";
				return table;
         }
         
         function checkStatus(id,status){
 			$.ajax({
 				url:"emp_status",
 				type:"POST",
 				data:{
 					emp_id:id,
 					status:status
 				},
 				success:function(data){
 					alertify.logPosition("bottom right");
 					if(data=="true"){
 						alertify.success("STATUS HAS BEEN CHANGED !");
 						getEmpList();
 					}else{
 						
 						swal('FAILED','Status unable change!','error');
 					}
 					
 				},
               	error: function(jqXHR, exception) {
               		catchErr(jqXHR, exception);
                 }
 			}); 
 		 }
         
         function callJTable(){
				$('#tb_list').DataTable();
		 }
         
         function view(id_card,en_name,kh_name,gender,dob,nationality,nation_id,img_url,
        		 hire_date,mod_date,status,phone,email,branch_name,position,user_type){
        	 var sex;
        	 (gender=='F')? sex="Female":sex="Male";
        	 $("h4.text-bold").text(id_card);
        	 $("#kh-name").val(kh_name);
        	 $('#img-pro').attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/"+img_url+"");
        	 $("#khm-name").text(kh_name);
        	 $("#en-name").val(en_name);
        	 $("#gender").val(sex);
        	 $("#dob").val(dob);
        	 $("#nationality").val(nationality);
        	 $("#nation-id").val(nation_id);
        	 $("#").val();
        	 $("#reg-date").val(hire_date);
        	 $("#mod-date").val(mod_date);
        	 $("#status").val(status);
        	 $("#phone").val(phone);
        	 $("#email").val(email);
        	 $("#branch").val(branch_name);
        	 $("#position").text(position);
        	 $("#user-level").val(user_type);
         }
         
         
         </script>
</body>
</html>
