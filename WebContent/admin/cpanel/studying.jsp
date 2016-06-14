
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
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<form class="form">
										<div class="row">
											<div class="col-md-3">
												<div class="form-group floating-label">
													<select class="form-control" id="branch-list">

													</select> <label>BRANCH</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group floating-label">
													<select class="form-control" id="list-main-prog">

													</select> <label>PROGRAM TYPE</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class="form-control" id="list-lv">

													</select> <label>LEVEL</label>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group floating-label">
													<select class="form-control" id="list-class">

													</select> <label>CLASS</label>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group floating-label">
													<select class="form-control" id="ampm">
														<option value="am">AM</option>
														<option value="pm">PM</option>
													</select> <label>PERIOD</label>
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
          $("#studying").addClass("active");
          $('#pickerDOB').datepicker({
         	 format: 'yyyy/mm/dd',
          });
          //listStudInfo();
          listBranch();
			
          
          //FILTER BRANCH
          
          function listBranch(){
   			$.ajax({
   				url:"branchlistactive.json",
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
   					else
   						$("#branch-list").empty();
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
          
          $("#branch-list").on("change",function(){
       		$.ajax({
       			url:"list_main_pro_aft_branch.json",
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
       				if(data!=undefined)
	       				$("#list-main-prog").html(listMainProg_Supply(data))
	       				.change();
       				else
       					$("#list-main-prog").empty().change();
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
          
          function listLevel(){
				$.ajax({
					url:"stud_list_level_af_prog_main.json",
					dataType:"json",
					method:"POST",
					data:{
						branch_id:$("#branch-list").val(),
						prog_id:$("#list-main-prog").val(),
						action:"studying"
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						if(data!=""){
							$("#list-lv").html(listLv_Supply(data))
							.change();
						}else{
							$("#list-lv").empty().change();
						}
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
          
			$("#list-main-prog").on("change",function(){
					listLevel();
			});
			
			function listClass(){
				$.ajax({
					url:"list_class_aft_lvl.json",
					//dataType:"json",
					method:"POST",
					data:{
						branch_id:$("#branch-list").val(),
						prog_id:$("#list-main-prog").val(),
						lvl:$("#list-lv").val(),
						action:"studying"
					},
					beforeSend: function() {
						$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
				    },
					complete: function(){
						$("#loading").remove();
					},
					success:function(data){
						if(data!="error"){
							$("#list-class").html(listClass_Supply(data)).change();
							
						}else{
							$("#list-class").empty().change();
							
						}
					},
					error: function(jqXHR, exception) {
		          		catchErr(jqXHR, exception);
		            }
				});
			}
    	
			function listClass_Supply(data){
    		
				var list="";
				for(var i=0;i<data.length;i++){
					list+="<option value="+data[i].class_id+">"+data[i].class_number+"</option>";
				}
				
				return list;
			}
			function period(){
				$("#ampm").html();
			}
			
			$("#list-lv").on("change",function(){
				listClass();
			});
			var ampm="am";
			$("#ampm").on("change",function(){
				ampm=$(this).val();
				if(($("#list-lv").val())!=null && ($("#list-class").val())!=null){
					listStudInfo();	
				}else{
					swal("FAILED","Select level or class..!","error");
				}
				
			});
			
			$("#list-class").on("change",function(){
				listStudInfo();	
			});
			
			
         function listStudInfo(){
   			if($("#list-lv").val()!=null &&$("#list-class").val()!=null){
	        	 $.ajax({
	   				url:"list_table_period.json",
	   				method:"POST",
	   				beforeSend: function() {
	   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
	   			    },
	   				complete: function(){
	   					$("#loading").remove();
	   				},
	   				data:{
	   					period:ampm,
	   					prog_t_id:$("#list-lv").val(),
	   					class_id:$("#list-class").val()
	   				},
	   				success:function(data){
	   					$("#list").html(listStudInfo_Supply(data));
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
   		 }
         function listStudInfo_Supply(data){
        	 if(data=="")return null;
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID</th>"+
								"<th class='sort-alpha'>ENG NAME</th>"+
								"<th class='sort-alpha'>CLASS NUM</th>"+
								"<th class='sort-alpha'>LEVEL</th>"+
								"<th class='sort-alpha'>TEACHED</th>"+
								"<th class='sort-alpha'>PERIOD</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
					   for(var i=0;i<data.length;i++){
						  
								table+= "<tr>"+
											"<td>"+data[i]['id_card']+"</td>"+
											"<td>"+data[i]['en_name']+"</td>"+
											"<td>"+data[i]['class_num']+"</td>"+
											"<td>"+data[i]['lvl']+"</td>"+
											"<td>"+data[i]['teach_by']+"</td>"+
											"<td><select class='times' id="+data[i]['student_id']+">"+
													"<option value="+data[i]['period']+" selected>"+data[i]['period']+"</option>";
													if(data[i]['period']=="PM")
														table+="<option value='AM'>AM</option>";
													else
														table+="<option value='PM'>PM</option>";
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
					arr.push("{\"period\":\""+per+"\"");
					var id=	$(obj).attr("id");
					arr.push("\"id\":\""+id+"\"}");
					
				});
				var js="{\"data\":["+arr+"]}";
				
				if(js!=null){
					$.ajax({
						url:"study_change_period",
						method:"POST",
						beforeSend: function() {
		   					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
		   			    },
		   				complete: function(){
		   					$("#loading").remove();
		   				},
						data:{
							stud_list:js
						},
						success:function(data){
							alert(data);
							alertify.logPosition("bottom right");
		 					if(data=="true"){
		 						alertify.success("TIME HAS BEEN CHANGED !");
		 						listStudInfo();
		 					}else{
		 						swal('FAILED','Time unable change!','error');
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
			$('[data-toggle="tooltip"]').tooltip();
	 	 }
         </script>
</body>
</html>
