
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Employees Register</title>
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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.css" />
<!-- END MAIN CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/dist/alertify.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/select2/select2.css" />
<!-- END STYLESHEETS -->

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
							<li class="active">TASK</li>
						</ol>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-outlined style-primary">
								<div class="card-head card-head-sm style-primary">
									<header>ENTRY FORM</header>
									<div class="tools">
										<a class="btn btn-icon-toggle btn-refresh"><i class="md md-refresh"></i></a>
									</div>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<form class="form" id="fm-level">
										<div class="form-group floating-label">
											<select id="listbranch" class="form-control" placeholder="SELECT BRANCH">
												
											</select><label for="listbranch">BRANCH</label>
										</div>
										<div class="form-group floating-label" >
											<select class='form-control select2-list'  id='select-emp' required placeholder="SELECT TEACHER" >
											
											</select>
										</div>
										<div class="form-group floating-label">
											<select class='form-control select2-list' id='select-subprog' required placeholder="SELECT SUB-PROGRAM">
											
											</select>
										</div>
										<div class="form-group floating-label">
											<select class='form-control select2-list' id='select-class' required placeholder="SELECT CLASS">
											 
											</select>
										</div>
										<div class="form-footer">
											<div class="form-group">
												<button type="submit" id="btn-create"
														class="btn ink-reaction btn-raised btn-primary" disabled>ASSIGN
														NOW</button>
											</div>
										</div>
									</form>
								</div>
								<!--end .card-body -->
							</div>
						</div>
						<div class="col-md-9">
							<div class="card card-outlined style-primary no-padding">
								<div
									class="card-head card-head-sm card-body style-primary no-padding">
									<header>TEACHING LEVEL</header>
									<div class="tools">
										<a class="btn btn-icon-toggle btn-refresh-list"><i class="md md-refresh"></i></a>
									</div>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive" id="list"></div>
								</div>
								<!--end .card-body -->
							</div>
						</div>
					</div>
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppCard.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/spin.js/spin.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/alertify.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/select2/select2.min.js"></script>

	<!-- END JAVASCRIPT -->

	<script type="text/javascript">
         $("#teachtask").addClass("active");
         getListTeaching();
         
         listBranch();
         
         
        $("#listbranch").on("change",function(){
        	if($("#listbranch")!=""){
				getEmpList();
		        listSubProg();
			}else{
				alert("SELECT BRANCH FRIST!");
			}
        });
        
        
 		function listBranch() {
 			$.ajax({
 				url : "branchlistactivebranch.json",
 				dataType:"json",
 				type : "POST",
 				success : function(data) {
 					$("#listbranch").html(listBranch_Supply(data)).change();
 				},
 				error: function(jqXHR, exception) {
 	          		catchErr(jqXHR, exception);
 	            }
 			});
 		}
 		function listBranch_Supply(data) {
 			var list = "";
 			 var len=data.length;
 			for (var i = 0; i < len; i++) {
 				list += "<option value="+data[i].branch_id+">"
 						+ data[i].branch_name + "</option>";
 			}
 			return list;
 		}
         function getEmpList(){
        	 $.ajax({
        		url:"emplistactivebranch.json",
        		dataType:"json",
        		method:"POST",
        		data:{
        			branch_id:$("#listbranch").val()
        		},
        		beforeSend: function() {
					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
			    },
				complete: function(){
					$("#loading").remove();
				},
        		success:function(data){
        			
        			$("#select-emp").html(getEmpListSupply(data));
        			$("#select-emp").select2();
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         }
         function getEmpListSupply(data){
        	var empAval=empAvaliable(listTeaching,data);
        	//console.log(empAval)
        	var list = "";
        	 var len=empAval.length;
 			list+="<option></option>";
 			for (var i = 0; i < len; i++) {
 				if(empAval[i].user_level==3 ){
					list += "<option value="+empAval[i].emp_id+">"
					+ empAval[i].eng_name +" ["+ empAval[i].position+"]"+"</option>";
 				}
 			}
 			
 			return list;
         }
         
         function empAvaliable(listTeaching,data){
        	/*  console.log(listTeaching);
        	 console.log(data); */
        	 var result=[];
        	 var lent=listTeaching.length;
        	 var len=data.length;
        	 var tmp=null;
        	 if(listTeaching=="")return data;
        	 for(var i=0;i<len;i++){
        		 for(var j=0;j<lent;j++){
        			 if(data[i]['emp_id'] != listTeaching[j]['emp_id']){
        			 	tmp=data[i];
        			 }else{
        				 tmp=null;break;
        			 }
        		 }
        		 if(tmp!=null)result.push(tmp);
        		 
        	 } 
        	 return result;
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
         
         function listClassSupply(data,sub_prog_id){
        	 var cAval=classAvaliable(listTeaching,data);
        	 var list = "";
  			 var len=data.length;
  				list+="<option></option>";
  			for (var i = 0; i < len; i++) {
  				if(data[i].sub_prog_id==sub_prog_id)
	  				for(var j=0;j<cAval.length;j++){
	  				//checking if has the same program and not duplicate class
	  	  				if(cAval[j]['class_id']== data[i].class_id){
	  	  					list += "<option value="+data[i].class_id+">"
	  	  						+ data[i].class_title +"</option>";
	  	  				}	
	  				}
  				
  			}
  			
  			return list; 
         }
         //Find avaliable class, or class not yet taken
         function classAvaliable(listTeaching,data){
        	
        	 var result=[];
        	 var fin=[];
        	 var lent=listTeaching.length;
        	 var len=data.length;
        	 var tmp=null;
        	 //filter class in the same branch
        	 for(var i=0;i<len;i++){
        		 
       			 if(data[i]['branch_id']==$("#listbranch").val()){
   						tmp=data[i];
       			}else{
       				tmp=null ;
       			}
        		if(tmp!=null)result.push(tmp);
        	 }
        	 if(listTeaching==""){
        		  for(var i=0;i<result.length;i++){
        			 if(result[i]['sub_prog_id']==$("#select-subprog").val())
        				 fin.push(result[i]);
        		  } 
        	 }else{
        	//filter class in branch
	        	 for(var i=0;i<result.length;i++){
	        		 for(var j=0;j<lent;j++){
	        			 if(result[i]['class_id']!=listTeaching[j]['class_id']){
	        			 	tmp=result[i];
	        			 }else{
	        				 tmp=null;break;
	        			 }
	        		 }
	        		 if(tmp!=null)fin.push(tmp);
	        	 } 
        	 }
        	 
        	 return fin;
         }
         
         function listSubProg(){
 			$.ajax({
 				url:"subproglistbranch.json",
 				dataType:"json",
 				method:"POST",
 				data:{
 					branch_id:$("#listbranch").val()
        		},
 				beforeSend: function() {
 					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
 			    },
 				complete: function(){
 					$("#loading").remove();
 				},
 				success:function(data){
 					console.log(data);
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
  			
  			list+="<option></option>";
  			for (var i = 0; i < data.length; i++) {
  			
  				list += "<option value="+data[i].subprog_id+">"
  						+ data[i].sub_prog_title + "</option>";
  				
  			}
  			return list;
         }
         $("#select-subprog").on("change",function(){
        	 listClass($(this).val());
         });
       //LIST TABLE
       var listTeaching;
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
        			$("#list").html(getListTeachingSupply(data));
        			callJTable();
        			$('[data-toggle="tooltip"]').tooltip();
        		},
              	error: function(jqXHR, exception) {
              		catchErr(jqXHR, exception);
                }
        	 });
         };
         
         function getListTeachingSupply(data){
        	 console.log(data);
        	 var table="<table class='table' id='tb_list'>";
				table+="<thead>"+
							"<tr>"+
								"<th class='sort-alpha'>ID</th>"+
								"<th class='sort-alpha'>NAME</th>"+
								"<th class='sort-alpha'>WORK AT</th>"+
								"<th>PROGRAM</th>"+
								"<th>CLASS</th>"+
								"<th>ACTION</th>"+
						"</tr>"+
					   "</thead>"+
					   "<tbody>";
				for(var i=0;i<data.length;i++){
					table+= "<tr>"+
								"<td>"+data[i]['id_card']+"</td>"+
								"<td>"+data[i]['eng_name']+"</td>"+
								"<td><span class='badge' style='background-color:"+data[i]['branch_color']+"'>"+data[i]['empbranch']+"</span></td>"+
								"<td>"+data[i]['sub_prog_title']+"</td>"+
								"<td><span class='badge' style='background-color:"+data[i]['class_color']+"'>"+data[i]['class_name']+"</span> has <b>"+data[i]['student_num']+"</b> students at <b>"+data[i]['branch_name']+"</b></td>"+
								"<td>";
									if(data[i].status=='f'){
										table+="<button type='button' onClick=\"checkStatus('"+data[i].teach_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger btn-status'  data-toggle='tooltip' data-placement='top' title='Disabled'><i class='fa fa-close'></i></button>";
										
									}else{
										table+="<button type='button' onClick=\"checkStatus('"+data[i].teach_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info btn-status'  data-toggle='tooltip' data-placement='top' title='Enabled'><i class='fa fa-check'></i></button>";
									}
									 
									table+="<button type='button'  class='btn ink-reaction btn-floating-action btn-xs btn-danger' data-toggle='tooltip' data-placement='top' title='Remove' onClick=\"isDelete('"+data[i].teach_id+"')\" ><i class='fa fa-trash'></i></button>"+ 
								"</td>"+
							"</tr>";
				}
				table+="</tbody></table>";
				if(data==null)
					return "<span class='text-danger'>NO RECORD FOUND</span>";
				return table;
         }
         function assignTask(){
        	 $.ajax({
                	url:"assign_task",
                	method:"POST",
                	data:{
                		emp_id:$("#select-emp").val(),
                		class_id:$("#select-class").val()
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
							getListTeaching();
							getEmpList();
							alertify.success("ASSIGN SUCCESSFULLY !");
							
							reset();
						}else{
							swal('FAILED','Assign task failure','error');
						}
	               	},
	               	error: function(jqXHR, exception) {
	               		catchErr(jqXHR, exception);
	                }
              });
         }
         function callJTable(){
				$('#tb_list').DataTable();
		 }
         function checkStatus(teach_id,status){
				
				$.ajax({
					url:"teach_status",
					type:"POST",
					data:{
						teach_id:teach_id,
						status:status
					},
					success:function(data){
						alertify.logPosition("bottom right");
						if(data=="true"){
							alertify.success("STATUS HAS BEEN CHANGED !");
							getListTeaching();
						}else{
							
							swal('FAILED!','Status unable change','error');
						}
						
					}
				});      
				
		 } 
         function isDelete(teach_id){
   			swal({   
   			 title: "Are you sure?",   
  				 text: "You will not be able to recover this task!",   
  				 type: "warning",   
  				 showCancelButton: true,   
  				 confirmButtonColor: "#DD6B55",   
  				 confirmButtonText: "Yes, remove it!",   
  				 closeOnConfirm: false 
  	   		    }, function(){    
  	   		    	$.ajax({
  	    				url:"teach_delete",
  	    				method:"POST",
  	    				data:{
  	    					teach_id:teach_id
  	    				},
  	    				success:function(data){
  	    					if(data=="true"){
  	       						swal({
  	       							title:"REMOVED..!", 
  	       							text:"Task has been removed..!", 
  	       							type:"success",
  	       							timer:1500
  	       						},function(){
  	       							getListTeaching();
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
         function reset(){
			 $("#select-emp").select2("val","");
	         $("#select-subprog").select2("val","");
	         $("#select-class").select2("val","");
         }
         
         $("#fm-level").submit(function(e){
 			e.preventDefault();
 				assignTask();
 				
 		 });
         
         $('.card-head .tools .btn-refresh').on('click', function (e) {
     		var card = $(e.currentTarget).closest('.card');
     		materialadmin.AppCard.addCardLoader(card);
     		setTimeout(function () {
     			
     			materialadmin.AppCard.removeCardLoader(card);
     		},listBranch());
 		 });
         $('.card-head .tools .btn-refresh-list').on('click', function (e) {
      		var card = $(e.currentTarget).closest('.card');
      		materialadmin.AppCard.addCardLoader(card);
      		setTimeout(function () {
      			
      			materialadmin.AppCard.removeCardLoader(card);
      		}, getListTeaching());
  		 });
        $("#select-class").on("change" ,function(){
        	 if($("#select-emp").val()!="" && $("#select-subprog").val()!="" && $("#select-class").val()!=""){
            	 $("#btn-create").attr("disabled",false);
             }else{
            	 $("#btn-create").attr("disabled",true);
             }
        });
         </script>
</body>
</html>
