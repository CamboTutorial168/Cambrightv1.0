
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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
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
												class="fa fa-angle-up"></i></a>
											<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
										</div>
										
									</div>
								</div>
								<!--end .card-head -->
								<div class="card-body" style="display: none;">
									<form class="form floating-label" role="form" id="fm-user">
										<div class="row">
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
											<div class="col-md-8">
												<div class="alert alert-warning" role="alert">
													<p>
														<strong class='text-danger'>NOTE </strong> 
														You are not able to modify <b>Branch</b>,&nbsp;<b>Subject</b>,&nbsp;<b>Class</b>,&nbsp;and <b>Period of Payment</b> here
													</p>
												</div>
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
													<input type="text" id="address"
														class="form-control">
													<label for="address">ADDRESS</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<select id="user-id" class="form-control" required>
														

													</select> <label for="payment-type">USER LEVEL</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class='form-control select2-list' id='select-subprog' required placeholder="SELECT SUB-PROGRAM">
													
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class='form-control select2-list' id='select-class' required placeholder="SELECT CLASS">
													
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class='form-control' id='select-feetype' required>
														<option value="term_fee">1 TERM</option>
														<option value="sem_fee">1 SEMESTER</option>
														<option value="year_fee">1 YEAR</option>
													</select>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<input type="number" class="form-control" id="discount" max="100" min="0" value="0"
														required> <label for="discount">DIS%</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="total" readonly required>
													<label for="">TOTAL</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class='form-control' id='select-period' required>
														<option value="am">AM</option>
														<option value="pm">PM</option>
													</select>
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
									<div class='tools'>
										<a class="btn btn-icon-toggle btn-refresh-list"><i class="md md-refresh"></i></a>
									</div>
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
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="class-view" readonly=""> <label
																	for="class-view">CLASS</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="program-view" readonly=""> <label
																	for="program-view">STUDYING PROGRAM</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="period-view" readonly=""> <label
																	for="period-view">PERIOD</label>
															</div>
														</div>
													</div>
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
																		id="userlvl-view" readonly=""> <label
																		for="email">User Level</label>
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
	<script src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppVendor.js"></script>
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
		src="${pageContext.servletContext.contextPath }/assets/js/libs/spin.js/spin.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/jquery.highlight.js"></script>
	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
          $("#studentreg").addClass("active");
          $('#pickerDOB').datepicker({
         	 format: 'yyyy/mm/dd',
          });
          listBranch();
          listLv();
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
	        
          
        
          function listBranch(){
  			$.ajax({
  				url:"branchlistactive.json",
  				dataType:"json",
  				type:"POST",
  				
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
          function listLv(){
    			$.ajax({
    				url : "ulvlist.json",
    				dataType:"json",
    				type : "POST",
    				success : function(data) {
    					$("#user-id").html(listLv_Supply(data));
    					$("#user-id").change();
    				},
                	error: function(jqXHR, exception) {
                		catchErr(jqXHR, exception);
                  }
    			});
    		 }
    		
    		 function listLv_Supply(data){
    			var list="";
    			for(var i=0;i<data.length;i++){
    				if(data[i].user_level==4)
    				list +="<option value="+data[i].user_id+">"+data[i].user_type+"</option>";
    			}
    			return list;
    		}
    		 
           function listStudInfo(){
	  			$.ajax({
	  				url:"liststudinfo.json",
	  				method:"POST",
	  				beforeSend: function() {
	  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	  			    },
	  				complete: function(){
	  					$("#loading").remove();
	  				},
	  				success:function(data){
	  					console.log(data);
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
								"<th>BRANCH</th>"+
								"<th>PROGRAM</th>"+
								"<th>CLASS</th>"+
								"<th>ACTION</th>"+
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
										"<td><span class='badge' style='background-color:"+data[i]['branch_color']+"'>"+data[i]['branch_name']+"</span></td>"+
										"<td>"+data[i]['subprog_title']+"</td>"+
										"<td><span class='badge' style='background-color:"+data[i]['cla_color']+"'>"+data[i]['cla_num']+"</span></td>"+
										"<td class='hidden'>"+data[i]['phone']+"</td>"+
										"<td class='hidden'>"+data[i]['fa_name']+"</td>"+
										"<td class='hidden'>"+data[i]['ma_name']+"</td>"+
										"<td class='hidden'>"+data[i]['addr']+"</td>"+
										"<td>";
										 if(data[i]['status']=='t'){
											table+= "<button type='button' onClick=\"checkStatus('"+data[i].student_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-check'></i></button>";
										 }else{
											 table+= "<button type='button' onClick=\"checkStatus('"+data[i].student_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-close'></i></button>";
										 }
										 table+="<span data-toggle='modal' onClick=\"view('"+data[i].id_card+"','"+data[i].en_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].fa_name+"','"+data[i].ma_name+"','"+data[i].addr+"','"+data[i].img_url+"','"+data[i].reg_date+"','"+data[i].mod_date+"','"+data[i].status+"','"+data[i].phone+"','"+data[i].branch_name+"','"+data[i].reg_by+"','"+data[i].cla_num+"','"+data[i].level+"','"+data[i].teach_by+"','"+data[i].user_type+"','"+data[i].cla_num+"','"+data[i].period+"','"+data[i].subprog_title+"')\" data-target='.bs-example-modal-md' data-backdrop='static' data-keyboard='false'><button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-default-dark' data-toggle='tooltip'  data-placement='top' title='View Detail'><a class='screenshot' rel='${pageContext.servletContext.contextPath }/admin/cpanel/img/stud/"+data[i].img_url+"'><i class='md md-remove-red-eye'></i></a></button></span>"+
										 "<button type='button' onClick=\"edit('"+data[i].id_card+"','"+data[i].en_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].fa_name+"','"+data[i].ma_name+"','"+data[i].addr+"','"+data[i].img_url+"','"+data[i].phone+"','"+data[i].password+"','"+data[i].student_id+"','"+data[i].branch_id+"','"+data[i].user_id+"')\" class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>"+
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
						user_id:$("#user-id").val(),
						teach_id:$("#select-class").val(),
						fee_type:$("#select-feetype").val(),
						discount:$("#discount").val(),
						sub_prog_id:$("#select-subprog").val(),
						total:$("#total").val(),
						period:$("#select-period").val()
	   				},
	   				beforeSend: function() {
	   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	   			    },
	   				complete: function(){
	   					$("#loading").remove();
	   				},
	   				success:function(status){
	   					alertify.logPosition("bottom right");
						if(status=="true"){
							alertify.success("CREATE SUCCESSFULLY !");
							listStudInfo();
	 						reset();
	        			}else{
							swal("FALIED","Unable to create check if duplicate ID card","error");
							$("#id-card").focus();
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
					user_id:$("#user-id").val(),
					student_id:$("#btn-update").val(),
					img_url:image_name
         		},
         		success:function(data){
         			
         			alertify.logPosition("bottom right");
					if(data=="true"){
						alertify.success("UPDATED SUCCESSFULLY !");
						listStudInfo();
 						reset();
        			}else{
						swal("FALIED","Unable to update check if duplicate ID card or email invalid!","error");
						$("#id-card").focus();
					}
         		},
         		error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
         	});
         }
         var listsubprog;
         //SUBPROGRAM
         function listSubProg(){
 			$.ajax({
 				url:"subproglistbranch.json",
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
 					listsubprog=data;
 					$("#select-subprog").html(subProgList_Supply(data)).change();
 					$("#select-subprog").select2();
 				},
 				error: function(jqXHR, exception) {
 	          		catchErr(jqXHR, exception);
 	            }
 			});
 		 }
         function subProgList_Supply(data){
        	 var list = "";
  			
  			list+="<optgroup label='Program'>";
  			for (var i = 0; i < data.length; i++) {
  			
  				list += "<option value="+data[i].subprog_id+">"
  						+ data[i].sub_prog_title + "</option>";
  				
  			}
  			list+="</optgroup>";
  			return list;
         }
         function listClass(subprog_id){
				$.ajax({
					url:"classlist.json",
					type:"POST",
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						$("#select-class").html(listClassSupply(data,subprog_id));
						$("#select-class").select2();
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
		 }
      
	     function listClassSupply(data){
	     var clinB=classInBranch(data);
	     var tinB= teachInBranch(listTeaching);
	     var cAval = classAvaliable(tinB,clinB);
       	 var list = "";
 		 var lent=cAval.length;
  			 list+="<optgroup label='Classroom'>";
  			for (var i = 0; i < lent; i++) {
  				list += "<option value="+cAval[i].teach_id+">"
			  + cAval[i].class_name +"</option>";
  			}
  			list+="</optgroup>";
		    return list;
	     }
	     //Filter class in current branch
	     function classInBranch(data){
	    	 var classId=[];
	    	 var len=data.length;
	    	 for (var i = 0; i < len; i++) {
  				//filter class in one branch
  				if(data[i]['branch_id']==$("#branch-list").val()){
					classId.push(data[i].class_id);
  				}	
	  		 }
			 return classId;
	     }
	     
	    //Filter teaching in current branch
	    function teachInBranch(data){
	    	 var obj=[];
	    	 var len=data.length;
	    	 for (var i = 0; i < len; i++) {
  				//filter teaching in one branch
  				if(data[i]['branch_id']==$("#branch-list").val()){
					obj.push(data[i]);
  				}	
	  		 }
			 return obj;
	     }
	     
	    //Find avaliable class after filter in one branch
        function classAvaliable(tinB,clinB){
        	 var result=[];
        	 var tmp=null;
        	 for(var i=0; i<clinB.length; i++){
        		 for(var j=0; j<tinB.length; j++){
        			 if(clinB[i] == tinB[j]['class_id']){
        			 	tmp=tinB[j];break;
        			 }else{
        				tmp=null;
        			 }
        		 }
        		 if(tmp!=null)result.push(tmp);
        	 } 
        	 return result;
         }
	   
	   	 var listTeaching;
	     //Get for filter data
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
        			
        			listTeaching=data;
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         };
         var raw_price;
         $("#branch-list").on("change",function(){
        	 listSubProg();
         });
         $("#select-subprog").on("change",function(){
        	 getListTeaching();
        	 listClass($("#select-subprog").val());
        	 getFee();
        	 
         });
         $("#select-feetype").on("change",function(){
        	 getFee();
         });
         $("#discount").on("change keypress keyup",function(){
        	 if(raw_price>-1){
	        	 dis=raw_price-(raw_price*($("#discount").val()/100));
	        	 $("#total").val(dis).change(); 
        	 }
         });
         
         function getFee(){
        	 for(var i=0;i<listsubprog.length;i++){
        		 if(listsubprog[i]['subprog_id']==$("#select-subprog").val()){
        			 $("#total").val(listsubprog[i][$("#select-feetype").val()]).change();
        			 raw_price=listsubprog[i][$("#select-feetype").val()];
        			 $("#discount").change();
        			 break;
        		 }
        	 }
        	 
         }
         function reset(){
        	 
        	 $("#branch-list").css("display","inline");
        	 $("#discount").css("display","inline");
        	 $("#total").css("display","inline");
        	 $("#select-feetype").css("display","inline");
        	 $("#select-subprog").prop("required",true);
        	 $("#select-class").prop("required",true);
        	 $("#select-subprog").prop("disabled",false);
        	 $("#select-class").prop("disabled",false);
        	 
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
       		 $("#image").attr("src","${pageContext.servletContext.contextPath }/assets/img/user.png");

         }
         
         $("#fm-user").submit(function(e){
  			e.preventDefault();
  			if(image_name==undefined){
  				swal({   
 		  			 title: "Are you sure?",   
 		 				 text: "Image profile not yet choose",   
 		 				 type: "warning",   
 		 				 showCancelButton: true,   
 		 				 confirmButtonColor: "#DD6B55",   
 		 				 confirmButtonText: "Skip this step!",   
 		 				 closeOnConfirm: false 
 		 	   		    },function(){
 		 	   		   	if(($('#btn-update').val())==""){
 		  	    			createStud();
 		  	 			}else{
 		  	 				updateStud();
 		  	 			}
 		 	   	});
  	    		
  			}else{
  					if(($('#btn-update').val())==""){
	  	    			createStud();
	  	 			}else{
	  	 				updateStud();
	  	 			}
  			}
         });
         
         function view(id_card,eng_name,kh_name,gender,dob,fa_name,ma_name,addr,img_url,
        		 reg_date,mod_date,status,phone,branch_name,reg_by,cla_num,level,teach_by,user_type,cla_num,period,subprog_title){
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
        	 $("#phone-view").val(phone);
        	 $("#branch-view").val(branch_name);
        	 $("#level-view").val(level);
        	 $("#reg-by-view").val(reg_by);
        	 $("#userlvl-view").val(user_type);
        	 $("#class-view").val(cla_num);
        	 $("#period-view").val(period);
        	 $("#program-view").val(subprog_title);
         }
     
         
         function edit(id_card,en_name,kh_name,gender,dob,fa_name,ma_name,addr,img_url,
        		 phone,pwd,student_id,branch_id,user_id){
        	 
        	 $("#select-subprog").prop("required",false);
        	 $("#select-class").prop("required",false);
        	 $("#select-subprog").prop("disabled",true);
        	 $("#select-class").prop("disabled",true);
        	 $("#branch-list").css("display","none");
        	 $("#discount").css("display","none");
        	 $("#total").css("display","none");
        	 $("#select-feetype").css("display","none");
        	 image_name=img_url;
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
        	 $("#user-id").val(user_id);
        	 $("#image").attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/stud/"+img_url+""); 
        	 $("#btn-update").val(student_id);
        	 $('#btn-create').css("display","none");
  			 $('#btn-update').css("display","inline");
  			 $('#btn-reset').css("display","inline");
  			image_name=img_url;
         }
         $("#btn-reset").on("click",function(){
           	 reset();
         });
        
         
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
              $('.card-head .tools .btn-collapse').on('click', function (e) {
      			var card = $(e.currentTarget).closest('.card');
      			materialadmin.AppCard.toggleCardCollapse(card);
          	  });
  		  });
          
          $('.card-head .tools .btn-refresh').on('click', function (e) {
      		var card = $(e.currentTarget).closest('.card');
      		materialadmin.AppCard.addCardLoader(card);
      		setTimeout(function () {
      			materialadmin.AppCard.removeCardLoader(card);
      			listLv();
      		}, listBranch());
  		});
          $('.card-head .tools .btn-refresh-list').on('click', function (e) {
      		var card = $(e.currentTarget).closest('.card');
      		materialadmin.AppCard.addCardLoader(card);
      		setTimeout(function () {
      			materialadmin.AppCard.removeCardLoader(card);
      		}, listStudInfo());
  		});
         </script>
</body>
</html>
