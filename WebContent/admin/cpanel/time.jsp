	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
		<title>CAMBRIGHT | Time Management</title>

		<!-- BEGIN META -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- END META -->

		<!-- BEGIN MAIN CSS -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900' rel='stylesheet' type='text/css'/>
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/bootstrap.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/materialadmin.css" />	
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/font-awesome.min.css" />		
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/material-design-iconic-font.min.css" />
		<!-- END MAIN CSS -->
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
		<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
		
	</head>
	<body class="menubar-hoverable header-fixed ">
		
		<jsp:include page="${pageContext.servletContext.contextPath }/../mastertop/header.jsp"></jsp:include>

		<!-- BEGIN BASE-->
		<div id="base">
			<!-- BEGIN CONTENT-->
			<div id="content">
				<section>
					<div class="section-body">
					 <div class="section-header">
						<ol class="breadcrumb">
							<li class="active">SCHEDUAL MANAGEMENT</li>
						</ol>
					  </div>
					  		
						<div class="row">
							<div class="col-md-12">
							   <div class="card card-outlined style-info no-padding">
									<div class="card-head card-head-sm card-body style-info no-padding">
										<header>SCHEDUAL LIST</header>
										<div class="tools">
											<span data-toggle="modal" data-target=".open-modal" data-backdrop="static" data-keyboard="false">
												<a class="btn ink-reaction btn-floating-action btn-info" data-toggle="tooltip" data-placement="top" title="Create more" href="#"><i class="fa fa-plus"></i></a>
											</span>
										</div>
									</div><!--end .card-head -->
									<div class="card-body">
									  <div class="table-responsive" id="list-time">
										
									  </div>
									</div><!--end .card-body -->
								</div><!--end .card -->
						   </div><!--end .col-md-8 -->
						</div><!--end .row -->
					</div><!--end .section-body -->
				</section>
			</div><!--end #content-->
			<!-- END CONTENT -->

			<!-- BEGIN MENUBAR-->
			<jsp:include page="${pageContext.servletContext.contextPath }/../masterleft/menubar.jsp"></jsp:include>
			<!-- END MENUBAR -->
		</div><!--end #base-->
		<!-- END BASE -->
		
		<!-- MODAL CREATE -->
		<div class="modal fade open-modal" tabindex="-1" role="dialog" >
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="card card-outlined style-primary" style="margin-bottom: 0px">

						<div class="card-head card-head-sm style-primary">
							<header>ENROLLMENT TIME FORM</header>
							<div class="tools">
								<a class="btn ink-reaction btn-floating-action btn-default-light btn-xs" data-dismiss="modal"><i class="md md-close"></i></a>
							</div>
						</div>
						<!--end .card-head -->
					<div class="card-body">
						<form class="form" id="fm-prog">
							
							<div class="form-group floating-label">
								<select class="form-control list-sub-prog" required>

								</select> <label for="select2">SUB-PROGRAM</label>
							</div>
							
							<div class="form-group floating-label">
								<select class="form-control" id="list-class" required>

								</select> <label for="select2">CLASS</label>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
									<div class="input-group-content">
										<input type="time" class="form-control time12-mask" id="amstart" > <label>START</label>
									</div>
									<div class="input-group-content">
										<input type="time" class="form-control time12-mask" id="amend" >
										<label>END</label>
										<p class="help-block">Time: AM</p>
									</div>
								</div>

							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
									<div class="input-group-content">
										<input type="time" class="form-control time12-mask" id="pmstart" > <label>START</label>
									</div>
									<div class="input-group-content">
										<input type="time" class="form-control time12-mask" id="pmend" >
										<label>END</label>
										<p class="help-block">Time: PM</p>
									</div>
								</div>

							</div>
							<div class="form-footer">
								<div class="row">
									<div class="col-sm-5 col-offset-7">
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
					<!-- end .card -->
				</div>
			</div>
		</div>
		<!--END MODAL CREATE -->
		
		
		<!-- MAIN SCRIPT -->
		<script src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap/bootstrap.min.js"></script>		
		<script src="${pageContext.servletContext.contextPath }/assets/js/core/source/App.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
		<!-- END MAIN SCRIPT  -->
		<script src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
		<script src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
		
        <script type="text/javascript">
         
         $('#table1').DataTable();
         $("#schedual").addClass("active");
         $('[data-toggle="tooltip"]').tooltip();
         
         timeList();
         //IN FORM
         listSubProg();
         classList();
		  function listSubProg(){
				$.ajax({
					url:"subproglist.json",
					dataType:"json",
					type:"POST",
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						
						$(".list-sub-prog").html(listSubProg_Supply(data)).change();
						
					},
	              	error: function(jqXHR, exception) {
	              		catchErr(jqXHR, exception);
	                }
				});
			}
			
			function listSubProg_Supply(data){
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<optgroup label='"+data[i].branch_name+"'>";
					list +="<option value="+data[i].subprog_id+">"+data[i].subprog_title+"</option>";
					list+="</optgroup>";
				}
				return list;
			}
			
			function classList(){
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
						$("#list-class").html(classList_Supply(data)).change();
						
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
    		
			function classList_Supply(data){
				var list="";
				for(var i=0;i<data.length;i++){
					list +="<option value="+data[i].class_id+">"+data[i].class_title+"</option>";
				}
				return list;
			}
    //END in from list//
    
   
			function createTime(){
				$.ajax({
					url:"time_created",
					type:"POST",
					data:{
						subprog_id:$(".list-sub-prog").val(),
						class_id:$("#list-class").val(),
						amstart:$("#amstart").val(),
						amend:$("#amend").val(),
						pmstart:$("#pmstart").val(),
						pmend:$("#pmend").val(),
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						alertify.logPosition("bottom right");
						if(data=="true"){
							alertify.success("CREATE SUCCESSFULLY !");
							 timeList();
						}else{
							swal("FAILED","Unable to create !","error");
						}
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
			function updateTime(){
				$.ajax({
					url:"time_updated",
					type:"POST",
					data:{
						subprog_id:$(".list-sub-prog").val(),
						class_id:$("#list-class").val(),
						amstart:$("#amstart").val(),
						amend:$("#amend").val(),
						pmstart:$("#pmstart").val(),
						pmend:$("#pmend").val(),
						time_id:$("#btn-update").val()
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						alertify.logPosition("bottom right");
						if(data=="true"){
							alertify.success("UPDATED SUCCESSFULLY !");
							 timeList();
						}else{
							swal("FAILED","Unable to update !","error");
						}
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
			//LIST TABLE TIME
    		function timeList(){
				$.ajax({
					url:"timelist.json",
					type:"POST",
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						console.log(data);
						$("#list-time").html(timeList_Supply(data));
						callJTable();
						$('[data-toggle="tooltip"]').tooltip();
						
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
    		
			function timeList_Supply(data){
				var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
							"<th class='sort-alpha'>CLASS NUMBER</th>"+
							"<th class='sort-alpha'>SUB-PROGRAM</th>"+
							"<th class='sort-alpha'>AM</th>"+
							"<th class='sort-alpha'>PM</th>"+
							"<th>ACTION</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
				for(var i=0;i<data.length;i++){
					table+= "<tr>"+
								"<td><span class='badge' style='background-color:"+data[i].class_color+"'>"+data[i].class_title+"</span></td>"+
								"<td>"+data[i].subprog_title+"</td>"+
								"<td>"+data[i].amstart+"-"+data[i].amend+"</td>"+
								"<td>"+data[i].pmstart+"-"+data[i].pmend+"</td>"+
								"<td>";
								 table+="<span data-toggle='modal' data-target='.open-modal' data-backdrop='static' data-keyboard='false'>"+
								 			"<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i].time_id+"','"+data[i].class_id+"','"+data[i].class_title+"','"+data[i].class_color+"','"+data[i].subprog_id+"','"+data[i].amstart+"','"+data[i].amend+"','"+data[i].pmstart+"','"+data[i].pmend+"')\" ><i class='fa fa-edit'></i></button>"+
								 		"</span>"+
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
			
    		
			function edit(time_id,class_id,class_title,class_color,subprog_id,amstart,amend,pmstart,pmend){
				$("#list-class").prop("selected",true).val(class_id).change();
				$("#list-sub-prog").prop("selected",true).val(subprog_id).change();
				$("#amstart").val(amstart);
				$("#amend").val(amend);
				$("#pmstart").val(pmstart);
				$("#pmend").val(pmend);
				$("#btn-update").val(time_id);
				$('#btn-create').css("display","none");
				$('#btn-update').css("display","inline");
				$('#btn-reset').css("display","inline");
			}
			
    		$('#btn-reset').on("click",function(){
				reset();
			});
    		
    		$("a[data-dismiss='modal']").on("click",function(){
    			reset();
    		});
    		
    		function reset(){
    			$('#btn-update').css("display","none")
				.val("");
				$('#btn-reset').css("display","none");
				$('#btn-create').css("display","inline");
    			$('#btn-update').val('');
    			$("#amstart").val(null);
    			$("#amend").val(null);
    			$("#pmstart").val(null);
    			$("#pmend").val(null);
    			
    		}
    		
    		$("#fm-prog").submit(function(e){
    			e.preventDefault();
    			if(($('#btn-update').val())==""){
    				createTime();
    			}else{
    				updateTime();
    			}
    			$(".open-modal").modal('hide');
    		});
    			
         </script>
	</body>
</html>
