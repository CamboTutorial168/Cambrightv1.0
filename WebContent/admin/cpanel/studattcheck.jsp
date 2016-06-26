
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
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select name="branch" id="branch-list" class="form-control"
														required>

													</select> <label for="branch">BRANCH</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<select class='form-control select2-list'
														id='select-subprog' placeholder="SELECT SUB-PROGRAM"
														required>

													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class='form-control select2-list' id='select-class'
														placeholder="SELECT CLASS" required>

													</select>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<select class="form-control" id="select-period">
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
        
        function initDate(){
			$('#demo-date').datepicker({
		   	 	format: 'M/yyyy',
		   	 	minViewMode: 1,
		   	 	autoclose: true,
		   	 	startDate: new Date(2016,2,1),
		   	 	endDate:new Date()
		    }).datepicker("setDate", "0");
		}
        
        listBranch();
		function listBranch() {
			$.ajax({
				url : "branchlistactivebranch.json",
				dataType : "json",
				type : "POST",
				beforeSend : function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				},
				complete : function() {
					$("#loading").remove();
				},
				success : function(data) {
					if (data != "")
						$("#branch-list").html(listBranch_Supply(data)).change();
				},
				error : function(jqXHR, exception) {
					catchErr(jqXHR, exception);
				}
			});
		}
		function listBranch_Supply(data) {
			var list = "";
			list += "<option value="+data[0].branch_id+" selected='selected'>"
					+ data[0].branch_name + "</option>";
			for (var i = 1; i < data.length; i++) {
				list += "<option value="+data[i].branch_id+">"
						+ data[i].branch_name + "</option>";

			}
			return list;
		}
		var listsubprog;
		//SUBPROGRAM
		function listSubProg() {
			$.ajax({
				url : "subproglistbranch.json",
				dataType : "json",
				method : "POST",
				data : {
					branch_id : $("#branch-list").val()
				},
				success : function(data) {
					listsubprog = data;
					$("#select-subprog").html(subProgList_Supply(data))
							.change();
					$("#select-subprog").select2();
				},
				error : function(jqXHR, exception) {
					catchErr(jqXHR, exception);
				}
			});
		}
		function subProgList_Supply(data) {
			var list = "";

			list += "<optgroup label='Program'>";
			for (var i = 0; i < data.length; i++) {

				list += "<option value="+data[i].subprog_id+">"
					+ data[i].sub_prog_title + "</option>";

			}
			list += "</optgroup>";
			return list;
		}
		function listClass(subprog_id) {
			$.ajax({
				url : "classlist.json",
				type : "POST",
				beforeSend : function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				},
				complete : function() {
					$("#loading").remove();
				},
				success : function(data) {
					
					$("#select-class").html(listClassSupply(data, subprog_id)).change();
					$("#select-class").select2();
				},
				error : function(jqXHR, exception) {
					catchErr(jqXHR, exception);
				}
			});
		}

		function listClassSupply(data) {
			var clinB = classInBranch(data);
			var tinB = teachInBranch(listTeaching);
			var cAval = classAvaliable(tinB, clinB);
			var list = "";
			var lent = cAval.length;
			
			list += "<optgroup label='Classroom'>";
			for (var i = 0; i < lent; i++) {
				"<c:if test='${adminsession.user_level==3}'>"
				 if(cAval[i]['emp_id']=='${adminsession.emp_id}')
				"</c:if>"
				list += "<option value="+cAval[i].class_id+">"
						+ cAval[i].class_name + "</option>";
			}
			list += "</optgroup>";
			return list;
		}
		//Filter class in current branch
		function classInBranch(data) {
			var classId = [];
			var len = data.length;
			for (var i = 0; i < len; i++) {
				//filter class in one branch
				if (data[i]['branch_id'] == $("#branch-list").val()) {
					classId.push(data[i]);
				}
			}
			return classId;
		}

		//Filter teaching in current branch
		function teachInBranch(data) {
			var obj = [];
			var len = data.length;
			for (var i = 0; i < len; i++) {
				//filter teaching in one branch
				if (data[i]['branch_id'] == $("#branch-list").val()) {
					obj.push(data[i]);
				}
			}
			return obj;
		}

		//Find avaliable class after filter in one branch
		function classAvaliable(tinB, clinB) {
			var result1 = [], result2 = [];
			var tmp = null;
			//Combine teach & class to find unique
			for (var i = 0; i < clinB.length; i++) {
				for (var j = 0; j < tinB.length; j++) {
					if (clinB[i]['class_id'] == tinB[j]['class_id']) {
						tmp = tinB[j];
						break;
					} else {
						tmp = null;
					}
				}
				if (tmp != null)
					result1.push(tmp);
			}

			for (var i = 0; i < result1.length; i++) {
				if (result1[i]['sub_prog_id'] == $("#select-subprog").val())
					result2.push(result1[i]);
			}
			return result2;
		}

		var listTeaching;
		//Get for filter data
		function getListTeaching() {
			$.ajax({
				url : "teachinglist.json",
				method : "POST",
				success : function(data) {

					listTeaching = data;
				},
				error : function(jqXHR, exception) {
					catchErr(jqXHR, exception);
				}
			});
		}
		function callJTable(){
       	 var tab=$('#tb_list').DataTable({searchHighlight: true});
				tab.on( 'draw', function () {
		        var body = $( tab.table().body() );
		        body.unhighlight();
		        body.highlight( tab.search() );  
		    } );
		 }
		$("#branch-list").on("change", function() {
			getListTeaching();
			listSubProg();
		});
		$("#select-subprog").on("change", function() {
			listClass($("#select-subprog").val());
		});
		$("#select-class").on("change",function(){
			listStudInfo();
		});
		$("#select-period").on("change",function(){
			listStudInfo();
		});
		
		//var people="";
		function listStudInfo(){
  			$.ajax({
  				url:"liststudinfo.json",
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
  					find(people);
  					//console.log(people);
  					
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
   		 }
		function find(people){
			var len=people.length;
			var rs=[];
			for(var i=0;i<len;i++){
				if(people[i].subprog_id==$("#select-subprog").val() && people[i]['cla_id']==$("#select-class").val() && people[i]['period']==$("#select-period").val()){
					rs.push(people[i]);
				}
			}
			getPeople(rs);
			console.log(rs);
		}
		$('#ck-att').on("click",function(){
			swal({   
   			 title: "Are you sure?",   
  				 text: "You will not be able to recovery this action!",   
  				 type: "warning",   
  				 showCancelButton: true,   
  				 confirmButtonColor: "#DD6B55",   
  				 confirmButtonText: "Yes, I am!",   
  				 closeOnConfirm: false 
  	   		    }, function(){
			
					var attent=[];
				
					$("[class*='ck_']").each(function(index,obj){
						var x = $(this).val();
						
						if($(this).prop('checked')==true){
							x=x.substr(0,x.length);
						}else{
							x=x.substr(0,x.length-16);
							x+="'is_absent':'a'}";
						}
						x=x.replace(/'/g , "\"");
						x=JSON.parse(x);
						attent.push(x);
					});
					
					submitAtt(JSON.stringify(uniqueFilter(attent)));
					//console.log(JSON.stringify(uniqueFilter(attent)));
			});
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
	 	   				url:"attendance_stu_submit",
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
		 	   					swal("FAILED","Checking Attendance is not submitted","error");
		 	   				}
	 	   				},
		 				error: function(jqXHR, exception) {
		              		catchErr(jqXHR, exception);
		                }
	 	   			});  	
	 	   	});
			
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
