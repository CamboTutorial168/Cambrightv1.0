
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>			
<!-- @author Kong Sovary -->
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Students Change Time</title>
<c:if test="${adminsession.user_level >2 }">
	<c:redirect url="/admin"></c:redirect>
</c:if>
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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<style type="text/css">
table.dataTable span.highlight {
	background-color: #FFFF88;
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
							<li class="active">STUDENT STUDYING</li>
						</ol>

					</div>
					<!-- LIST -->
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent">
								<div class="card-head card-head-sm style-accent">
									<header>STUDENTS IN CLASS</header>
									<div class="tools">
										
											<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
										
									</div>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<form class="form">
										<div class="row">
											<div class="col-md-3">
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
													<button type="button"
														class="btn ink-reaction btn-raised btn-sm btn-accent"
														disabled id="btn-change">CHANGE</button>
												</div>
											</div>
										</div>
									</form>
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
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppCard.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/spin.js/spin.min.js"></script>
	<!-- END MAIN SCRIPT  -->
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/jquery.highlight.js"></script>
	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
		$("#studying").addClass("active");
		listBranch();
		function listBranch() {
			$.ajax({
				url : "branchlistactivebranch.json",
				dataType : "json",
				type : "POST",

				beforeSend : function() {
					$("body")
							.append(
									"<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				},
				complete : function() {
					$("#loading").remove();
				},
				success : function(data) {
					if (data != "")
						$("#branch-list").html(listBranch_Supply(data))
								.change();

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
					$("body")
							.append(
									"<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
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
				list += "<option value="+cAval[i].teach_id+">"
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
		
		//Period List table
		
		function periodList(){
   			
        	 $.ajax({
   				url:"periodlist.json",
   				method:"POST",
   				beforeSend: function() {
   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
   			    },
   				complete: function(){
   					$("#loading").remove();
   				},
   				data:{
   					period:"",
   					teach_id:$("#select-class").val()
   				},
   				success:function(data){
   					console.log(data);
   					$("#list").html(periodList_Supply(data));
   					callJTable();
   					if(data==""){
   						$("#btn-change").attr("disabled",true);
   					}else{
   						$("#btn-change").attr("disabled",false);
   					}
   					
   				},
   				error: function(jqXHR, exception) {
   	          		catchErr(jqXHR, exception);
   	            }
   			});
   		 }
         function periodList_Supply(data){
        	 if(data=="")return null;
        	 var len=data.length;
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID CARD</th>"+
								"<th class='sort-alpha'>STUDENT NAME</th>"+
								"<th class='sort-alpha'>PERIOD DATE</th>"+
								"<th class='sort-alpha'>CURRENT</th>"+
								"<th class='sort-alpha'>TEACHER</th>"+
								"<th class='sort-alpha'>AM/PM</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
					   for(var i=0;i<len;i++){
						table+= "<tr>"+
									"<td>"+data[i]['id_card_stu']+"</td>"+
									"<td>"+data[i]['student_name']+"</td>"+
									"<td>"+data[i]['period_date']+"</td>"+
									"<td>"+data[i]['period_type']+"</td>"+
									"<td>"+data[i]['teacher_name']+" | "+data[i]['id_card_emp']+"</td>"+
									"<td><select class='times' id="+data[i]['student_id']+">"+
											"<option value='' selected></option>";
											
												table+="<option value='am'>AM</option>";
											
												table+="<option value='pm'>PM</option>";
										"</select>"+
									"</td>"+
								"</tr>";
						}
						table+="</tbody></table>";
				if(data==null)
				return "<span class='text-danger'>NO RECORD FOUND</span>";
			return table;
         }
         $("#btn-change").on("click",function(){
        	 arr=[];
        	
				$("[class*='times']").each(function(index,obj){
					var per=$(obj).val();
					arr.push("{\"period_type\":\""+per+"\"");
					var id=	$(obj).attr("id");
					arr.push("\"student_id\":\""+id+"\"}");
					
				});
				var js="{\"data\":["+arr+"]}";
				 if(js!=null){
					$.ajax({
						url:"period_change",
						method:"POST",
						beforeSend: function() {
		   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
		   			    },
		   				complete: function(){
		   					$("#loading").remove();
		   				},
						data:{
							check_period:js
						},
						success:function(data){
							alertify.logPosition("bottom right");
		 					if(data=="true"){
		 						alertify.success("PERIOD HAS BEEN CHANGED !");
		 						$("#select-class").change();
		 					}else{
		 						swal('FAILED','Period unable change! check your data entried','error');
		 					}
						},
		   				error: function(jqXHR, exception) {
		   	          		catchErr(jqXHR, exception);
		   	            }
					});
				}
         });
         function callJTable(){
        	 var tab=$('#tb_list').DataTable({searchHighlight: true});
 				tab.on( 'draw', function () {
 		        var body = $( tab.table().body() );
 		        body.unhighlight();
 		        body.highlight( tab.search() );  
 		    } );
		 }
		$("#branch-list").on("change", function() {
			listSubProg();
		});
		$("#select-subprog").on("change", function() {
			getListTeaching();
			listClass($("#select-subprog").val());
		});
		$("#select-class").on("change",function(){
			periodList();
		});
		 $(function(){
             $('.card-head .tools .btn-refresh').on('click', function (e) {
           		var card = $(e.currentTarget).closest('.card');
           		materialadmin.AppCard.addCardLoader(card);
           		
           		setTimeout(function () {
           			materialadmin.AppCard.removeCardLoader(card);
           		}, $("#select-class").change());
       		});
		 });
	</script>
</body>
</html>
