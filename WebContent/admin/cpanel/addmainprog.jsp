
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<title>CAMBRIGHT | Main Program Management</title>
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
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
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
							<li class="active">MAIN PROGRAM MANAGMENT</li>
						</ol>

					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-info no-padding">
								<div
									class="card-head card-head-sm card-body style-info no-padding">
									<header>MAIN PROGRAM LIST</header>
<c:if test='${adminsession.user_level==0 }'>									
									<div class="tools">
										<span data-toggle="modal" data-target=".open-modal"
											data-backdrop="static" data-keyboard="false"> <a
											class="btn ink-reaction btn-floating-action btn-info"
											data-toggle="tooltip" data-placement="top"
											title="Create more" href="#"><i class="fa fa-plus"></i></a>
										</span>
									</div>
</c:if>									
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="prog-main-list"></div>
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

		<!-- MODAL VIEW -->
		<div class="modal fade open-modal" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="card card-outlined style-primary"
						style="margin-bottom: 0px">
						<div class="card-head card-head-sm style-primary">
							<header>ENTRY FORM</header>
							<div class="tools">
								<a
									class="btn ink-reaction btn-floating-action btn-default-light btn-xs"
									data-dismiss="modal"><i class="md md-close"></i></a>
							</div>
						</div>
						<!-- end .card-head -->
						<div class="card-body">
							<form class="form" id="fm-prog">
								<div class="form-group floating-label">
									<input type="text" class="form-control" id="prog-type"
										required="true"> <label for="prog-type">PROGRAM
										CATEGORY</label>
									<p class="help-block">Ex: Nursery Program</p>
								</div>
								<div class="form-group floating-label ">
									<select class='form-control select2-list'  data-placeholder='SELECT BRANCH' multiple id='select-branch' required>
									
									</select>
								</div>
								<div class="form-footer">
									<div class="form-group">
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
							</form>
						</div>
						<!-- end .card-body -->
					</div>
					<!-- end .card -->
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<!-- END MAIN SCRIPT  -->
	`
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$("#mainprog").addClass("active");
		tableProgMain();
"<c:if test='${adminsession.user_level==0}'>"		
		listBranch();
		function listBranch() {
			$.ajax({
				url : "branchlistactive.json",
				dataType:"json",
				type : "POST",
				success : function(data) {
					$("#select-branch").html(listBranch_Supply(data));
					$(".select2-list").select2();
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
"</c:if>"



		function tableProgMain(){
			$.ajax({
				url:"progmainlist.json",
				dataType:"json",
				type:"POST",
				beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
				success:function(data){
					$("#prog-main-list").html(listProgMain(data));
					callJTable();
					$('[data-toggle="tooltip"]').tooltip();
					
				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
			});
		}
		
		function callJTable(){
			$('#tb_list').DataTable();
		}
		
		function listProgMain(data){
			var table="<table class='table' id='tb_list'>";
			table+="<thead>"+
						"<tr>"+
						"<th class='sort-alpha'>MAIN PROGRAM</th>"+
						"<th class='sort-numeric'>NUMBER OF SUB-PROGRAM</th>"+
						"<th class='sort-numeric'>BRANCH</th>"+
						"<th>ACTION</th>"+
					"</tr>"+
				   "</thead>"+
				   "<tbody>";
			for(var i=0;i<data.length;i++){
				table+= "<tr>"+
							"<td>"+data[i].prog_title+"</td>"+
							"<td><span class='badge style-accent-light'>"+data[i].num_subprog+"</span></td>"+
							"<td><span class='badge' style='background-color:"+data[i].br_color+"'>"+data[i].branch_name+"</span></td>"+
							"<td>";
							"<c:if test='${adminsession.user_level==0}'>"
							table+="<span data-toggle='modal' data-target='.open-modal' data-backdrop='static' data-keyboard='false'>"+
										"<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i].prog_id+"','"+data[i].prog_title+"','"+data[i].branch_id+"','"+data[i].branch_name+"')\"><i class='fa fa-edit'></i></button>"+ 
							
									"</span>"+
									"<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Remove' onClick=\"isDelete('"+data[i].prog_id+"','"+data[i].branch_id+"')\" ><i class='fa fa-trash'></i></button>"+
							"</c:if>"
							"</td>"+
						"</tr>";
			}
			table+="</tbody></table>";
			if(data==null)
				return "<span class='text-danger'>NO RECORD FOUND</span>";
			return table;
		}
		
		
		
		
		
		
		
"<c:if test='${adminsession.user_level==0}'>"

		function createProgMain(){
			 $.ajax({
				url:"prog_main_create",
				method:"POST",
				data:{
					prog_title:$("#prog-type").val(),
					branch_id:($("#select-branch").val()).toString()
				},
				success:function(data){
					alertify.logPosition("bottom right");
					if(data=="true"){
						reset();
						tableProgMain();
						alertify.success("CREATE SUCCESSFULLY !");
						
					}else{
						swal('FAILED','Create failure','error');
					} 
				
				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
			});
			
		}
		
		function isDelete(prog_id,branch_id){
  			swal({   
  			 title: "Are you sure?",   
 				 text: "You will not be able to recover this Main program!",   
 				 type: "warning",   
 				 showCancelButton: true,   
 				 confirmButtonColor: "#DD6B55",   
 				 confirmButtonText: "Yes, remove it!",   
 				 closeOnConfirm: false 
 	   		    }, function(){    
 	   		    	$.ajax({
 	    				url:"prog_main_del",
 	    				method:"POST",
 	    				data:{
 	    					prog_id:prog_id,
 	    					branch_id:branch_id
 	    				},
 	    				success:function(data){
 	    					if(data=="true"){
 	       						swal({
 	       							title:"REMOVED..!", 
 	       							text:"Program has been removed..!", 
 	       							type:"success",
 	       							timer:1500
 	       						},function(){
 	       							tableProgMain();
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
		
		function updateProgMain(){
			$.ajax({
				url:"prog_main_update",
				type:"POST",
				data:{
					prog_id:$('#btn-update').val(),
					prog_title:$("#prog-type").val(),
					branch_id:($("#select-branch").select2("val")).toString()
				},
				success:function(data){
					alertify.logPosition("bottom right");
					if(data=="true"){
						alertify.success("UPDATE SUCCESSFULLY !");
						tableProgMain();
						reset();
					}else{
						swal('FAILED','Update failure','error');
					}
				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
			}); 
			console.log(($("#select-branch").select2("val")).toString())
		}
		
		function edit(prog_id,prog_title,branch_id,branch_title){
			$('#btn-create').css("display","none");
			$('#btn-update').css("display","inline");
			$('#btn-reset').css("display","inline");
			$("#prog-type").val(prog_title);
			$("#prog-type").change();
			$("#select-branch option").each(function(){
				if($(this).val()!=branch_id){
					$("#select-branch option[value='"+$(this).val()+"']").remove();
				}
			});
			$("#select-branch").select2("val",branch_id);
			$("#btn-update").val(prog_id);		
			
		}
		
		function reset(){
			$('#btn-update').css("display","none")
			.val("");
			$('#btn-reset').css("display","none");
			$('#btn-create').css("display","inline");
			$("#prog-type").val("");
			
			listBranch();
		}
		
		$('#btn-reset').on("click",function(){
			reset();
		});
		$('.btn-default-light').on("click",function(){
			reset();
		});
		
		$("#fm-prog").submit(function(e){
			e.preventDefault();
			if(($('#btn-update').val())==""){
				createProgMain();
			}else{
				
				updateProgMain();
			}
			$(".open-modal").modal('hide');
		});
"</c:if>"		
	</script>
</body>

</html>
