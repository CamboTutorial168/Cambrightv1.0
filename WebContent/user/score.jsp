
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | My Score</title>

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
		page="/mastertop/header.jsp"></jsp:include>

	<!-- BEGIN BASE-->
	<div id="base">
		<!-- BEGIN CONTENT-->
		<div id="content">
			<section>
				<div class="section-body">
					<div class="section-header">
						<ol class="breadcrumb">
							<li class="active">SCORE LIST</li>
						</ol>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent no-padding">
								<div
									class="card-head card-head-sm card-body style-accent no-padding">
									<header>SCORE OF THE MONTH</header>
								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="alert alert-info" role="alert">
										<strong class='text-danger'>ABBREVIATION</strong> <b>VO</b>=Vocabulary,
										<b>GR</b>=Grammar, <b>RE</b>=Reading, <b>WR</b>=Writing, <b>LI</b>=Listening,
										<b>SP</b>=Speaking, <b>PA</b>=Painting, <b>MA</b>=Math, <b>CL</b>=Class
										participation<b>ABS</b>=Absent, <b>GRA</b>=Grant Permission
										participation<b>TOT</b>=Total Score, <b>RAN</b>=RANK
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
 		scoreList();
        function initDate(){
			$('#demo-date').datepicker({
		   	 	format: 'M/yyyy',
		   	 	minViewMode: 1,
		   	 	autoclose: true,
		   	 	startDate: new Date(2016,2,1),
		   	 	endDate:new Date()
		    }).datepicker("setDate", "0");
		}
        $('#demo-date').datepicker().on("changeDate", function (ev) {
			scoreList();
        });
        
		function scoreList(){
			var monthNames = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec"];
			var token=($('#control-date').val()).split("/");
			var dateinControl=token[1]+"-"+(monthNames.indexOf(token[0])+1)+"-1";
  			$.ajax({
  				url:"scorestudlist.json",
  				method:"POST",
  				data:{
  					month:dateinControl
  				},
  				success:function(data){
  					
  					
  					$("#list-score").html(scoreListSupply(data));
  					callJTable();
  				},
  				error: function(jqXHR, exception) {
  	          		catchErr(jqXHR, exception);
  	            }
  			});
   		 }
		
		function scoreListSupply(data){
			var len=data.length;
			var table="<table class='table' id='tb_list'>";
			table+="<thead>"+
						"<tr>"+
							"<th class='sort-alpha' style='width:7%'>NAME</th>"+
							"<th class='sort-alpha' style='width:7%'>CLASS</th>"+
							"<th class='sort-alpha' style='width:10%'>TEACH</th>"+
							"<th class='sort-alpha' style='width:5%'>PRO</th>"+
							"<th class='sort-alpha' style='width:10%'>BR</th>"+
							"<th class='sort-alpha'>VO</th>"+
							"<th class='sort-numberic'>GR</th>"+
							"<th class='sort-numberic'>RE</th>"+
							"<th class='sort-numberic'>WR</th>"+
							"<th class='sort-numberic'>LI</th>"+
							"<th class='sort-numberic'>SP</th>"+
							"<th class='sort-numberic'>PA</th>"+
							"<th class='sort-numberic'>MA</th>"+
							"<th class='sort-numberic'>CL</th>"+
							"<th class='sort-numberic' style='width:4%'>ABS</th>"+
							"<th class='sort-numberic' style='width:4%'>GRA</th>"+
							"<th class='sort-numberic' style='width:6%'>TOT</th>"+
							"<th class='sort-numberic' style='width:4%'>RAN</th>"+
						"</tr>"+
					   "</thead>"+
			   		"<tbody>";
			for(var i=0;i<len;i++){
				table+= "<tr>"+
					"<td>"+data[i].stud_name+"</td>"+
					"<td><span class='badge' style='background-color:"+data[i]['class_color']+"'>"+data[i].class_title+"</span></td>"+
					"<td>"+data[i].teacher_name+"</td>"+
					"<td>"+data[i].subprog_title+"</td>"+
					"<td><span class='badge' style='background-color:"+data[i]['branch_color']+"'>"+data[i].branch_name+"</span></td>";
						table+="<td><input type='number' min='0' max='10' id='vob' class='form-control vob_"+data[i].student_id+"' required value='"+data[i].vocab+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='gr' class='form-control gr_"+data[i].student_id+"' required value='"+data[i].gr+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='re' class='form-control re_"+data[i].student_id+"' required value='"+data[i].re+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='wr' class='form-control wr_"+data[i].student_id+"' required value='"+data[i].wr+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='li' class='form-control li_"+data[i].student_id+"' required value='"+data[i].li+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='sp' class='form-control sp_"+data[i].student_id+"' required value='"+data[i].sp+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='pa' class='form-control pa_"+data[i].student_id+"' required value='"+data[i].pa+"' disabled></td>"+
								"<td><input type='number' min='0' max='10' id='ma' class='form-control ma_"+data[i].student_id+"' required value='"+data[i].ma+"' disabled></td>"+
								"<td><input type='number' min='0' max='5' id='cl' class='form-control cl_"+data[i].student_id+"' required value='"+data[i].class_part+"' disabled></td>"+
								"<td><input type='number' class='form-control' required value='"+data[i].num_absent+"' disabled></td>"+
								"<td><input type='number' class='form-control' required value='"+data[i].num_grant+"' disabled></td>"+
								"<td><input type='number' class='form-control' required value='"+data[i].total+"' disabled></td>"+
								"<td><input type='number' class='form-control' required value='"+data[i].rank+"' disabled></td>";
						
				"</tr>";
			}
			table+="</tbody></table>";
			return table;
		}
		
		function callJTable(){
       	 var tab=$('#tb_list').DataTable({searchHighlight: true});
				tab.on( 'draw', function () {
		        var body = $( tab.table().body() );
		        body.unhighlight();
		        body.highlight( tab.search() );  
		    } );
		 }
    </script>

</body>
</html>
