
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- @author Kong Sovary -->
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Students Register</title>

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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css?1424887858" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<style type="text/css">
.fileUpload {
	position: relative;
	overflow: hidden;
	margin: 10px;
}

.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

img.preview {
	width: 150px;
	height: 200px;
}

#screenshot {
	position: absolute;
	box-shadow: 0px 0px 7px #4D5764;
	padding: 5px;
	display: none;
	color: #fff;
}

table.dataTable span.highlight {
	background-color: #FFFF88;
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
							<li class="active">STUDENT ENROLLMENT</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent-dark card-collapsed">
								<div class="card-head card-head-sm style-accent-dark">
									<header>REGISTER FORM</header>
									<div class="tools">
										<div class="btn-group">
											<a class="btn btn-icon-toggle btn-collapse"><i
												class="fa fa-angle-down"></i></a>
										</div>
									</div>
								</div>
								<!--end .card-head -->
								<div class="card-body" style="display: none;">
									<form class="form floating-label" role="form" id="fm-user">
										<div class="row">
											<div class="col-md-offset-8"></div>
											<div class="col-md-4">
												<img class="img-thumbnail" id="image"
													src="${pageContext.servletContext.contextPath }/assets/img/user.png"
													height="210px" width="160px"> <a
													class="btn btn-icon-toggle ink-reaction btn-default fileUpload "
													id="uploadButton"> <input type="hidden" id="update-img">
													<input type="file" onchange="readURL(this);" id="file"
													accept="image" class="upload" /> <i
													class="md md-camera-alt"></i>
												</a>
												<!-- <label class="checkbox-inline checkbox-styled checkbox-accent">
														<input type="checkbox" value="" id="change-time"><span>Change Time/month</span>
													</label> -->
											</div>
										</div>

										<div class="row">
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="id-card"
														required> <label for="id-card">*ID CARD</label>
													<p class="help-block">Ex: CB13556</p>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="kh-name"
														required> <label for="kh-name">*KHMER
														NAME</label>
													<p class="help-block">Ex: គង់ ដារ៉ាវិចិត្រ</p>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="en-name"
														required> <label for="en-name">*ENGLISH
														NAME</label>
													<p class="help-block">Ex: Kong Daravichet</p>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select id="sex" class="form-control" required>
														<option value="M">Male</option>
														<option value="F">Female</option>
													</select> <label for="sex">*GENDER</label>
												</div>
											</div>

										</div>
										<!--end .row  -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group floating-label">
													<div class="input-group date" id="pickerDOB">
														<div class="input-group-content">
															<input type="text" class="form-control" id="dob"
																name="dob" required> <label>*DATE OF
																BIRTH</label>
														</div>
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="fa-name"
														required> <label for="fa-name">FATHER
														NAME</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="ma-name"
														required> <label for="ma-name">MOTHER
														NAME</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="phone" required>
													<label for="phone">PHONE NUMBER</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="password" class="form-control" id="password"
														required> <label for="password">PASSWORD</label>
												</div>

											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select name="branch" id="branch-list" class="form-control"
														required>

													</select> <label for="branch">BRANCH</label>
												</div>

											</div>

										</div>
										<!--end .row -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group floating-label">
													<textarea name="textarea2" id="address"
														class="form-control" rows="3" placeholder=""></textarea>
													<label for="address">ADDRESS</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<select id="list-main-prog" class="form-control" required>
														<option value="term">1 Term</option>

													</select> <label for="payment-type">PROGRAM TYPE</label>
												</div>
											</div>

											<div class="col-md-2">
												<div class="form-group floating-label">
													<select name="level" id="list-lv" class="form-control"
														required>

													</select> <label for="list-lv">LEVEL</label>
												</div>
											</div>
											<div class="col-md-1">

												<div class="form-group floating-label">
													<select name="level" id="ampm" class="form-control"
														required>
														<option value="AM" selected>AM</option>
														<option value="PM">PM</option>
													</select> <label for="list-lv">PERIOD</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select id="payment-type" class="form-control" required>
														<option value="term">1 Term</option>
														<option value="sem">1 Semester</option>
														<option value="year">1 Year</option>
													</select> <label for="payment-type">PAYMENT TYPE</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<input type="number" class="form-control" id="discount"
														min="0" value="0" max="100" required> <label
														for="discount">DIS %</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<input type="number" class="form-control" id="total-fee"
														disabled readonly> <label for="total-fee">TOTAL</label>
												</div>
											</div>
										</div>
										<div class="form-footer">
											<div class="row">
												<div class="col-sm-2 offset-col-sm-10">
													<button type="submit" id="btn-create"
														class="btn ink-reaction btn-raised btn-accent-dark">CREATE
														NOW</button>
													<button type="submit" id="btn-update"
														class="btn ink-reaction btn-raised btn-accent-dark"
														style="display: none;">UPDATE</button>
													<button type="button" id="btn-reset"
														class="btn ink-reaction btn-raised btn-default"
														style="display: none;">RESET</button>
												</div>
											</div>
										</div>
									</form>

								</div>
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
					</div>
					<!--end .row -->
					<!-- LIST -->
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent-dark">
								<div class="card-head card-head-sm style-accent-dark">
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
					<!-- MODAL VIEW -->
					<div class="modal fade bs-example-modal-md" tabindex="-1"
						role="dialog">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								<div class="card card-outlined style-accent-dark"
									style="margin-bottom: 0px">
									<div class="card-head card-head-sm style-accent-dark">
										<header>STUDENT DETAIL</header>
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
											<h3 class="text-bold" id="eng-view">Manager director of
												Covers. Inc.</h3>
											<div class="star-rating">
												<h4 class="text-bold" id="id-card">2012344</h4>
											</div>
										</div>
										<br>
										<!-- BEGIN FORM TABS -->
										<div class="card-head card-head-xs style-accent-bright">
											<ul class="nav nav-tabs tabs-text-contrast tabs-accent"
												data-toggle="tabs">
												<li class="active"><a href="#about">ABOUT</a></li>
												<li><a href="#study">STUDYING INFO</a></li>
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
																	id="kh-name-view" readonly=""> <label for="">Khmer
																	Name</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="en-name-view" readonly=""> <label for="">English
																	Name</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="gender" readonly=""> <label for="">Gender</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="dob-view" readonly=""> <label for="">DOB</label>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="fa-name-view" readonly=""> <label
																	for="readonly6">FATHER NAME</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="ma-name-view" readonly=""> <label
																	for="readonly6">MOTHER NAME</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="addr-view" readonly=""> <label
																	for="readonly6">ADDRESS</label>
															</div>
														</div>

													</div>
													<!--end .row -->
												</div>
												<!--end .tab-pane -->

												<div class="tab-pane " id="study">
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="reg-date-view" readonly=""> <label
																	for="reg-date">Register Date</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="mod-date-view" readonly=""> <label
																	for="mod-date">Modify Date</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="level-view" readonly=""> <label
																	for="branch">LEVEL</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="class-view" readonly=""> <label
																	for="user-level">CLASS</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="branch-view" readonly=""> <label
																	for="branch">Branch</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="reg-by-view" readonly=""> <label
																	for="user-level">REGISTED BY</label>
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
																		id="phone-view" readonly=""> <label
																		for="phone">Phone Number</label>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-sm-6">
																<div class="form-group floating-label">
																	<input type="text" class="form-control static dirty"
																		id="email-view" readonly=""> <label
																		for="email">Email</label>
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppVendor.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppCard.js"></script>
	<!-- END MAIN SCRIPT  -->
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/preview.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/jquery.highlight.js"></script>
	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
          $("#studentreg").addClass("active");
          $('#pickerDOB').datepicker({
         	 format: 'yyyy/mm/dd',
          });
          listBranch();
          listStudInfo();
          var image_name;
          function readURL(input) {
         	 
      	    var file=$("input[type=file]")[0].files[0];
	  			var space=file.size/1048576;
	  			
	  			if(space>0.5){
	  				swal('FAILED!','Maximum size upload image must be less than 500KB','error');
	  				//swal("Failed","Image file is more than 300KB","error");
	  				$("input[type=file]").val("");
	  			}else{
	  				
	  				$("#update-img").val("");
	  				uploadEmpImage();
	  				if (input.files && input.files[0]) {
	                    var reader = new FileReader();

	                    reader.onload = function (e) {
	                        $('#image')
	                            .attr('src', e.target.result)
	                            .width(160)
	                            .height(210);
	                    };

	                    reader.readAsDataURL(input.files[0]);
	                    
	                   
	                }
	  			}
            
          }
          function uploadEmpImage(){
	  			var data1="";
	  			data1=new FormData();
	  			data1.append("file",$("input[type=file]")[0].files[0]);
	  			
	  			$.ajax({
	  				url:"upload_img_stud",
	  				type:"POST",
	  				cache : false,
	  				contentType : false,
	  				processData : false,
	  				async: false,
	  				data : data1,
	  				beforeSend:function(){
	  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	  				},
	  				complete: function(){
	  					$("#loading").remove();
	  				},
	  				success : function(data) {
	  					image_name=data;
	  					swal('SUCCESS!','You have uploaded image','success');
	  				}
	  			});
	  		}
	        
          $("#branch-list").on("change",function(){
       		$.ajax({
       			url:"list_main_pro_aft_branch.json",
       			dataType:"json",
       			method:"POST",
       			data:{
       			branch_id:$("#branch-list").val()	
       			},
       			success:function(data){
       				$("#list-main-prog").html(listMainProg_Supply(data));
       				$("#list-main-prog").change();
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
          
          function listBranch(){
  			$.ajax({
  				url:"branchlist.json",
  				dataType:"json",
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
  					$("#branch-list").html(listBranch_Supply(data))
  					.change();
  					 
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
          var typetime="";
          $("#list-main-prog").on("change",function(data){
        	  typetime= $("#ampm").val();
				if($("#list-main-prog").val()!=""){
					listLevel();    
  				}
							
  		 }); 
		
		 function listLevel(){
			 if($("#branch-list").val() !=null && $("#list-main-prog").val()!=null)
				$.ajax({
 				url:"stud_list_level_af_prog_main.json",
 				dataType:"json",
 				method:"POST",
 				data:{
 					branch_id:$("#branch-list").val(),
 					prog_id:$("#list-main-prog").val(),
 					//time:typetime,
 					action:"reg"
 				},
 				beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
 				success:function(data){
 					$("#list-lv").html(listLv_Supply(data));
 					$("#list-lv").change();
 				},
 				error: function(jqXHR, exception) {
 	          		catchErr(jqXHR, exception);
 	            }
 			});
			}
      	
			function listLv_Supply(data){
      		
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<option value="+data[i].prog_type_id+">"+data[i].level+"</option>";
				}
				
				return list;
			}
			
           function listStudInfo(){
  			$.ajax({
  				url:"liststudinfo.json",
  				dataType:"json",
  				method:"POST",
  				beforeSend: function() {
  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
  			    },
  				complete: function(){
  					$("#loading").remove();
  				},
  				success:function(data){
  					$("#list").html(listStudInfo_Supply(data));
  					callJTable();
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
  		 }
           
         function listStudInfo_Supply(data){
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID</th>"+
								"<th class='sort-alpha'>KHMER NAME</th>"+
								"<th class='sort-alpha'>ENG NAME</th>"+
								"<th>GENDER</th>"+
								"<th>DOB</th>"+
								"<th>ACTION</th>"+
								"<th class='hidden'></th>"+
								"<th class='hidden'></th>"+
								"<th class='hidden'></th>"+
								"<th class='hidden'></th>"+
								"<th class='hidden'></th>"+
								
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
					   for(var i=0;i<data.length;i++){
						   
							table+= "<tr>"+
										"<td>"+data[i]['id_card']+"</td>"+
										"<td>"+data[i]['kh_name']+"</td>"+
										"<td>"+data[i]['en_name']+"</td>"+
										"<td>"+data[i]['gender']+"</td>"+
										"<td>"+data[i]['dob']+"</td>"+
										"<td class='hidden'>"+data[i]['phone']+"</td>"+
										"<td class='hidden'>"+data[i]['fa_name']+"</td>"+
										"<td class='hidden'>"+data[i]['ma_name']+"</td>"+
										"<td class='hidden'>"+data[i]['addr']+"</td>"+
										"<td class='hidden'>"+data[i]['branch_name']+"</td>"+

										"<td>";
										 if(data[i]['status']=='t'){
											table+= "<button type='button' onClick=\"checkStatus('"+data[i].student_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-check'></i></button>";
										 }else{
											 table+= "<button type='button' onClick=\"checkStatus('"+data[i].student_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-close'></i></button>";
										 }
										 table+="<span data-toggle='modal' onClick=\"view('"+data[i].id_card+"','"+data[i].en_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].fa_name+"','"+data[i].ma_name+"','"+data[i].addr+"','"+data[i].img_url+"','"+data[i].reg_date+"','"+data[i].mod_date+"','"+data[i].status+"','"+data[i].phone+"','"+data[i].branch_name+"','"+data[i].reg_by+"','"+data[i].cla_num+"','"+data[i].level+"','"+data[i].teach_by+"')\" data-target='.bs-example-modal-md' data-backdrop='static' data-keyboard='false'><button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-default-dark' data-toggle='tooltip'  data-placement='top' title='View Detail'><a class='screenshot' rel='${pageContext.servletContext.contextPath }/admin/cpanel/img/stud/"+data[i].img_url+"'><i class='md md-remove-red-eye'></i></a></button></span>"+
										 "<button type='button' onClick=\"edit('"+data[i].id_card+"','"+data[i].en_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].fa_name+"','"+data[i].ma_name+"','"+data[i].addr+"','"+data[i].img_url+"','"+data[i].phone+"','"+data[i].password+"','"+data[i].student_id+"')\" class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>"+
										 "<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Delete' onClick=\"isDelete('"+data[i].student_id+"')\" ><i class='fa fa-trash'></i></button>"+
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
 				url:"stud_status",
 				type:"POST",
 				data:{
 					student_id:id,
 					status:status
 				},
 				success:function(data){
 					alertify.logPosition("bottom right");
 					if(data=="true"){
 						alertify.success("STATUS HAS BEEN CHANGED !");
 						listStudInfo();
 					}else{
 						
 						swal('FAILED','Status unable change!','error');
 					}
 					
 				},
               	error: function(jqXHR, exception) {
               		catchErr(jqXHR, exception);
                 }
 			}); 
 		 }
         
         function isDelete(id){
 			swal({   
 			 title: "Are you sure?",   
				 text: "You will not be able to recover this student account!",   
				 type: "warning",   
				 showCancelButton: true,   
				 confirmButtonColor: "#DD6B55",   
				 confirmButtonText: "Yes, remove it!",   
				 closeOnConfirm: false 
	   		    }, function(){    
	   		    	$.ajax({
	    				url:"stud_del",
	    				method:"POST",
	    				data:{
	    					student_id:id,
	    				},
	    				success:function(data){
	    					if(data=="true"){
	       						swal({
	       							title:"REMOVED..!", 
	       							text:"Student account has been removed..!", 
	       							type:"success",
	       							timer:1500
	       						},function(){
	       							listStudInfo();
	       						});	
	       					}
	    				},
	                	error: function(jqXHR, exception) {
	                		catchErr(jqXHR, exception);
	                  	}
	    			});
	   					
	   					
	   			});    			
 		  }
         
         var raw_price=0;
         var dis=0;
		function getPriceDiscount(){
			
	        	 $.ajax({
	   				url:"getprice.float",
	   				dataType:"json",
	   				method:"POST",
	   				data:{
	   					prog_type_id:$("#list-lv").val(),
	   					fee_type:$("#payment-type").val()
	   				},
	   				beforeSend: function() {
	   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	   			    },
	   				complete: function(){
	   					$("#loading").remove();
	   				},
	   				success:function(data){
	   					raw_price=data[0].price;
		   				dis=raw_price-(raw_price*($("#discount").val()/100));
		   	        	$("#total-fee").val(dis).change();
	   				},
	   				error: function(jqXHR, exception) {
	   	          		catchErr(jqXHR, exception);
	   	            }
	   			});
        	
         }
		
         $("#discount").on("change keypress keyup",function(){
        	 dis=raw_price-(raw_price*($("#discount").val()/100));
        	 $("#total-fee").val(dis).change();
        	 
         });
         $("#payment-type").on("change",function(){
        	 if($("#list-lv").val()!=null){
        	 	getPriceDiscount();
        	 }else{
        		 swal("WARNING","Level hasn't selected","warning");
        	 	 $("#payment-type").attr("disabled",true);	
        	 	 raw_price=0;
        	 	 $("#total-fee").val(0);
         	}
         });
         $("#list-lv").on("change",function(){
        	if($(this).val()!=null){
        	    getPriceDiscount();
        	    $("#payment-type").attr("disabled",false);
        	}else{
        		$("#payment-type").attr("disabled",true);
        		$("#total-fee").val(0);
        		raw_price=0;
        	}
         });
         
         function createStud(){
        	 $.ajax({
	   				url:"create_stud",
	   				type:"POST",
	   				data:{
	   					id_card:$("#id-card").val(),
   						password:$("#password").val(),
						kh_name:$("#kh-name").val(),
						en_name:$("#en-name").val(),
						gender:$("#sex").val(),
						dob:$("#dob").val(),
						fa_name:$("#fa-name").val(),
						ma_name:$("#ma-name").val(),
						addr:$("#address").val(),
						phone:$("#phone").val(),
						img_url:image_name,
						timetype:$("#ampm").val(),
						discount:$("#discount").val(),
						fee:$("#total-fee").val(),
						prog_t_id:$("#list-lv").val(),
						feetype:$("#payment-type").val(),
	   				},
	   				beforeSend: function() {
	   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	   			    },
	   				complete: function(){
	   					$("#loading").remove();
	   				},
	   				success:function(status){
	   					
					 switch (status) {
						case "ok":
							alertify.logPosition("bottom right");
							alertify.success("CREATE STUDENT ACCOUNT SUCCESSFULL !");
							listStudInfo();
							reset();
							break;
						case "dup":
							swal({
								title:"WARNING",
								text:"Duplicate ID card",
								type:"warning"
							},function(){
								$("#id-card").focus();	
							});
							
							break;
						default:
							swal("FAILED","Unable to create !","error");
							break;
						} 
						
	   				},
	   				error: function(jqXHR, exception) {
	   	          		catchErr(jqXHR, exception);
	   	            }
	   			});
         }
         
         function updateStud(){
 			$.ajax({
         		url:"stud_update",
         		method:"POST",
         		//dataType:"json",
         		data:{
         			id_card:$("#id-card").val(),
					password:$("#password").val(),
					kh_name:$("#kh-name").val(),
					en_name:$("#en-name").val(),
					gender:$("#sex").val(),
					dob:$("#dob").val(),
					fa_name:$("#fa-name").val(),
					ma_name:$("#ma-name").val(),
					address:$("#address").val(),
					phone:$("#phone").val(),
					student_id:$("#btn-update").val(),
         			img_url:image_name
         		},
         		success:function(data){
         			console.log(data);
  					switch (data) {
					case "ok":
						alertify.logPosition("bottom right");
  						alertify.success("UPDATED SUCCESSFULLY !");
  						listStudInfo();
  						reset();
						break;
					case "no":
						swal("FALIED","Unable to update !","error");
						break;
					default:
						swal({title:"FALIED",html:""+data+"",type:"error"});
						break;
					} 
         		},
         		error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
         	});
         }
         
         function reset(){
        	 $('#btn-update').css("display","none")
			 .val("");
			 $('#btn-reset').css("display","none");
			 $('#btn-create').css("display","inline");
        	 $("#id-card").val("").change();
        	 $("#password").val("").change();
        	 $("#kh-name").val("").change();
        	 $("#en-name").val("").change();
        	 $("#dob").val("").change();
        	 $("#fa-name").val("").change();
        	 $("#ma-name").val("").change();
        	 $("#address").val("").change();
        	 $("#phone").val("").change();
        	 $("#ampm").prop('selectedIndex',0);
        	 $("#discount").val("").change();
        	 $("#total-fee").val("").change();
        	 $("#list-lv").prop('selectedIndex',0);
        	 $("#payment-type").prop('selectedIndex',0);
        	 $("#update-img").val("");
       		 $("#image").attr("src","/CamBrightv0.1/assets/img/user.png");

         }
         
         $("#fm-user").submit(function(e){
  			e.preventDefault();
  	    	//if(image_name!=""){
  	    		if(($('#btn-update').val())==""){
  	    			createStud();
  	 			}else{
  	 				updateStud();
  	 			}
  			/* }else{
  				swal('WARNING!','Choose an image profile','warning');
  			} */
  	    	//console.log("After "+image_name);
         });
         
         function view(id_card,eng_name,kh_name,gender,dob,fa_name,ma_name,addr,img_url,
        		 reg_date,mod_date,status,phone,branch_name,reg_by,cla_num,level,teach_by){
        	 var sex;
        	 (gender=='F')? sex="Female":sex="Male";
        	 $("h4.text-bold").text(id_card);
        	 $("#kh-name-view").val(kh_name);
        	 $("#eng-view").text(eng_name);
        	 $('#img-pro').attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/stud/"+img_url+"");
        	 $("#khm-name").text(kh_name);
        	 $("#en-name-view").val(eng_name);
        	 $("#gender").val(sex);
        	 $("#dob-view").val(dob);
        	 $("#fa-name-view").val(fa_name);
        	 $("#ma-name-view").val(ma_name);
        	 $("#addr-view").val(addr);
        	 $("#reg-date-view").val(reg_date);
        	 $("#mod-date-view").val(mod_date);
        	 $("#status-view").val(status);
        	 $("#phone-view").val(phone);
        	 $("#branch-view").val(branch_name);
        	 $("#level-view").val(level);
        	 $("#reg-by-view").val(reg_by);
        	 $("#class-view").val(cla_num);
         }
         
         function edit(id_card,en_name,kh_name,gender,dob,fa_name,ma_name,addr,img_url,
        		 phone,pwd,student_id){
        	 $("#id-card").val(id_card).change();
        	 $("#kh-name").val(kh_name).change();
        	 $("#en-name").val(en_name).change();
        	 $("#sex").val(gender).change();
        	 $("#pickerDOB").datepicker("setDate", dob);
        	 $("#fa-name").val(fa_name).change();
        	 $("#ma-name").val(ma_name).change();
        	 $("#address").val(addr).change();
        	 $("#update-img").val(img_url);
        	 $("#phone").val(phone).change();
        	 $("#password").val(pwd).change();
        	 
        	 $("#image").attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/stud/"+img_url+"");
        	  $("#list-main-prog").addClass("hidden");
        	 $("#branch-list").addClass("hidden");
        	 $("#list-lv").addClass("hidden");
        	 $("#ampm").addClass("hidden");
        	 $("#payment-type").addClass("hidden");
        	 $("#discount").addClass("hidden");
        	 $("#total-fee").addClass("hidden");
        	 //$("#branch-list").val().change();
        	
        	 $("#btn-update").val(student_id);
        	 $('#btn-create').css("display","none");
  			 $('#btn-update').css("display","inline");
  			 $('#btn-reset').css("display","inline");
  			image_name=img_url;
         }
         $("#btn-reset").on("click",function(){
           	 reset();
         });
         function reset(){
			 $('#btn-update').css("display","none")
			 .val("");
			 $('#btn-reset').css("display","none");
			 $('#btn-create').css("display","inline");
			 $("#id-card").val("").change();
	       	 $("#kh-name").val("").change();
	       	 $("#en-name").val("").change();
	       	 $("#sex").prop('selectedIndex',0);
	       	 $("#dob").val("").change();
	       	 $("#fa-name").val("").change();
	       	 $("#ma-name").val("").change();
	       	 $("#phone").val("").change();
	       	 $("#password").val("").change();
	       	 $("#address").val("").change();
	       	 $("#update-img").val("");
       		 $("#image").attr("src","${pageContext.servletContext.contextPath }/assets/img/user.png");
       		 
       		 $("#list-main-prog").removeClass("hidden");
	       	 $("#branch-list").removeClass("hidden");
	       	 $("#list-lv").removeClass("hidden");
	       	 $("#ampm").removeClass("hidden");
	       	 $("#payment-type").removeClass("hidden");
	       	 $("#discount").removeClass("hidden");
	       	 $("#total-fee").removeClass("hidden");
			 
		}
         
         function callJTable(){
			var tab=$('#tb_list').DataTable({searchHighlight: true});
			tab.on( 'draw', function () {
		        var body = $( tab.table().body() );
		        body.unhighlight();
		        body.highlight( tab.search() );  
		    } );
			$('[data-toggle="tooltip"]').tooltip();
			screenshotPreview();
	 	 }
         
          $(function(){
        	  
              console.log(raw_price);
              
             /*  $('a[data-toggle="tooltip"]').tooltip({
            	    animated: 'fade',
            	    placement: 'bottom',
            	    html: true
              }); */
              
              
             
              $('.card-head .tools .btn-collapse').on('click', function (e) {
      			var card = $(e.currentTarget).closest('.card');
      			materialadmin.AppCard.toggleCardCollapse(card);
          	  });
  		  });
         
         </script>
</body>
</html>
