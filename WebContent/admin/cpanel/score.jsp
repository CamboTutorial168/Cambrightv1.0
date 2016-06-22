
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Student Score Management</title>

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
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/libs/DataTables/jquery.dataTables.css">

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
							<li class="active">STUDENTS SCORE LIST</li>
						</ol>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent no-padding">
								<div
									class="card-head card-head-sm card-body style-accent no-padding">
									<header>STUDENTS SCORE</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="alert alert-info" role="alert">
										<strong class='text-danger'>ABBREVIATION</strong> <b>VO</b>=Vocabulary,
										<b>GR</b>=Grammar, <b>RE</b>=Reading, <b>WR</b>=Writing, <b>LI</b>=Listening,
										<b>SP</b>=Speaking, <b>PA</b>=Painting, <b>MA</b>=Math, <b>CL</b>=Class
										participation
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
									<div class="table-responsive" id="list-score"></div>
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
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
        $("#score").addClass("active");
		
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
				url : "branchlistactive.json",
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
		$('#demo-date').datepicker().on("changeDate", function (ev) {
			listBranch();
        });
		var scorelist;
		function listStudInfo(){
			scoreList();
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
  					//find filter people in specific filter
  					
  					
  					/* if(people!=""){
  						var people=$.extend(true,find( ), scorelist);
  	  					console.log(people);
  	  					
  					} */
  						$("#list-score").html(listStudInfoSupply(find(people )));
	  					callJTable(); 
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
   		 }
		
		function scoreList(){
			var monthNames = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec"];
			var token=($('#control-date').val()).split("/");
			var dateinControl=token[1]+"-"+(monthNames.indexOf(token[0])+1)+"-1";
  			$.ajax({
  				url:"scorelist.json",
  				method:"POST",
  				data:{
  					month:dateinControl
  				},
  				success:function(data){
  					scorelist=data;
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
   		 }
		function searchObj(json,stuid){
			var s=[];
				 $.each(json, function(i, v) {
			        if (v.student_id == stuid[i].student_id) {
			        	s.push(stuid[i]);
			        }
			    }); 
			return s;
		}
		function find(people){
			var len=people.length;
			var rs=[];
			for(var i=0;i<len;i++){
				if(people[i].subprog_id==$("#select-subprog").val() && people[i]['cla_id']==$("#select-class").val() && people[i]['period']==$("#select-period").val()){
					rs.push(people[i]);
				}
			}
			return rs;
		}
		function listStudInfoSupply(data){
			console.log(data);
			console.log(scorelist);
			var len=scorelist.length;
			var table="<table class='table' id='tb_list'>";
			table+="<thead>"+
						"<tr>"+
							"<th class='sort-alpha' style='width:10%'>Name</th>"+
							"<th class='sort-alpha' style='width:10%'>Name</th>"+
							"<th class='sort-alpha'>VO</th>"+
							"<th class='sort-numberic'>GR</th>"+
							"<th class='sort-numberic'>RE</th>"+
							"<th class='sort-numberic'>WR</th>"+
							"<th class='sort-numberic'>LI</th>"+
							"<th class='sort-numberic'>SP</th>"+
							"<th class='sort-numberic'>PA</th>"+
							"<th class='sort-numberic'>MA</th>"+
							"<th class='sort-numberic'>CL</th>"+
							"<th>ACTION</th>"+
						"</tr>"+
					   "</thead>"+
			   		"<tbody>";
			for(var i=0;i<data.length;i++){
				var ck=false;
				table+= "<tr>"+
					"<td>"+data[i].id_card+"</td>"+
					"<td>"+data[i].en_name+"</td>";
				for(var j=0;j<len; j++){
					if((data[i].student_id==scorelist[j].student_id) && (data[i].subprog_id==scorelist[j].sub_prog_id)){ck=true;
						table+="<td><input type='number' min='0' max='10' id='vob' class='form-control vob_"+data[i].student_id+"' required value='"+scorelist[j].vocab+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='gr' class='form-control gr_"+data[i].student_id+"' required value='"+scorelist[j].gr+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='re' class='form-control re_"+data[i].student_id+"' required value='"+scorelist[j].re+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='wr' class='form-control wr_"+data[i].student_id+"' required value='"+scorelist[j].wr+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='li' class='form-control li_"+data[i].student_id+"' required value='"+scorelist[j].li+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='sp' class='form-control sp_"+data[i].student_id+"' required value='"+scorelist[j].sp+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='pa' class='form-control pa_"+data[i].student_id+"' required value='"+scorelist[j].pa+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='ma' class='form-control ma_"+data[i].student_id+"' required value='"+scorelist[j].ma+"' disabled></td>"+
								"<td><input type='number' min='0' max='5' id='cl' class='form-control cl_"+data[i].student_id+"' required value='"+scorelist[j].class_part+"' disabled></td>";
						table+= "<td style='width:10%'>";
						if(scorelist[j].status=='f'){
							table+="<button type='button' onClick=\"checkStatus('"+scorelist[j].score_id+"','t')\" class='btn ink-reaction btn-floating-action btn-xs btn-danger btn-status'  data-toggle='tooltip' data-placement='top' title='Disabled'><i class='md md-close'></i></button>";
							
						}else{
							table+="<button type='button' onClick=\"checkStatus('"+scorelist[j].score_id+"','f')\" class='btn ink-reaction btn-floating-action btn-xs btn-info btn-status'  data-toggle='tooltip' data-placement='top' title='Enabled'><i class='md md-check'></i></button>";
						}
					} 
				}
			if(scorelist==""||ck==false){
				table+="<td><input type='number' min='0' max='10' id='vob' class='form-control vob_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='gr' class='form-control gr_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='re' class='form-control re_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='wr' class='form-control wr_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='li' class='form-control li_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='sp' class='form-control sp_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='pa' class='form-control pa_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='10' id='ma' class='form-control ma_"+data[i].student_id+"' required value='0' disabled></td>"+
				"<td><input type='number' min='0' max='5' id='cl' class='form-control cl_"+data[i].student_id+"' required value='0' disabled></td>";
				table+= "<td style='width:10%'>";
			}
			
			table+=	"<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-warning "+data[i].id_card+"' data-toggle='tooltip' data-placement='top' title='Edit' onClick=\"edit('"+data[i]['student_id']+"','"+data[i].id_card+"')\" ><i class='md md-mode-edit'></i></button>"+
					"<button type='button' class='btn ink-reaction btn-floating-action btn-xs btn-primary "+data[i].id_card+"' data-toggle='tooltip' data-placement='top' title='Save' disabled onClick=\"Save('"+data[i]['student_id']+"','"+data[i].id_card+"')\" ><i class='md md-save'></i></button>"+
					"</td>"+
				"</tr>";
			}
			table+="</tbody></table>";
			return table;
		}
		function edit(class_f,class_self){
			$("[class*='_"+class_f+"']").attr("disabled",false);
			$(".btn-warning."+class_self).attr("disabled",true);
			$(".btn-primary."+class_self).attr("disabled",false);
		}
		function Save(class_f,class_self){
			var monthNames = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec"];
			var token=($('#control-date').val()).split("/");
			var dateinControl=token[1]+"-"+(monthNames.indexOf(token[0])+1)+"-1";
			var vob=$(".vob_"+class_f).val();
			var gr=$(".gr_"+class_f).val();
			var re=$(".re_"+class_f).val();
			var wr=$(".wr_"+class_f).val();
			var li=$(".li_"+class_f).val();
			var sp=$(".sp_"+class_f).val();
			var pa=$(".pa_"+class_f).val();
			var ma=$(".ma_"+class_f).val();
			var cl=$(".cl_"+class_f).val();
			
			$.ajax({
				url:"score_submit",
				type:"POST",
				data:{
					vo:vob,
					gr:gr,
					re:re,
					wr:wr,
					li:li,
					sp:sp,
					pa:pa,
					ma:ma,
					cl:cl,
					month:dateinControl,
					student_id:class_f,
					sub_prog_id:$("#select-subprog").val()
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
						alertify.success("SUBMIT SUCCESSFULLY !");
						$("[class*='_"+class_f+"']").attr("disabled",true);
						$(".btn-warning."+class_self).attr("disabled",false);
						$(".btn-primary."+class_self).attr("disabled",true);
					}else{
						swal('FAILED!','Unable to submit','error');
					}
				}
			});
			
		}
		function checkStatus(score_id,status){
			
			$.ajax({
				url:"score_status",
				type:"POST",
				data:{
					score_id:score_id,
					status:status
				},
				success:function(data){
					alertify.logPosition("bottom right");
					if(data=="true"){
						alertify.success("STATUS HAS BEEN CHANGED !");
						listStudInfo();
					}else{
						
						swal('FAILED!','Status unable change','error');
					}
					
				}
			});      
			
		}
		function callJTable(){
			$('#tb_list').DataTable();
			$('[data-toggle="tooltip"]').tooltip();
		}
    </script>

</body>
</html>
