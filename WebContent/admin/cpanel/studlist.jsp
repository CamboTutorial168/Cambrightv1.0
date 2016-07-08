
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CAMBRIGHT | Students List</title>

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
	href="${pageContext.servletContext.contextPath }/assets/css/theme-default/material-design-iconic-font.min.css" />
<!-- END MAIN CSS -->

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
							<li class="active">STUDENTS INFO LIST</li>
						</ol>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card card-outlined style-accent-dark">
								<div class="card-head card-head-sm style-accent-dark">
									<header>LIST VIEW</header>

								</div>
								<!--end .card-head -->
								<div class="card-body">
									<div class="table-responsive">
										<table id="table1" class="table">
											<thead>
												<tr>
													<th class="sort-alpha">ID</th>
													<th class="sort-alpha">FULL NAME</th>
													<th class="sort-alpha">KHMER NAME</th>
													<th>GENDER</th>
													<th class="sort-alpha">DoB</th>
													<th class="sort-alpha">BRANCH</th>
													<th class="sort-numeric">DISCOUNTED</th>
													<th class="sort-numeric">PHONE</th>

													<th>ACTION</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>TE0001</td>
													<td>Teav Chhunnong</td>
													<td>ទាវ ឈុនណង</td>
													<td>Male</td>
													<td>Oct,21 1985</td>
													<td><span class="badge style-accent-light">1</span></td>
													<td>40%</td>
													<td>010 255 452</td>

													<td>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-primary btn-status"
															data-toggle="tooltip" data-placement="top" title="Status">
															<i class="fa fa-check"></i>
														</button>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-default-dark"
															data-toggle="modal" data-target=".bs-example-modal-lg"
															data-backdrop="static" data-keyboard="false"
															data-placement="top" title="View Detail">
															<i class="md md-remove-red-eye"></i>
														</button>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-warning"
															data-toggle="tooltip" data-placement="top" title="Edit">
															<i class="fa fa-edit"></i>
														</button> <img alt=""
														src="${pageContext.servletContext.contextPath }/assets/img/icon_new.gif">
													</td>
												</tr>
												<tr>
													<td>TE0002</td>
													<td>Ly Narith</td>
													<td>ដាន​ រិទ្ធី</td>
													<td>Male</td>
													<td>Jan,21 1985</td>
													<td><span class="badge style-success">1st</span></td>
													<td>40%</td>
													<td>010 255 452</td>

													<td>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-danger btn-status"
															data-toggle="tooltip" data-placement="top" title="Status">
															<i class="fa fa-close"></i>
														</button>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-default-dark"
															data-toggle="modal" data-target=".bs-example-modal-lg"
															data-backdrop="static" data-keyboard="false"
															data-placement="top" title="View Detail">
															<i class="md md-remove-red-eye"></i>
														</button>
														<button type="button"
															class="btn ink-reaction btn-floating-action btn-xs btn-warning"
															data-toggle="tooltip" data-placement="top" title="Edit">
															<i class="fa fa-edit"></i>
														</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
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
			page="/masterleft/menubar.jsp"></jsp:include>
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
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppNavigation.js"></script>
	<script
		src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppForm.js"></script>
	<!-- END MAIN SCRIPT  -->

	<script
		src="${pageContext.servletContext.contextPath }/assets/js/libs/DataTables/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
        $("#studlist").addClass("active");
        $('[data-toggle="tooltip"]').tooltip();
        $('#table1').DataTable();
         var check=0;
			
			$(".btn-status").on("click",function(){
				$(this).children().eq(0).toggleClass("fa fa-check")
			  	 .toggleClass("fa fa-close");
		
				$(this).toggleClass("btn-danger")
			   	.toggleClass("btn-primary");
	
	 			if($(this).children().eq(0).hasClass("fa-check")){check=1;}else{check=0;} 
			 	
			 	
			});
         
         </script>
</body>
</html>
