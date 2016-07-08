
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Program Management</title>
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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/typeahead/typeahead.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />

</head>
<body class="menubar-hoverable header-fixed ">

	<jsp:include
		page="/mastertop/header.jsp"></jsp:include>

	<!-- BEGIN BASE-->
	<div id="base">
		<!-- BEGIN CONTENT-->
		<div id="content">
			<section>
				<div class="section-body">
					<div class="section-header">
						<ol class="breadcrumb">
							<li class="active">PROGRAM MANAGEMENT</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-info no-padding">
								<div
									class="card-head card-head-sm card-body style-info no-padding">
									<header>PROGRAM LIST</header>
<c:if test="${adminsession.user_level==0}">									
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
									<div class="table-responsive"></div>
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

		<!-- MODAL CREATE -->
		<div class="modal fade open-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="card card-outlined style-primary"
						style="margin-bottom: 0px">

						<div class="card-head card-head-sm style-primary">
							<header>ENROLLMENT SUB-PROGRAM FORM</header>
							<div class="tools">
								<a
									class="btn ink-reaction btn-floating-action btn-default-light btn-xs"
									data-dismiss="modal"><i class="md md-close"></i></a>
							</div>
						</div>
						<!--end .card-head -->
						<div class="card-body">
							<form class="form" id="fm-prog">
								<div class="form-group floating-label">
									<select class="form-control list-main-prog">

									</select> <label for="list-main-prog">MAIN PROGRAM​</label>
								</div>
								<div class="form-group floating-label">
									<input type="text" class="form-control" id="subprog-title" required>
									<label for="subprog-title">SUB-PROGRAM TITLE</label>
								</div>
								<div class="form-group floating-label">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-usd fa-lg"></i></span>
										<div class="input-group-content">
											<input type="number" min="1" class="form-control" id="term"
												required> <label for="term">1TERM</label>
										</div>
										<div class="input-group-content">
											<input type="number" min="1" class="form-control" id="sem"
												required> <label for="sem">1SEM</label>
										</div>
										<div class="input-group-content">
											<input type="number" min="1" class="form-control" id="year"
												required> <label for="year">1YEAR</label>
										</div>
									</div>
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



		<!-- BEGIN MENUBAR-->
		<jsp:include
			page="/masterleft/menubar.jsp"></jsp:include>
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
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>

	<script type="text/javascript">
		$("#addsubprog").addClass("active");
		
		listSubProg();
		function callJTable(){
			$('table').DataTable();
		}
		
"<c:if test='${adminsession.user_level==0}'>"
		listMainProg();
		function addSubProg() {
			
				$.ajax({
					url: "sub_prog_create",
					type: "POST",
					data:{
						prog_id:$(".list-main-prog").val(),
						subprog_title:$("#subprog-title").val(),
						term:$("#term").val(),
						sem:$("#sem").val(),
						year:$("#year").val(),
						amstart:$("#amstart").val(),
						amend:$("#amend").val(),
						pmstart:$("#pmstart").val(),
						pmend:$("#pmend").val()
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success : function(data) {
						alertify.logPosition("bottom right");
						if(data=="true"){
							reset();
							alertify.success("CREATE SUCCESSFULLY !");
							listSubProg();
						}else{
							swal('FAILED!','Unable create','error');
						}
					}
				});
			
		}
		function listMainProg(){
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
					console.log(data);
					$(".list-main-prog").html(listMainProg_Supply(data)).change();
					
				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
			});
		}
		
		function listMainProg_Supply(data){
			var list="";
			for(var i=0;i<data.length;i++){
				list+="<optgroup label='"+data[i].branch_name+"'>";
				list +="<option value="+data[i].prog_id+">"+data[i].prog_title+"</option>";
				list+="</optgroup>";
			}
			return list;
		}
"</c:if>"	




		//LIST TABLE
		function listSubProg(){
			$.ajax({
				url:"subproglist.json",
				dataType:"json",
				method:"POST",
				beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
				success:function(data){
					
					$(".table-responsive").html(subProgList_Supply(data));
					callJTable();
					$('[data-toggle="tooltip"]').tooltip();
					
				},
				error: function(jqXHR, exception) {
	          		catchErr(jqXHR, exception);
	            }
			});
		}
		
		function subProgList_Supply(data){
			console.log(data);
			var table="<table class='table'>"+
						"<thead>"+
						"<tr>"+
							"<th class='sort-alpha'>BRANCH</th>"+
							"<th class='sort-alpha'>MAIN-PROGRAM</th>"+
							"<th class='sort-alpha'>SUB-PROGRAM</th>"+
							"<th class='sort-numeric'>1TERM</th>"+
							"<th class='sort-numeric'>1SEM</th>"+
							"<th class='sort-numeric'>1SEM</th>"+
							"<th class='sort-numeric'>AM</th>"+
							"<th class='sort-numeric'>PM</th>"+
							"<th>ACTION</th>"+
						"</tr>"+
					"</thead>"+
					"<tbody>";
			for(var i=0;i<data.length;i++){
				table+="<tr>"+
						"<td><span class='badge' style='background-color:"+data[i].branch_color+"'>"+data[i].branch_name+"</span></td>"+
						"<td>"+data[i].prog_title+"</td>"+
						"<td>"+data[i].sub_prog_title+"</td>"+
						"<td>"+"$"+data[i].term_fee+"</td>"+
						"<td>"+"$"+data[i].sem_fee+"</td>"+
						"<td>"+"$"+data[i].year_fee+"</td>"+
						"<td>"+data[i].amstart+"-"+data[i].amend+"</td>"+
						"<td>"+data[i].pmstart+"-"+data[i].pmend+"</td>"+
						"<td>";
						"<c:if test='${adminsession.user_level==0}'>"
						table+="<span data-toggle='modal' data-target='.open-modal' data-backdrop='static' data-keyboard='false'>"+
								"<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='edit' onClick=\"edit('"+data[i].subprog_id+"','"+data[i].sub_prog_title+"','"+data[i].term_fee+"','"+data[i].sem_fee+"','"+data[i].year_fee+"','"+data[i].prog_id+"','"+data[i].amstart+"','"+data[i].amend+"','"+data[i].pmstart+"','"+data[i].pmend+"')\"><i class='fa fa-edit'></i></button>"+
							   "</span>"+
							   "<button type='button'class='btn ink-reaction btn-floating-action btn-xs btn-danger'data-toggle='tooltip' data-placement='top' title='Remove' onClick=\"isDelete('"+data[i].subprog_id+"','"+data[i].prog_id+"')\"><i class='fa fa-trash'></i></button>"+
						"</c:if>"	   
						"</td>"+
					"</tr>";
				
				
			}
			table+="</tbody>"+
			"</table>";
			return table;
		}
		
		
		
"<c:if test='${adminsession.user_level==0}'>"				
		function edit(subprog_id,subprog_title,term,sem,year,prog_id,amst,amend,pmst,pmend){
			
			$('#btn-create').css("display","none");
			$('#btn-update').css("display","inline");
			$('#btn-reset').css("display","inline");
			$(".list-main-prog").val(prog_id)
			.change();
			$("#subprog-title").val(subprog_title)
			.change();
			$("#term").val(term)
			.change();
			$("#sem").val(sem)
			.change();
			$("#year").val(year)
			.change();
			$("#amstart").val(amst);
			$("#amend").val(amend);
			$("#pmstart").val(pmst);
			$("#pmend").val(pmend);
			$("#btn-update").val(subprog_id);
		}
		
		function isDelete(subprog_id,prog_id){
  			swal({   
  			 title: "Are you sure?",   
 				 text: "You will not be able to recover this Sub-Program!",   
 				 type: "warning",   
 				 showCancelButton: true,   
 				 confirmButtonColor: "#DD6B55",   
 				 confirmButtonText: "Yes, remove it!",   
 				 closeOnConfirm: false 
 	   		    }, function(){    
 	   		    	$.ajax({
 	    				url:"subprog_del",
 	    				method:"POST",
 	    				data:{
 	    					prog_id:prog_id,
 	    					subprog_id:subprog_id
 	    				},
 	    				success:function(data){
 	    					if(data=="true"){
 	       						swal({
 	       							title:"REMOVED..!", 
 	       							text:"Program has been removed..!", 
 	       							type:"success",
 	       							timer:1500
 	       						},function(){
 	       							listSubProg();
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
		 function updateSubProg(){
			$.ajax({
				url:"subprog_update",
				method:"POST",
				data:{
					subprog_id:$("#btn-update").val(),
					prog_id:$(".list-main-prog").val(),
					subprog_title:$("#subprog-title").val(),
					term:$("#term").val(),
					sem:$("#sem").val(),
					year:$("#year").val(),
					amstart:$("#amstart").val(),
					amend:$("#amend").val(),
					pmstart:$("#pmstart").val(),
					pmend:$("#pmend").val()
				},
				success:function(data){
					alertify.logPosition("bottom right");
					if(data=="true"){
						reset();
						alertify.success("UPDATE SUCCESSFULLY !");
						listSubProg();
					}else{
						swal({
   							title:"FAILED..!", 
   							text:"Unable to update..!", 
   							type:"error"
   						});
					}
				}
			});
		}
		$("#btn-reset").on("click",function(){
			reset();
		});
		$("#fm-prog").submit(function(e){
			e.preventDefault();
			if($("#btn-update").val()==""){
				addSubProg();
			}else{
				updateSubProg();
			}
			$(".open-modal").modal('hide');
			reset();
		});
		
		function reset(){
			$('#btn-update').css("display","none").val("");
			$('#btn-reset').css("display","none");
			$('#btn-create').css("display","inline");
			$('#btn-update').val('');
			$("#sub-prog-title").val("").change();
			$("#term").val("").change();
			$("#sem").val("").change();
			$("#year").val("").change();
			
		}
		$(".btn-warning").on("click",function(){
			reset();
		});
"</c:if>"
	</script>
</body>
</html>
