
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html">
<html>
<head>
<title>CAMBRIGHT | Position Management</title>
<c:if test="${adminsession.user_level !=0 }">
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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/jquery-ui/jquery-ui-theme.css">
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
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
							<li class="active">POSITION MANAGMENT</li>
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
									<form class="form" id="fm-pos">
										<div class="form-group floating-label">
											<input type="text" class="form-control" id="position"
												required data-source="data/position.json"> <label
												for="position">POSITION</label>
											<p class="help-block">Ex: Accounting</p>
										</div>
										<div class="form-group floating-label">
											<input type="number" class="form-control" id="salary"
												required> <label for="salary">SALARY $$</label>
											<p class="help-block">Ex: 200</p>
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
								<!--end .card-body -->
							</div>
							<!--end .card -->
						</div>
						<div class="col-md-8">
							<div class="card card-outlined style-info no-padding">
								<div
									class="card-head card-head-sm card-body style-info no-padding">
									<header>POSITION LIST</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="pos-list"></div>
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
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	
	<script type="text/javascript">
         $("#addposition").addClass("active");
         $('#table1').DataTable();
         $('[data-toggle="tooltip"]').tooltip();
         tablePosition();
         function positionCreate(){
        	 $.ajax({
        		 url:"position_create",
        		 method:"POST",
        		 data:{
        			 position:$("#position").val(),
        			 salary:$("#salary").val()
        		 },
        		 success:function(data){
        			alertify.logPosition("bottom right");
 					if(data=="true"){
 						alertify.success("CREATE SUCCESSFULLY !");
 						tablePosition();
 					}else{
 						swal("FAILED","Unable to create !","error");
 					} 
        		 },
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         function positionUpdate(){
        	 $.ajax({
        		 url:"position_update",
        		 method:"POST",
        		 data:{
        			 position:$("#position").val(),
        			 salary:$("#salary").val(),
        			 pos_id:$("#btn-update").val()
        		 },
         		
        		 success:function(data){
        			alertify.logPosition("bottom right");
 					if(data=="true"){
 						alertify.success("UPDATE SUCCESSFULLY !");
 						tablePosition();
 					}else{
 						swal("FAILED","Unable to update !","error");
 					}
 					reset();
        		 },
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         
         function tablePosition(){
 			$.ajax({
 				url:"positionlist.json",
				dataType:"json",
 				type:"POST",
 				 beforeSend: function() {
  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
  			     },
  				 complete: function(){
  					$("#loading").remove();
  				 },
 				success:function(data){
 					$("#pos-list").html(listPosSupply(data));
 					callJTable();
 					$('[data-toggle="tooltip"]').tooltip();
 					
 				},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
 			});
 		}
         
         function listPosSupply(data){
        	 var table="<table class='table' id='tb_list'>";
	 			table+="<thead>"+
	 					"<tr>"+
	 						"<th class='sort-alpha'>POSITION</th>"+
	 						"<th class='sort-numberic'>SALARY</th>"+
	 						"<th>ACTION</th>"+
	 					"</tr>"+
	 				   "</thead>"+
	 				   "<tbody>";
	 			for(var i=0;i<data.length;i++){
	 				table+= "<tr>"+
	 							"<td>"+data[i].position+"</td>"+
	 							"<td>"+"$ "+data[i].salary+"</td>"+
	 							"<td>"+
	 							  "<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-warning' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i].position_id+"','"+data[i].position+"','"+data[i].salary+"')\" ><i class='fa fa-edit'></i></button>"+ 
	 							"</td>"+
	 						"</tr>";
	 			}
	 			table+="</tbody></table>";
	 			if(data==null)
	 				return "<span class='text-danger'>NO RECORD FOUND</span>";
	 			return table;
         }
         
        function edit(pos_id,position,salary){
 			$('#btn-create').css("display","none");
 			$('#btn-update').css("display","inline");
 			$('#btn-reset').css("display","inline");
 			
 			$("#position").val(position);
 			$("#position").change();
 			$("#salary").val(salary);
 			$("#salary").change();
 			
 			$("#btn-update").val(pos_id);		
 			
 		}
        
        function reset(){
			$('#btn-update').css("display","none")
			.val("");
			$('#btn-reset').css("display","none");
			$('#btn-create').css("display","inline");
			$("#position").val("")
			.change();
			$("#salary").val("")
			.change();
			
		}
         
         function callJTable(){
 			$('#tb_list').DataTable();
 		 }
         
         $("#btn-reset").on("click",function(){
        	 reset();
         });
         
         $("#fm-pos").submit(function(e){
 			e.preventDefault();
 			if(($('#btn-update').val())==""){
 				positionCreate();
 				reset();
 			}else{
 				positionUpdate();
 			
 				
 			}
 			//$(".open-modal").modal('hide');
 		});
         
    </script>
    
    <script>   
        	$.ajax({
     			url: $('#position').data('source'),
     			success: function (pos) {
     				$("#position").autocomplete({
     					source: function (request, response) {
     						var results = $.ui.autocomplete.filter(pos, request.term);
     						response(results.slice(0, 10));
     					}
     				});
     			},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
     		});
       
         </script>
</body>
</html>
