
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
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<!-- END STYLESHEETS -->
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

.img-thumbnail.size-3.5 {
	height: 130px;
	width: 117px;
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
</style>


<!-- END STYLESHEETS -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/libs/utils/html5shiv.js?1403934957"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/libs/utils/respond.min.js?1403934956"></script>
		<![endif]-->
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
							<li class="active">STAFF ENROLLMENT</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-primary card-collapsed">
								<div class="card-head card-head-sm style-primary">
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
									<form class="form" id="fm-user" method="GET">
										<div class="row">
											<div class="col-md-offset-8"></div>
											<div class="col-md-4">
												<img class="img-thumbnail" id="image"
													src="${pageContext.servletContext.contextPath }/assets/img/user.png"
													width="113px"> <a
													class="btn btn-icon-toggle ink-reaction btn-default fileUpload "
													id="uploadButton"> <input type="hidden" id="update-img">
													<input type="file" onchange="readURL(this);" id="file"
													class="upload" /> <i class="md md-camera-alt"></i></a>
											</div>
										</div>

										<div class="row">
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="id-card"
														name="id_card" required> <label for="id_card">*ID
														CARD</label>
													<p class="help-block">Ex: CB13556</p>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="kh-name"
														required> <label for="floatInput">*KHMER
														NAME</label>
													<p class="help-block">Ex: គង់ ដារ៉ាវិចិត្រ</p>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="en-name"
														required> <label for="floatInput">*ENGLISH
														NAME</label>
													<p class="help-block">Ex: Kong Daravichet</p>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select id="sex" name="sex" class="form-control" required>
														<option value="M" selected>Male</option>
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
															<input type="text" class="form-control" name="dob"
																id="dob" required> <label>*DOB</label>
														</div>
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="nation"
														required> <label for="nation">NATIONALITY</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="nation-id"
														required> <label for="nation-id">NATIONAL
														ID</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="text" class="form-control" id="phone" required>
													<label for="phone">PHONE NUMBER</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class="form-control branch-list" required>

													</select> <label for="branch">BRANCH</label>
												</div>
											</div>
										</div>
										<!--end .row -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select id="position" class="form-control" required>

													</select> <label for="position">POSITION</label>
												</div>
											</div>

											<div class="col-md-3">
												<div class="form-group floating-label">
													<select class="form-control list-ulv" class="form-control"
														required>

													</select> <label>USER LEVEL</label>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group floating-label">
													<input type="email" class="form-control" id="email"
														required> <label for="email">EMAIL</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<input type="password" class="form-control" id="pwd"
														required> <label for="pwd">PASSWORD</label>
												</div>
											</div>

										</div>
										<div class="form-footer">
											<div class="row">
												<div class="col-sm-2 offset-col-sm-10">
													<button type="submit" id="btn-create"
														class="btn ink-reaction btn-raised btn-primary">CREATE
														NOW</button>
													<button type="submit" id="btn-update"
														class="btn ink-reaction btn-raised btn-primary"
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
					<!-- MODAL VIEW -->
					<div class="modal fade bs-example-modal-md" tabindex="-1"
						role="dialog">
						<div class="modal-dialog modal-md">
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
											<h2 class="text-light no-margin" id="khm-name"></h2>
											<h3 class="text-bold" id="position-view"></h3>
											<div class="star-rating">
												<h4 class="text-bold" id="id-card"></h4>
											</div>
										</div>
										<br>
										<!-- BEGIN FORM TABS -->
										<div class="card-head card-head-xs style-primary-bright">
											<ul class="nav nav-tabs tabs-text-contrast tabs-primary"
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
																	id="kh-name-view" readonly=""> <label
																	for="readonly6">Khmer Name</label>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="en-name-view" readonly=""> <label
																	for="readonly6">English Name</label>
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
																	id="dob-view" readonly=""> <label
																	for="readonly6">DOB</label>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="nationality-view" readonly=""> <label
																	for="readonly6">Nationality</label>
															</div>
														</div>
													</div>
													<!--end .row -->
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group floating-label">
																<input type="text" class="form-control static dirty"
																	id="nation-id-view" readonly=""> <label
																	for="readonly6">National ID</label>
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
																	id="user-level-view" readonly=""> <label
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
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/preview.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
         $("#empreg").addClass("active");
         $('#pickerDOB').datepicker({
        	 format: 'yyyy/mm/dd',
         });
          var image_name;
          listLv();
          listPosition();
          listBranch();
          getEmpList();
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
	                            .width(150)
	                            .height(200);
	                    };

	                    reader.readAsDataURL(input.files[0]);
	                    
	                   
	                }
	  			}
              
          }
          
          function listLv(){
  			$.ajax({
  				url : "ulvlist.json",
  				dataType:"json",
  				type : "POST",
  				success : function(data) {
  					$(".list-ulv").html(listLv_Supply(data));
  					$(".list-ulv").change();
  				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
  			});
  		 }
  		
  		 function listLv_Supply(data){
  			var list="";
  			list +="<option value="+data[0].user_id+" selected>"+data[0].user_type+"</option>";
  			for(var i=1;i<data.length;i++){
  				list +="<option value="+data[i].user_id+">"+data[i].user_type+"</option>";
  			}
  			return list;
  		}
  		 
  		 function listPosition(){
  			$.ajax({
  				url:"positionlist.json",
  				dataType:"json",
  				type:"POST",
  				success:function(data){
  					$("#position").html(listPosSupply(data))
  					.change();
  				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
  			});
  		}
  		
        function listPosSupply(data){
        	var list = "";
        	list += "<option value="+data[0].position_id+" selected>"
			+ data[0].position + "</option>";
			for (var i = 1; i < data.length; i++) {
				list += "<option value="+data[i].position_id+">"
						+ data[i].position + "</option>";
			}
		
			return list;
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
					$(".branch-list").html(listBranch_Supply(data))
					.change();
					 
				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
			});
		}
        
        function listBranch_Supply(data){
			var list = "";
			list += "<option value="+data[0].branch_id+" selected>"
			+ data[0].branch_name + "</option>";
			for (var i = 1; i < data.length; i++) {
				
					list += "<option value="+data[i].branch_id+">"
							+ data[i].branch_name + "</option>";
				
			}
		
			return list;
        }
        
        
		function userUpdate(){
			
			$.ajax({
        		url:"emp_update",
        		method:"POST",
        		data:{
        			emp_id:$("#btn-update").val(),
        			id_card:$("#id-card").val(),
        			kh_name:$("#kh-name").val(),
        			en_name:$("#en-name").val(),
        			gender:$("#sex").val(),
        			dob:$("#dob").val(),
        			nationality:$("#nation").val(),
        			national_id:$("#nation-id").val(),
        			phone:$("#phone").val(),
        			pos_id:$("#position").val(),
        			user_id:$(".list-ulv").val(),
        			email:$("#email").val(),
        			password:$("#pwd").val(),
        			branch_id:$(".branch-list").val(),
        			img_url:image_name
        		},
        		success:function(data){
        			alertify.logPosition("bottom right");
 					if(data=="true"){
 						alertify.success("UPDATED SUCCESSFULLY !");
 						getEmpList();
 						reset();
 					}else{
 						swal("FALIED","Unable to update !","error");
 					} 
        		},
        		error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
        	});
        }
		
        $("#fm-user").submit(function(e){
 			e.preventDefault();
 	    	if(image_name!=undefined){
 	    		if(($('#btn-update').val())==""){
 	 				userCreate();
 	 			}else{
 	 				userUpdate();
 	 			}
 			}else{
 				swal('WARNING!','Choose an image profile','warning');
 			}
 	    	console.log("After "+image_name);
        });
       
        
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
	       	 $("#nation").val("").change();
	       	 $("#nation-id").val("").change();
	       	 $("#phone").val("").change();
	       	 $(".branch-list").prop('selectedIndex',0);
	       	 $("#position").prop('selectedIndex',0);
	       	 $(".list-ulv").prop('selectedIndex',0);
	       	 $("#email").val("").change().attr("disabled",false);
	       	 $("#pwd").val("").change();
	       	 $("#update-img").val("");
	       	 image_name="";
       		 $("#image").attr("src","${pageContext.servletContext.contextPath }/assets/img/user.png");
			
		}
 		
        function uploadEmpImage(){
			var data1="";
			data1=new FormData();
			data1.append("file",$("input[type=file]")[0].files[0]);
			
			$.ajax({
				url:"upload_img_emp",
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
					
					if(strStartsWith(data,"IMG_EMP_")!=false){
						image_name=data;
						swal('SUCCESS!','You have uploaded image','success');
					}else{
						swal('FAILED!','Uploaded image failed','error');
					}
				},
        		error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
			});
		}
        function strStartsWith(str, prefix) {
            return str.indexOf(prefix) === 0;
        }
        
        function userCreate(){
        	console.log(image_name);
        	$.ajax({
        		url:"emp_create",
        		method:"POST",
        		data:{
        			id_card:$("#id-card").val(),
        			kh_name:$("#kh-name").val(),
        			en_name:$("#en-name").val(),
        			gender:$("#sex").val(),
        			dob:$("#dob").val(),
        			nationality:$("#nation").val(),
        			national_id:$("#nation-id").val(),
        			phone:$("#phone").val(),
        			pos_id:$("#position").val(),
        			user_id:$(".list-ulv").val(),
        			email:$("#email").val(),
        			password:$("#pwd").val(),
        			branch_id:$(".branch-list").val(),
        			img_url:image_name
        		},
        		success:function(status){
        			alertify.logPosition("bottom right");
					if(status=="true"){
						alertify.success("CREATE SUCCESSFULLY !");
 						getEmpList();
 						reset();
        			}else{
						swal("FALIED","Unable to create check if duplicate ID card or email invalid!","error");
						$("#id-card").focus();
					}
 					
        		},
        		error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
        	});
        }
    	
        $('.card-head .tools .btn-collapse').on('click', function (e) {
			var card = $(e.currentTarget).closest('.card');
			materialadmin.AppCard.toggleCardCollapse(card);
		});
        
        //LIST EMP
        
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
								"<th class='sort-alpha'>USER LEVEL</th>"+
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
								"<td>";
								switch(data[i]['user_level']){
									case 0: table+="<span class='badge style-accent-dark'>"+data[i].user_type; break;
									case 1: table+="<span class='badge style-primary-dark'>"+data[i].user_type;break;
									case 2: table+="<span class='badge style-info'>"+data[i].user_type;break;
									case 3: table+="<span class='badge style-success'>"+data[i].user_type;break;
								}
								table+="</span></td>"+
								
								"<td><span class='badge style-accent-bright'>"+data[i]['position']+"</span></td>"+
								"<td>"+data[i]['phone']+"</td>"+
								"<td>"+data[i]['email']+"</td>"+
								"<td>";
								 if(data[i]['status']=='t'){
									table+= "<button type='button' onClick=\"checkStatus('"+data[i].emp_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-check'></i></button>";
								 }else{
									 table+= "<button type='button' onClick=\"checkStatus('"+data[i].emp_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Status'><i class='fa fa-close'></i></button>";
								 }
								 table+="<span data-toggle='modal' onClick=\"view('"+data[i].id_card+"','"+data[i].eng_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].nationality+"','"+data[i].national_id+"','"+data[i].img_url+"','"+data[i].hire_date+"','"+data[i].mod_date+"','"+data[i].status+"','"+data[i].phone+"','"+data[i].email+"','"+data[i].branch_name+"','"+data[i].position+"','"+data[i].user_type+"')\" data-target='.bs-example-modal-md' data-backdrop='static' data-keyboard='false'><button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-default-dark' data-toggle='tooltip'  data-placement='top' title='View Detail'><a class='screenshot' rel='${pageContext.servletContext.contextPath }/admin/cpanel/img/emp/"+data[i].img_url+"'><i class='md md-remove-red-eye'></i></a></button></span>"+
								 "<button type='button' onClick=\"edit('"+data[i].id_card+"','"+data[i].eng_name+"','"+data[i].kh_name+"','"+data[i].gender+"','"+data[i].dob+"','"+data[i].nationality+"','"+data[i].national_id+"','"+data[i].img_url+"','"+data[i].phone+"','"+data[i].branch_id+"','"+data[i].pos_id+"','"+data[i].user_id+"','"+data[i].email+"','"+data[i].pwd+"','"+data[i].emp_id+"')\" class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>"+
								 "<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Delete' onClick=\"isDelete('"+data[i].emp_id+"')\" ><i class='fa fa-trash'></i></button>"+
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
         
         function isDelete(id){
  			swal({   
  			 title: "Are you sure?",   
 				 text: "You will not be able to recover this employee account!",   
 				 type: "warning",   
 				 showCancelButton: true,   
 				 confirmButtonColor: "#DD6B55",   
 				 confirmButtonText: "Yes, remove it!",   
 				 closeOnConfirm: false 
 	   		    }, function(){    
 	   		    	$.ajax({
 	    				url:"emp_del",
 	    				method:"POST",
 	    				data:{
 	    					emp_id:id,
 	    				},
 	    				success:function(data){
 	    					if(data=="true"){
 	       						swal({
 	       							title:"REMOVED..!", 
 	       							text:"Employee account has been removed..!", 
 	       							type:"success",
 	       							timer:1500
 	       						},function(){
 	       							getEmpList();
 	       						});	
 	       					}else{
	 	       					swal({
		       							title:"FAILED..!", 
		       							text:"Unable to removed..!", 
		       							type:"error"
		       					});
 	       					}
 	    				},
 	                	error: function(jqXHR, exception) {
 	                		catchErr(jqXHR, exception);
 	                  	}
 	    			});
 	   					
 	   					
 	   			});    			
  		  }
         
         function callJTable(){
				$('#tb_list').DataTable();
				screenshotPreview();
		 }
         
         function view(id_card,eng_name,kh_name,gender,dob,nationality,nation_id,img_url,
        		 hire_date,mod_date,status,phone,email,branch_name,position,user_type){
        	 var sex;
        	 (gender=='F')? sex="Female":sex="Male";
        	 $("h4.text-bold").text(id_card);
        	 $("#kh-name-view").val(kh_name);
        	 $('#img-pro').attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/emp/"+img_url+"");
        	 $("#khm-name").text(kh_name);
        	 $("#en-name-view").val(eng_name);
        	 $("#gender").val(sex);
        	 $("#dob-view").val(dob);
        	 $("#nationality-view").val(nationality);
        	 $("#nation-id-view").val(nation_id);
        	 $("#reg-date-view").val(hire_date);
        	 $("#mod-date-view").val(mod_date);
        	 $("#status-view").val(status);
        	 $("#phone-view").val(phone);
        	 $("#email-view").val(email);
        	 $("#branch-view").val(branch_name);
        	 $("#position-view").text(position);
        	 $("#user-level-view").val(user_type);
         }
         
         function edit(id_card,en_name,kh_name,gender,dob,nationality,nation_id,img_url,
        		 phone,branch_id,pos_id,user_id,email,pwd,emp_id){
        	 image_name=img_url;
        	 $("#id-card").val(id_card).change();
        	 $("#kh-name").val(kh_name).change();
        	 $("#en-name").val(en_name).change();
        	 $("#sex").val(gender).change();
        	 $("#pickerDOB").datepicker("setDate", dob);
        	 $("#nation").val(nationality).change();
        	 $("#nation-id").val(nation_id).change();
        	 $("#phone").val(phone).change();
        	 $(".branch-list").val(branch_id).change();
        	 $("#position").val(pos_id).change();
        	 $("#update-img").val(img_url);
        	 $("#image").attr("src","${pageContext.servletContext.contextPath }/admin/cpanel/img/emp/"+img_url+"");
        	 $(".list-ulv").val(user_id).change();
        	 $("#email").val(email).change().attr("disabled",true);
        	 $("#pwd").val(pwd).change();
        	 $("#btn-update").val(emp_id);
        	 $('#btn-create').css("display","none");
  			 $('#btn-update').css("display","inline");
  			 $('#btn-reset').css("display","inline");
        	 
        	 
         }
 
         </script>
</body>
</html>
